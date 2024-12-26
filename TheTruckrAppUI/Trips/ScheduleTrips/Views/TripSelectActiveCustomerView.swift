//
//  TripSelectActiveCustomerView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 6/10/23.
//

import SwiftUI

struct TripSelectActiveCustomerView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.editMode) var editMode
    @ObservedObject var viewModel = OrderViewModel()
    @ObservedObject var customerViewModel = CustomerViewModel()
    @State private var showNewCustomerView = false
    @State private var customerIsSelected = false
    //    @Published var selectedCustomers = Customer()
    @State var selectedCustomers = ""
    @State private var isEditing = false
    
    var body: some View {
        NavigationView{
            VStack {
                //                HStack {
                //                    Button {
                //                        presentationMode.wrappedValue.dismiss()
                //                    } label: {
                //                        Text("Cancel")
                //                            .foregroundColor(.black)
                //                            .padding(.vertical, 8)
                //                            .padding(.leading)
                //                    }
                //
                //                    Spacer()
                //
                //                    Text("Select Customer")
                //                        .fontWeight(.semibold)
                //                        .foregroundColor(.black)
                //                    //                    .padding(.horizontal)
                //                        .padding(.vertical, 8)
                //                        .padding(.trailing)
                //
                //                    Spacer()
                //
                //                    Button {
                //                        showNewCustomerView.toggle()
                //                    } label: {
                //                        Image(systemName: "plus")
                //                            .foregroundColor(.black)
                //                            .padding(.trailing)
                //                    }
                //                }
                
                SearchBarView(text: $customerViewModel.searchText, placementString: "Search...")
                    .padding()
                
                List {
                    //                ScrollView {
                    //            Z       LazyVStack {
                    ForEach(customerViewModel.searchableCustomers, id:\ .customerId) { customer in
//                        Button {
//                         
//                        } label: {
//                            CustomerRowView(customer: customer)
//                                .tag(customer.customerFullName)
//                        }
                        
                        
                                                Button {
                                                    $viewModel.customerFullName
//                                                    presentationMode.wrappedValue.dismiss()
                                                } label: {
                                                    CustomerRowView(customer: customer)
                                                        .tag(customer.customerFullName)
                                                }
                        
                    }
                    
                    Spacer()
                    //                }
                        .navigationBarTitle("Selected \(selectedCustomers.count)")
                    //List Style
                    //Will need to change to tool bar
                        .navigationBarItems(leading: Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }, label: {
                            Text("Cancel")
                                .foregroundColor(.black)
                                .padding(.vertical, 8)
                                .padding(.leading)
                        }),trailing: Button(action: {
                            isEditing.toggle()
                        }, label: {
                            if self.isEditing {
                                Text("Done")
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                            } else {
                                Text("Edit")
                                    .foregroundColor(.black)
                            }
                        }))
                        .listStyle(.inset)
                    //Environment
                        .environment(\.editMode, .constant(self.isEditing ? .active : .inactive))
                    
                    // animation
                        .animation(.spring(), value: isEditing)
                        .fullScreenCover(isPresented: $showNewCustomerView) {
                            CreateNewCustomerView()
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
        }
    }
}

struct TripSelectActiveCustomerView_Previews: PreviewProvider {
    static var previews: some View {
        TripSelectActiveCustomerView()
    }
}

extension TripSelectActiveCustomerView {
    func selectedCustomer() {
        
    }
}
