//
//  UberReservieRideView2.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 12/5/23.
//

import SwiftUI
import MapKit

struct ReservationSelectLocationView: View {
    @ObservedObject var locationViewModel: LocationSearchViewModel
    @ObservedObject var viewModel: ReservationViewModel
    let config: SavedLocatationViewModel
    @State private var mapState = MapViewState.searchingForLocation
    @State private var showConfirmationPage = false
    @State private var confirmed = false
    @Binding var path: NavigationPath
    @State private var isShowAlert = false
    
    var body: some View {
        VStack {
            //MARK: Pickup Title
            Text("Pickup Location")
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.bottom, 10)
            
            //MARK: Search Pickup Location
            VStack {
                ScheduledLocationSearchView(viewModel: viewModel, config: .pickUpLocation)
            }
            
            Spacer()
            
//            //MARK: Drop off Title
//            Text("Dropoff Location")
//                .font(.title2)
//                .fontWeight(.semibold)
//                .padding(.bottom, 10)
//            VStack {
//                ScheduledLocationSearchView(viewModel: viewModel, config: .pickUpLocation)
//            }
            
            //MARK: Button
            HStack {
                Button {
                    if viewModel.selectedUberLocation != nil {
                        showConfirmationPage.toggle()
                    } else {
                        isShowAlert = true
                    }
                } label: {
                    ButtonView(size: .medium, buttonString: "Next")
                }
                .fullScreenCover(isPresented: $showConfirmationPage, content: { ReservationRecapView(path: $path, viewModel: viewModel) })
                .alert("Location", isPresented: $isShowAlert, actions: {
                    
                }, message: {
                    Text("Need Location Selected")
                })
                .padding(.bottom, 20)
            }
        }
        .padding()
        .font(.subheadline)
        .onReceive(viewModel.$selectedUberLocation) { location in
            if location != nil {
                self.mapState = .locationSelected
            }
        }
    }
}

#Preview {
    NavigationStack{
        ReservationSelectLocationView(locationViewModel: LocationSearchViewModel(),
                                      viewModel: ReservationViewModel(),
            config: .home, path: Binding.constant(NavigationPath()))
    }
}
