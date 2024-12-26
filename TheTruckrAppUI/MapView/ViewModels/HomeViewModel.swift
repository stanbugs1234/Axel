//
//  HomeViewModel.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 4/15/23.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift
import FirebaseFirestore
import Combine
import CoreLocation
import MapKit
import FirebaseStorage

class HomeViewModel: NSObject, ObservableObject {
    //MARK: - Properties
    
    @Published var drivers = [User]()
    @Published var trip: Trip?
    private let service = UserService.shared
    private var cancellables = Set<AnyCancellable>()
    private var currentUser: User?
    @Published var selectedUberLocation: UberLocation?
    @Published var searchText = ""
    @Published var userAddress: String?
    @Published var formattedUserAddress: String?
    
    //Location Search Properties
    @Published var results = [MKLocalSearchCompletion]()
    
    @Published var pickupTime: String?
    @Published var dropOffTime: String?
    private let searchCompleter = MKLocalSearchCompleter()
    var userLocation: CLLocationCoordinate2D?
    
    var queryFragment: String = "" {
        didSet {
            searchCompleter.queryFragment = queryFragment
        }
    }
    
    var searchableUsers: [User] {
        if searchText.isEmpty {
            return drivers
        } else {
            let lowercasedQuery = searchText.lowercased()
            
            return drivers.filter ({
                $0.fullname.lowercased()
                    .contains(lowercasedQuery) ||
                $0.email.lowercased()
                    .contains(lowercasedQuery)
            })
        }
    }
    
    //MARK: - LifeCycle
    
    override init() {
        super.init()
        fetchUser()
        searchCompleter.delegate = self
        searchCompleter.queryFragment = queryFragment
    }
    
    //MARK: USER API
    
    func fetchUser() {
        service.$currentUser
            .sink { user in
                self.currentUser = user
                self.getUserLocationAddress()
                
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
}


//MARK: - Passenger API
extension HomeViewModel {
    
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
    
    func requestTrip() {
        guard let driver = drivers.first else {return}
        guard let currentUser = currentUser else {return }
        guard let dropoffLocation = selectedUberLocation else {return}
        let dropoffGeoPoint = GeoPoint(latitude: dropoffLocation.coordinate.latitude,
                                       longitude: dropoffLocation.coordinate.longitude)
        let userLocation = CLLocation(latitude: currentUser.coordinates.latitude,
                                      longitude: currentUser.coordinates.longitude)
        
        
        getPlacemark(forLocation: userLocation) { placemark, error in
            guard let placemark = placemark else {return}
            
            //            print("DEBUG: Placemark for user location is \(String(describing: placemark.name))")
            
            let tripCost = self.computeRidePrice(forType: .triaxle)
            
            let trip = Trip(
                dispatcherUid: currentUser.id ?? "",
                driverUid: driver.id ?? "",
                dispatcherName: currentUser.fullname,
                driverName: driver.fullname,
                dispatcherLocation: currentUser.coordinates,
                driverLocation: driver.coordinates,
                pickupLocationName: placemark.name ?? "Current Location",
                dropoffLocationName: dropoffLocation.title,
                pickupLocationAddress: self.addressFromPlacemark(placemark),
                pickupLocation: currentUser.coordinates,
                dropoffLocation: dropoffGeoPoint,
                tripCost: tripCost,
                distanceToPassenger: 0,
                travelTimeToPassenger: 0,
                state: .requested
            )
            
            guard let encodedUTrip = try? Firestore.Encoder().encode(trip) else { return }
            Firestore.firestore().collection("trips").document()
                .setData(encodedUTrip) { _ in
                    print("DEBUG: Did upload trip to firestore")
                }
        }
    }
}

//MARK: - Driver API
extension HomeViewModel {
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
    
    func rejectTrip(){
        updateTripState(state: .rejected)
    }
    
    func acceptTrip(){
        updateTripState(state: .accepted)
    }
    
    private func updateTripState( state: TripState) {
        guard let trip = trip else {return}
        
        var data = ["state": state.rawValue]
        
        if state == .accepted {
            data["travelTimeToPassenger"] = trip.travelTimeToPassenger
        }
        
        Firestore.firestore().collection("trips").document(trip.id).updateData(data) { _ in
            print("DEBUG: did update trip with state \(state)")
        }
    }
}


//MARK: - Location Search Helpers

extension HomeViewModel {
    
    //MARK: Stan Attempt to Get UserLocation Placemark
    func getUserLocationAddress() {
        self.userLocation = LocationManager.shared.userLocation
        let userLocation = CLLocation(latitude: self.userLocation?.latitude ?? 0.0,
                                      longitude: self.userLocation?.longitude ?? 0.0)
        
        //Get Placemark
        getPlacemark(forLocation: userLocation) { placemark, error in
            guard let placemark = placemark else {return}
            
            
            //Convert Placemark to String
            let userAddress = self.addressFromPlacemark(placemark)
            self.userAddress = userAddress
            
        }
    }
    
    
    func addressFromPlacemark(_ placemark: CLPlacemark) -> String {
        var result = ""
        
        if let thoroughfare = placemark.thoroughfare {
            result += thoroughfare
        }
        
        if let subthoroughfare = placemark.subThoroughfare {
            result += " \(subthoroughfare)"
        }
        
        if let subadministrativeArea = placemark.subAdministrativeArea {
            result += ", \(subadministrativeArea)"
        }
        
        return result
    }
    
    func getPlacemark(forLocation location: CLLocation, completion: @escaping(CLPlacemark?, Error?) -> Void) {
        CLGeocoder().reverseGeocodeLocation(location) { placemarks, error in
            if let error = error {
                completion(nil, error)
                return
            }
            
            guard let placemark = placemarks?.first else {return}
            completion(placemark, nil)
        }
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
                self.selectedUberLocation = UberLocation(title: localSearch.title, subtitle: localSearch.subtitle,
                                                         coordinate: coordinate)
            case .saveLocation(let viewModel):
                guard let uid = Auth.auth().currentUser?.uid else { return }
                let savedLocation = SavedLocation(title: localSearch.title,
                                                  address: localSearch.subtitle,
                                                  coordinates: GeoPoint(latitude: coordinate.latitude,
                                                                        longitude: coordinate.longitude))
                guard let encodedLocation = try? Firestore.Encoder().encode(savedLocation) else {return}
                
                Firestore.firestore().collection("users").document(uid).updateData([
                    viewModel.databaseKey: encodedLocation
                ])
            }
        }
    }
    
    func locationSearch(forLocalSearchCompletion localSearch: MKLocalSearchCompletion,
                        completion: @escaping MKLocalSearch.CompletionHandler) {
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = localSearch.title.appending(localSearch.subtitle)
        let search = MKLocalSearch(request: searchRequest)
        
        search.start(completionHandler: completion)
    }
    
    func computeRidePrice(forType type: RideType) -> Double {
        guard let destCoordinate = selectedUberLocation?.coordinate else {return 0.0}
        guard let userCoordinate = self.userLocation else {return 0.0}
        
        let userLocation = CLLocation(latitude: userCoordinate.latitude,
                                      longitude: userCoordinate.longitude)
        let destination = CLLocation(latitude: destCoordinate.latitude,
                                     longitude: destCoordinate.longitude)
        let tripDistanceInMeters = userLocation.distance(from: destination)
        return type.computePrice(for: tripDistanceInMeters)
        
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
}

//MARK: - MKLocalsearchcompleterDelegate

extension HomeViewModel: MKLocalSearchCompleterDelegate {
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        self.results = completer.results
    }
}

//MARK: Photo: API

extension HomeViewModel {
    func saveImage(user: User, photo: Photo, image: UIImage) async -> Bool {
        guard let user = currentUser else {
            print("DEBUG: Error --- User Id is Nil")
            return false
        }
        let photoName = UUID().uuidString // This will be the name of the image file
        let storage = Storage.storage() // Create a Firebase Storage Instance
        let storageRef = storage.reference().child("\(user)\(photoName).jpeg")
        
        guard let resizedImage = image.jpegData(compressionQuality: 0.2) else {
            print("DEBUG: Could not resize image")
            return false
        }
        
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpg" //Setting metada allows you to see console image in the web browser.  This setting will for png as well as jpeg
        
        var imageURLstring = ""
        
        do {
            let _ = try await storageRef.putDataAsync(resizedImage, metadata: metadata)
            print("DEBUG: Image Saved!")
            do {
                let imageURL = try await storageRef.downloadURL()
                imageURLstring = "\(imageURL)"
            } catch {
                print("DEBUG: Could not get imageURL after saving image \(error.localizedDescription)")
                return false
            }
        } catch {
            print("DEBUG: Uploading image to Firebase Storage")
            return false
        }
        //NOw save to the photos collection of the spot document
        let db = Firestore.firestore()
        let collectionString = "user/\(user.id)/photos"
        
        do {
            var newPhoto = photo
            newPhoto.imageURLString = imageURLstring
            try await db.collection(collectionString).document(photoName).setData(newPhoto.dictionary)
            print("DEBUG: Data updated successfully")
            return true
        } catch {
            print("DEBUG: Could not update data in photos for userID \(user.id)")
            return false
        }
    }
    
    //MARK: Greeting Message
    var greetingMessage: String {
        let hour = Calendar.current.component(.hour, from: Date())
        if hour < 12 { return "Good morning, " }
        if hour < 18 { return "Good afternoon, " }
        return "Good evening, "
    }
    

}

