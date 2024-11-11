//
//  UberReservieRideView2.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 12/5/23.
//

import SwiftUI
import MapKit

struct UberReserveRideView2: View {
    @ObservedObject var viewModel = OrderViewModel()
    @EnvironmentObject var homeViewModel: HomeViewModel
    @ObservedObject var locationViewModel: LocationSearchViewModel
    @ObservedObject var tripViewModel: TripsViewModel
    let config: SavedLocatationViewModel
    @State private var mapState = MapViewState.noIput
    
    
    var body: some View {
        VStack {
            ReservationRecapView(tripViewModel: tripViewModel)
                .padding()
            
            //MARK: Title
            Text("Pickup Location")
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.bottom, 10)
            
            //MARK: Search Pickup Location
            HStack {
                ScheduledLocationSearchView(viewModel: tripViewModel, config: .pickUpLocation)
//                                LocationSearchView()
                ScheduledLocationResultView(viewModel: tripViewModel, config: .ride)
            }
            
            Spacer()
            
            HStack {
                NavigationLink {
                    Text("Order Page Number 3")
                } label: {
                    ButtonView(size: .medium, buttonString: "Next")
                }
            }
        }
        .padding()
        .font(.subheadline)
        .onReceive(tripViewModel.$selectedUberLocation) { location in
            if location != nil {
                self.mapState = .locationSelected
                tripViewModel.selectedUberLocation = location
            }
        }
    }
}

#Preview {
    NavigationView{
        UberReserveRideView2(locationViewModel: LocationSearchViewModel(), tripViewModel: TripsViewModel(), config: .home)
            .environmentObject(HomeViewModel())
    }
}

extension UberReserveRideView2 {
    var mapView: some View{
        ZStack(alignment: .bottom) {
            ZStack(alignment: .top) {
                MapViewRepresentable(mapState: $mapState)
                    .ignoresSafeArea()
                
                if mapState == .searchingForLocation {
                    LocationSearchView()
                } else if mapState == .noIput {
                    LocationSearchActivationView()
                        .padding(.top, 88)
                        .onTapGesture {
                            withAnimation(.spring()) {
                                mapState = .searchingForLocation
                            }
                        }
                }
            }
        }
        .edgesIgnoringSafeArea(.bottom)
//        .onReceive(LocationManager.shared.$userLocation) { location in
//            if let location = location {
//                tripViewModel.userLocation = location
//            }
//        }
        .onReceive(tripViewModel.$selectedUberLocation) { location in
            if location != nil {
                self.mapState = .locationSelected
            }
        }
//        .onReceive(homeViewModel.$trip) { trip in
//            guard let trip = trip else { return }
//            
//            withAnimation(.spring()) {
//                switch trip.state {
//                case .requested:
//                    self.mapState = .tripRequested
//                case .rejected:
//                    self.mapState = .tripRejected
//                case .accepted:
//                    self.mapState = .tripAccepted
//                }
//            }
//        }
    }
}
