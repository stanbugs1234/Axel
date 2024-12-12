//
//  DriverNavigationView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 12/4/24.
//

import SwiftUI
import MapKit

struct DriverNavigationView: View {
    @State private var mapState = MapViewState.noIput
    @EnvironmentObject var homeViewModel: HomeViewModel
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ZStack(alignment: .top) {
                MapViewRepresentable(mapState: $mapState)
                    .ignoresSafeArea()
            }
        }
    }
}

#Preview {
    DriverNavigationView()
        .environmentObject(HomeViewModel())
}
