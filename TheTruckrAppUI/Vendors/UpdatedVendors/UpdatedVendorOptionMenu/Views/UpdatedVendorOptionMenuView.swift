//
//  UpdatedVendorOptionMenuView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 12/21/24.
//

import SwiftUI

struct UpdatedVendorOptionMenuView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var updatedHomeViewModel: UpdatedHomeViewModel
    @ObservedObject var vendorViewModel: VendorRowViewModel
    
    init(vendor: Vendor) {
        self.vendorViewModel = VendorRowViewModel(vendor: vendor)
        self.vendor = vendor
    }

    let vendor: Vendor
    
    var body: some View {
        HStack {
            VStack {
                ForEach(VendorOptionMenuEnum.allCases) { viewModel in
                    NavigationLink(value: viewModel) {
                        
                        VendorOptionRowView(viewModel: viewModel)
                            .padding(.horizontal)
                        
                    }
                    .navigationDestination(for: VendorOptionMenuEnum.self) { viewModel in
                        switch viewModel {
                        case .groupOrder:
                            Text("Group Order")
                                .presentationDetents(.init([.large]))
                        case .schedule:
                            Text("Schedule")
                        case .addFavorites:
                            Text("Favorites")
                        case .vendorInfo:
                            UpdatedVendorInfoView(vendor: vendor)
                                .presentationDetents(.init([.large]))
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        UpdatedVendorOptionMenuView(vendor: MockData.vendors[0])
            .preferredColorScheme(.dark)
            .environmentObject(UpdatedHomeViewModel())
    }
}
