//
//  FeaturedNavView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 12/18/24.
//

import SwiftUI

struct FeaturedNavView: View {
    @EnvironmentObject var updatedHomeViewModel: UpdatedHomeViewModel
    let viewModel: FeaturedViewModel
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            ForEach(viewModel.vendors) { vendor in
                NavigationLink {
                    UpdatedVendorDetailView(vendor: vendor)
                } label: {
                    FeaturedRowView(vendor: vendor)
                        .padding(.vertical, 4)
                }
            }
            .padding(.vertical, 16)
        }
        .padding(.horizontal, 16)
        .navigationTitle(Text("Featured on \(AppConstants.appName)"))
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        FeaturedNavView(viewModel: FeaturedViewModel())
            .preferredColorScheme(.dark)
            .environmentObject(UpdatedHomeViewModel())
    }
}
