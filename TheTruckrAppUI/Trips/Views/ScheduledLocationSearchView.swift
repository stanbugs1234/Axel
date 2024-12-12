//
//  ScheduledLocationSearchView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 6/13/24.
//

import SwiftUI

struct ScheduledLocationSearchView: View {
    @ObservedObject var viewModel: ReservationViewModel
    let config: SavedLocatationViewModel
    
    var body: some View {
        VStack {
                TextField("Search for a location.. ",
                          text: $viewModel.queryFragment)
                    .frame(height: 32)
                    .padding(.leading)
                    .background(Color(.systemGray5))
                    .padding()
            
            Spacer()
            
            ScheduledLocationResultView(viewModel: viewModel,
                                      config: .ride)
           
            
        }
        .navigationTitle(config.subtitle)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ScheduledLocationSearchView(viewModel: ReservationViewModel(),
                                config: .pickUpLocation)
}
