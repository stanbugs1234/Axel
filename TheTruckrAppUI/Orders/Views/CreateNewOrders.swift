//
//  CreateNewOrders.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 6/20/23.
//

import SwiftUI

struct CreateNewOrders: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var viewModel = OrderViewModel()
    @StateObject var customerViewModel = CustomerViewModel()
    @ObservedObject var jobViewModel = JobViewModel()
    
    @State private var showCustomerListView = false
    @State private var showJobListView = false
    @State private var showDateAndTimeView = false
    @State private var numberOfTrucks = 0
    @State private var orderComments = ""
    @State private var customerFullName = ""
    @State private var vendorName = ""
    @State private var jobName = ""
    @State private var tripDate = Date()
 
    
    
    
    init() {
        viewModel = viewModel.self
//        customerFullName = viewModel.customerFullName.self
//        tripDate = viewModel.tripDate.self
        
    }
    
    var body: some View {
            VStack {
                HStack {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("Cancel")
                            .foregroundColor(.primary)
                            .padding(.horizontal)
                            .padding(.vertical, 8)
                    }
                    Spacer()
                    
                    Text("Create New Order")
                        .foregroundColor(.themeGreen)
                    
                    Spacer()

                }
                
                Form {
                    List {
                        Section ("Enter Below to Create an Order") {
                            //MARK: Order Date
                            HStack {
                                Button {
                                    showDateAndTimeView.toggle()
                                } label: {
                                    HStack {
                                        Text("Order Date: ")
                                            .font(.headline)
                                            .fontWeight(.semibold)
                                        
                                        Spacer()
                                        
                                        Text(viewModel.tripDate.formatted(.dateTime))
                                            .font(.headline)
                                            .foregroundColor(.secondary)
                                        
                                        Spacer()
                                        
                                        Image(systemName: "chevron.right")
                                            .foregroundColor(.secondary)
                                    }
                                }
                            }
                            .foregroundColor(.themeGreen)
                            
                            //MARK: Customer List - NonPicker
                            Button {
                                showCustomerListView.toggle()
                            } label: {
                                HStack {
                                    Text("Select the Customer")
                                        .font(.headline)
                                        .fontWeight(.semibold)
                                        
                                    Spacer()
                                    
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.secondary)
                                }
                            }
                            .foregroundColor(.themeGreen)
                            
                            //MARK: Select Customer - Picker
                            Picker("Select Customer", selection: $viewModel.customerFullName) {
                                ForEach(customerViewModel.searchableCustomers) { customer in
                                    Text(customer.customerFullName)
                                        .fontWeight(.semibold)
                                        .tag(customer.customerFullName)
                                }
                            }
                            .tag(viewModel.customerFullName)
                            .pickerStyle(MenuPickerStyle())
                            .foregroundColor(.themeGreen)
                            .fontWeight(.semibold)
                            
                            Button {
                                showJobListView.toggle()
                            } label: {
                                HStack {
                                    Text("Select Job")
                                        .font(.headline)

                                    Spacer()
                                    
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.secondary)
                                }
                            }
                            .foregroundColor(.themeGreen)
                            
                            Picker("Number of Trucks", selection: $viewModel.numberOfTrucks) {
                                ForEach(0 ..< 100) {
                                    Text("\($0) Trucks")
                                        .tag($0)
                                }
                            }
                            .font(.headline)
                            .foregroundColor(.themeGreen)
                            
                            VStack {
                                HStack {
                                    Text("Comments:")
                                        .font(.headline)
                                        .fontWeight(.semibold)
                                        .foregroundColor(.themeGreen)
                                    
                                    Spacer()
                                }
                                
                                TextField(text: $viewModel.orderComments) {
                                    Text("Enter Comments")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                        .multilineTextAlignment(.leading)
                                }
                                .multilineTextAlignment(.leading)
                                
                                Spacer()
                                
                            }

                        }
                    }
                    .padding(5)
                    .fullScreenCover(isPresented: $showCustomerListView) {
                        TripSelectActiveCustomerView()
                    }
                    
                    .fullScreenCover(isPresented: $showJobListView) {
                        SelectJobListTripView(viewModel: jobViewModel)
                    }
                    .fullScreenCover(isPresented: $showDateAndTimeView) {
                        OrderDateTimeSelectionView(viewModel: viewModel)
                    }
                    
                    List {
                        Section ("Selected For Trip"){
                            HStack {
                                Text("Order Date: ")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                
                                Spacer()
                                
                                Text(viewModel.tripDate.formatted(.dateTime))
                                    .font(.headline)
                                    .foregroundColor(.secondary)
                            }
                            .foregroundColor(.themeGreen)
                            
                            HStack {
                                Text("Customer: ")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                
                                Spacer()
                                
                                Text(viewModel.customerFullName)
                                    .font(.headline)
                                    .foregroundColor(.secondary)
                            }
                            .foregroundColor(.themeGreen)
                            
                            HStack {
                                Text("Job: ")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                
                                Spacer()
                                
                                Text("Bayou St. John")
                                    .font(.headline)
                                    .foregroundColor(.secondary)
                            }
                            .foregroundColor(.themeGreen)
                            
                            HStack {
                                Text("Number of Trucks: ")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                
                                Spacer()
                                
                                Text(viewModel.numberOfTrucks.description)
                                    .font(.headline)
                                    .foregroundColor(.secondary)
                            }
                            .foregroundColor(.themeGreen)
                            
                            VStack(alignment: .leading) {
                                Text("Order Comments: ")
                                    .font(.headline)
                                
                                Spacer()
                                
                                Text(viewModel.orderComments)
                                    .multilineTextAlignment(.leading)
                                    .foregroundColor(.secondary)
                            }
                            .foregroundColor(.themeGreen)
                        }
                        HStack {
                            Spacer()
                            Button {
                                viewModel.uploadOrder(orderDate: viewModel.tripDate, customerName: customerFullName, jobName: viewModel.jobName, numberOfTrucks: viewModel.numberOfTrucks, vendorName: viewModel.vendorName, orderComments: viewModel.orderComments)
                            } label: {
                                CreateNewButton(buttonText: "Create Order")
                            }

                            Spacer()
                        }
                    }
                }

            }
            .navigationTitle("Create an Order")
            .navigationBarTitleDisplayMode(.inline)
            .onReceive(viewModel.$didUploadOrder) {success in
                if success {
                    presentationMode.wrappedValue.dismiss()
                }
            }
            .toolbar {
                ToolbarItem(placement: .keyboard) {
                    DismissKeyboardButton()
                }
            }
    }
}

struct CreateNewOrders_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CreateNewOrders()
        }
    }
}
