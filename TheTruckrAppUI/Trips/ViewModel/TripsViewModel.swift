//
//  TripsViewModel.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 11/6/23.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift
import FirebaseFirestore
import Combine
import MapKit
import FirebaseStorage

class TripsViewModel: NSObject, ObservableObject, MKLocalSearchCompleterDelegate {
    @Published var drivers = [User]()
    @Published var trip: Trip?
    private let service = UserService.shared
    private var cancellables = Set<AnyCancellable>()
    private var currentUser: User?
    @Published var selectedUberLocation: UberLocation?
    @Published var searchText = ""
    
    @Published var dateSelected = Date()
    
    //Location Search Properties
    @Published var results = [MKLocalSearchCompletion]()
    
    @Published var pickupTime: String?
    @Published var dropOffTime: String?
    private let searchCompleter = MKLocalSearchCompleter()
    @Published var trips = [Trip] ()
    
    var queryFragment: String = "" {
        didSet {
            searchCompleter.queryFragment = queryFragment
        }
    }
    
    let uid =  UserService.shared.currentUser?.uid
    
    var searchableTrips: [Trip] {
        if searchText.isEmpty {
            return trips
        } else {
            let loweredcasedQuery = searchText.lowercased()
            
            return trips.filter({
                $0.dispatcherName.lowercased()
                    .contains(loweredcasedQuery) ||
                $0.pickupLocationName.lowercased()
                    .contains(loweredcasedQuery) ||
                $0.dropoffLocationName.lowercased()
                    .contains(loweredcasedQuery)
            })
        }
    }
    
    let tripService = TripService()
    
    override init() {
        super.init()
        fetchUser()
        searchCompleter.delegate = self
        searchCompleter.queryFragment = queryFragment
    }
    //    init() {
    //        fetchUserTrips(forUid: uid ?? "") { trips in
    //            self.trips = trips
    //        }
    //    }
    //MARK: USER API
    
    func fetchUser() {
        service.$currentUser
            .sink { user in
                self.currentUser = user
                guard let user = user else {return}
                
                if user.accountType == .dispatcher {
                    self.fetchDrivers()
                    self.addTripObserverForPassenger()
                } else {
                    self.fetchTrips()
                }
            }
            .store(in: &cancellables)
    }
    
    func addTripObserverForPassenger() {
        guard let currentUser = currentUser, currentUser.accountType == .dispatcher else {return}
        
        Firestore.firestore().collection("trips")
            .whereField("dispatcherUid", isEqualTo: currentUser.id)
            .addSnapshotListener { snapshot, _ in
                guard let change = snapshot?.documentChanges.first,
                      change.type == .added
                        || change.type == .modified else {return}
                
                guard let trip = try? change.document.data(as: Trip.self) else {return}
                self.trip = trip
                print("DEBUG: Updated trip state is \(trip.state)")
            }
    }
    
    func fetchDrivers() {
        Firestore.firestore().collection("users")
            .whereField("accountType", isEqualTo: AccountType.driver.rawValue)
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else { return }
                let drivers = documents.compactMap({ try? $0.data(as: User.self) })
                self.drivers = drivers
                
                //print("DEBUG: Drivers \(drivers)")
            }
    }
    
    
    func fetchAllTrips() {
        tripService.fetchJobs  { trips in
            self.trips = trips
        }
    }
    
    func fetchTrips () {
        guard let currentUser = currentUser else { return }
        
        Firestore.firestore().collection("trips")
            .whereField("driverUid", isEqualTo: currentUser.id)
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents, let document = documents.first else {return}
                guard let trip = try? document.data(as: Trip.self) else {return}
                
                self.trip = trip
                
                self.getDestinationRoute(from: trip.dropoffLocation.toCoordinate(), to: trip.pickupLocation.toCoordinate()) { route in
                    print("DEBUG: Distance from passenger \(route.distance.distanceInMilesString())")
                    self.trip?.travelTimeToPassenger = Int(route.expectedTravelTime / 60)
                    self.trip?.distanceToPassenger = route.distance
                }
            }
    }
    
    func getDestinationRoute(from userLocation: CLLocationCoordinate2D,
                             to destination: CLLocationCoordinate2D,
                             completion: @escaping(MKRoute) -> Void) {
        let userPlacemark = MKPlacemark(coordinate: userLocation)
        let destPlacemark = MKPlacemark(coordinate: destination)
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: userPlacemark)
        request.destination = MKMapItem(placemark: destPlacemark)
        let directions = MKDirections(request: request)
        
        directions.calculate { response, error in
            if let error = error {
                print("DEBUG: Failed to get directions with error \(error.localizedDescription)")
                return
            }
            
            guard let route = response?.routes.first else { return }
            self.configurePickupAndDropoffTimes(with: route.expectedTravelTime)
            completion(route)
        }
    }
    
    func configurePickupAndDropoffTimes(with expectedTravelTime: Double) {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        
        pickupTime = formatter.string(from: Date())
        dropOffTime = formatter.string(from: Date() + expectedTravelTime)
    }
    
    func fetchUserTrips(forUid uid: String, completion: @escaping ([Trip]) -> Void) {
        Firestore.firestore().collection("trips")
            .whereField("dispatcherUid", isEqualTo: uid)
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else {return}
                let trip = documents.compactMap({
                    try? $0.data(as: Trip.self)
                })
                completion(trip)
            }
    }
    
    func locationSearch(forLocalSearchCompletion localSearch: MKLocalSearchCompletion,
                        completion: @escaping MKLocalSearch.CompletionHandler) {
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = localSearch.title.appending(localSearch.subtitle)
        let search = MKLocalSearch(request: searchRequest)
        
        search.start(completionHandler: completion)
    }
    
    func selectLocation(_ localSearch: MKLocalSearchCompletion, config: LocationResultsViewConfig) {
        locationSearch(forLocalSearchCompletion: localSearch) { response, error in
            if let error = error{
                print("DEBUG: Location search failed with error \(error.localizedDescription)")
                return
            }
            guard let item = response?.mapItems.first else { return }
            let coordinate = item.placemark.coordinate
            
            switch config {
            case .ride:
                self.selectedUberLocation = UberLocation(title: localSearch.title,
                                                         coordinate: coordinate)
            case .saveLocation(let viewModel):
                guard let uid = Auth.auth().currentUser?.uid else { return }
                let savedLocation = SavedLocation(title: localSearch.title,
                                                  address: localSearch.subtitle,
                                                  coordinates: GeoPoint(latitude: coordinate.latitude,
                                                                        longitude: coordinate.longitude))
                guard let encodedLocation = try? Firestore.Encoder().encode(savedLocation) else {return}
                
                //TODO: Save to the Reserved Trip Database
                //                Firestore.firestore().collection("users").document(uid).updateData([
                //                    viewModel.databaseKey: encodedLocation
                //                ])
            }
        }
    }
}


