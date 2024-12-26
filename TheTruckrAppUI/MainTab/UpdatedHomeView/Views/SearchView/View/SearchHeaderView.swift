//
//  SearchHeaderView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 12/24/24.
//

import SwiftUI

struct SearchHeaderView: View {
    @EnvironmentObject var viewModel: UpdatedHomeViewModel
    
    var body: some View {
        //MARK: Search Bar
        SearchBarView(text: $viewModel.searchText, placementString: "Search \(AppConstants.appName)")
            

    }
}

#Preview {
    SearchHeaderView()
        .environmentObject(UpdatedHomeViewModel())
}
