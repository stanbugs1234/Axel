//
//  VendorListView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 5/8/23.
//

import SwiftUI
import FirebaseFirestoreSwift
import FirebaseFirestore

struct VendorListView: View {
    @ObservedObject var viewModel = VendorViewModel()
    @State private var showNewVendor = false
    
    
    var body: some View {
        //MARK: No Entries View
        VStack {
            VStack {
                //MARK: Search Bar
                SearchBarView(text: $viewModel.searchText)
                    .padding()
                if viewModel.searchableVendors.count != 0 {
                    //MARK: List of Vendors
                    ScrollView {
                        LazyVStack {
                            ForEach(viewModel.searchableVendors) { vendor in
                                NavigationLink(value: vendor) {
                                    VendorListRowView(vendor: vendor)
                                }
                            }
                        }
                    }
                } else {
                    //MARK: No Entries View
                    Spacer()
                    NoEntriesView(text: "Vendor")
                    Spacer()
                }
                
                //MARK: Add New Customer Button
                VStack {
                    Button {
                        showNewVendor.toggle()
                    } label: {
                        CreateNewButton(buttonText: "Create New Vendor")
                    }
                    .fullScreenCover(isPresented: $showNewVendor) {
                        CreateNewVendorView()
                    }
                }
            }
        }
        .navigationTitle("Vendors")
        .navigationDestination(for: Vendor.self, destination: { vendor in
            VendorDetailView(vendor: vendor)
        })
    }
}


struct VendorListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            VendorListView()
        }
    }
}
