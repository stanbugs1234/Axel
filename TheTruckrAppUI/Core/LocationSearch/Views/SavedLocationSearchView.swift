//
//  SavedLocationSearchView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 4/15/23.
//

import SwiftUI

struct SavedLocationSearchView: View {
    @StateObject var viewModel = HomeViewModel()
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
            
            LocationSearchResultsView(viewModel: viewModel,
                                      config: .saveLocation(config))
            
        }
        .navigationTitle(config.subtitle)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct SavedLocationSearchView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SavedLocationSearchView(config: .home)
        }
    }
}
