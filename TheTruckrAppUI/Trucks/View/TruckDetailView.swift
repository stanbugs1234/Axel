//
//  TruckDetailView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 5/2/23.
//

import SwiftUI
import MapKit

struct TruckDetailView: View {
    var truck: Truck
    var user: User
    
    @State private var mapState = MapViewState.noIput
    @EnvironmentObject var homeViewModel: HomeViewModel
    
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                //Map View
//                mapView
                
                //MARK: User Info
                TruckStatusUserRowView(user: user)
                    .padding(.bottom, 30)
                
                //MARK: Truck Status Row View
                TruckStatusRowView(truck: truck)
            }
            .padding(.horizontal)
            .foregroundColor(.themeGreen)
        }
    }
}

struct TruckDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            TruckDetailView(truck: dev2.mockTruck, user: dev2.mockUser)
                .environmentObject(HomeViewModel())
        }
    }
}

extension TruckDetailView {

    var mapView: some View{
        ZStack(alignment: .bottom) {
            ZStack(alignment: .top) {
                MapViewRepresentable(mapState: $mapState)
                    .ignoresSafeArea()
            }
        }
    }
}
