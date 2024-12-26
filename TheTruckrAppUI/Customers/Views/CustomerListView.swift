//
//  CustomerListView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 5/5/23.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

struct CustomerListView: View {
    @ObservedObject var viewModel = CustomerViewModel()
    @State private var showNewCustomerView = false
    
    
    var body: some View {
        VStack {
            ScrollView {
                SearchBarView(text: $viewModel.searchText, placementString: "Search Customers...")
                    .padding(.horizontal)
                    .padding(.top)
                
                ActiveSegmentedControlView()
                
                LazyVStack {
                    ForEach(viewModel.searchableCustomers) { customer in
                        NavigationLink(value: customer) {
                            CustomerRowView(customer: customer)
                                .padding(.horizontal)
                        }
                    }
                    Spacer()
                }
            }
            VStack(alignment: .center) {
                HStack {
                    Button {
                        showNewCustomerView.toggle()
                    } label: {
                        CreateNewButton(buttonText: "Create New Customer")
                    }
                    .fullScreenCover(isPresented: $showNewCustomerView) {
                        CreateNewCustomerView()
                    }
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .keyboard) {
                DismissKeyboardButton()
            }
        }
        .navigationTitle("Customers")
        .navigationDestination(for: Customer.self, destination: { customer in
            CustomerDetailView(customer: customer)
        })
        //        .onAppear(perform: viewModel.fetchAllCustomers)
        
    }
}

struct CustomerListView_Preview: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CustomerListView()
        }
    }
}
