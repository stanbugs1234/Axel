//
//  VendorDetailView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 5/8/23.
//

import SwiftUI

struct VendorDetailView: View {
    let vendor: Vendor
    
    var body: some View {
        let abbreviatedName = initials(from: vendor.vendorFullName)
        
        ScrollView(showsIndicators: false) {
            VendorDetailHeaderView(vendor: vendor)
            
            Divider()
            
            VendorDetailStatView()
            
            Divider()
            
            //Option list
            ForEach(VendorDetailViewModel.allCases) { viewModel in
                NavigationLink(value: viewModel) {
                    VendorDetailOptionView (viewModel:  viewModel)
                        .padding()
                }
            }
        }
        .navigationDestination(for: VendorDetailViewModel.self) { viewModel in
            switch viewModel {
            case .scheduleTrips:
                ScheduleTripView()
            case .info:
                VendorInfoView(vendor: vendor)
            case .jobs:
                JobListView()
            case .trips:
                Text("Trips")
            case .tickets:
                Text("Tickets")
            case .invoices:
                Text("Invoices")
            case .products:
                ProductListView()
            case .locations:
                Text("Locations")
            case .contacts:
                ContactListView()
            }
        }
        .navigationTitle("\(vendor.vendorFullName) Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct VendorDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            VendorDetailView(vendor: dev2.mockVendor)
        }
    }
}
