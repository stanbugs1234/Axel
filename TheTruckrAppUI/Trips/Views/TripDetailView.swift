//
//  TripDetailView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 11/6/23.
//

import SwiftUI
import MapKit

struct TripDetailView: View {
    @State private var mapState = MapViewState.noIput
    @EnvironmentObject var authViewModel: AuthViewModel
    @EnvironmentObject var homeViewModel: HomeViewModel
    
    let trip: Trip
    
    var body: some View {
        VStack {
            //MARK: Map
            mapView
                .frame(width: 370, height: 325, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            Divider()
            ScrollView() {
                VStack(alignment: .leading) {
                    HStack {
                        Spacer()
                        
                        Text("Trip Details")
                            .font(.title2)
                            .fontWeight(.semibold)
                        
                        Spacer()
                    }
                    .padding(.bottom, 4)
                    
                    HStack {
                        Text("Driver: ")
                            .fontWeight(.bold)
                        
                        Text(trip.driverName)
                    }
                    .padding(.bottom, 4)
                    
                    HStack {
                        Text("Pick Up Location: ")
                            .fontWeight(.semibold)
                        
                        Text(trip.pickupLocationName)
                    }
                    .padding(.bottom, 4)
                    
                    HStack {
                        Text("Drop Off Location: ")
                            .fontWeight(.semibold)
                        
                        Text(trip.dropoffLocationName)
                    }
                    .padding(.bottom, 4)
                    
                    HStack {
                        Text("Trip Time: ")
                            .fontWeight(.semibold)
                        
                        Text(trip.travelTimeToPassenger.description)
                        Text("Min")
                    }
                    .padding(.bottom, 4)
                    
                    HStack {
                        Text("Trip Distance: ")
                            .fontWeight(.semibold)
                        
                        Text(trip.distanceToPassenger.distanceInMilesString())
                        Text("Mi")
                    }
                    .padding(.bottom, 4)
                    
                    HStack {
                        Text("Amount")
                            .fontWeight(.semibold)
                        
                        Text(trip.tripCost.toCurrency())
                    }
                    .padding(.bottom, 4)
                }
                .padding(.leading)
                .padding(.vertical)
            }
            .foregroundColor(.themeGreen)

            Spacer()
        }
        .navigationTitle("Trip Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

extension TripDetailView {
    var mapView: some View{
        ZStack(alignment: .bottom) {
            ZStack(alignment: .top) {
                MapViewRepresentable(mapState: $mapState)
                //                    .ignoresSafeArea()
                    .cornerRadius(15)
                
                if mapState == .searchingForLocation {
                    LocationSearchView()
                } else if mapState == .noIput {
                    LocationSearchActivationView()
                        .padding(.top, 88)
                }
            }
        }
        
        .onReceive(LocationManager.shared.$userLocation) { location in
            if let location = location {
                homeViewModel.userLocation = location
            }
        }
        //        .onReceive(LocationManager.shared.$ticketPickUp) { location in
        //            if var location = location {
        //                self.trip.pickupLocation = location
        //            }
        //        }
        
        
        .onReceive(homeViewModel.$selectedUberLocation) { location in
            if location != nil {
                self.mapState = .locationSelected
            }
        }
        .onReceive(homeViewModel.$trip) { trip in
            guard let trip = trip else { return }
            
            withAnimation(.spring()) {
                switch trip.state {
                case .requested:
                    self.mapState = .tripRequested
                case .rejected:
                    self.mapState = .tripRejected
                case .accepted:
                    self.mapState = .tripAccepted
                }
            }
        }
    }
}


struct TripDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TripDetailView(trip: dev2.mockTrip)
                .environmentObject(HomeViewModel())
                .environmentObject(AuthViewModel())
        }
    }
}
