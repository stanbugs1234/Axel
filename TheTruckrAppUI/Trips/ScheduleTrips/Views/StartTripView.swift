//
//  TripSelectDriverView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 6/10/23.
//

import SwiftUI

struct StartTripView: View {
    @ObservedObject var viewModel = TripViewModel()
    @StateObject var customerViewModel = CustomerViewModel()
    @StateObject var jobViewModel = JobViewModel()
    
    @State private var showAvailableDriverListView = false
    @State private var showCustomerListView = false
    @State private var showDateAndTimeView = false
    @State private var showJobListView = false
    let driverArriveType = ["Empty", "Loaded"]
    @State private var selectedDriverArriveType = "Empty"
    
    @State private var enteredDateTimeText = Date()
    @State private var enteredCustomerText = ""
    
    var body: some View {
            VStack {
                Form {
                    List{
                        Section {
                            Button {
                                showDateAndTimeView.toggle()
                            } label: {
                                HStack {
                                    Text("Trip Date: ")
                                        .font(.headline)
                                        .fontWeight(.semibold)
                                    
                                    Spacer()
                                    
                                    Text(viewModel.tripDate.formatted(.dateTime))
                                        .font(.headline)
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.secondary)
                                }
                                .foregroundColor(.themeGreen)
                            }
                            
                            HStack {
                                Button {
                                    showCustomerListView.toggle()
                                } label: {
                                    HStack {
                                        Text("Select the  Customer")
                                            .font(.headline)
                                        
                                        Spacer()
                                        
                                        Image(systemName: "chevron.right")
                                            .foregroundColor(.secondary)
                                    }
                                    .foregroundColor(.themeGreen)
                                }
                            }
                            
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
                                .foregroundColor(.themeGreen)
                            }
                            
                            Button {
                                showAvailableDriverListView.toggle()
                            } label: {
                                HStack {
                                    Text("Select the  Drivers")
                                        .font(.headline)
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.secondary)
                                }
                                .foregroundColor(.themeGreen)
                            }
                            
                            Section{
                                
                                Picker("Driver Arrive Empty", selection: $selectedDriverArriveType) {
                                    ForEach(driverArriveType, id: \.self) {
                                        Text($0)
                                    }
                                }
                                .pickerStyle(.segmented)
                            } header: {
                                Text("Driver Arrives")
                                    .fontWeight(.semibold)
                            }
                            
                            if selectedDriverArriveType == "Loaded" {
                                Button {
                                    showAvailableDriverListView.toggle()
                                } label: {
                                    HStack {
                                        Text("Select the  Vendor")
                                            .font(.headline)
                                        
                                        Spacer()
                                        
                                        Image(systemName: "chevron.right")
                                            .foregroundColor(.secondary)
                                    }
                                    .foregroundColor(.themeGreen)
                                }
                            }
                            if selectedDriverArriveType == "Loaded" {
                                Button {
                                    showAvailableDriverListView.toggle()
                                } label: {
                                    HStack {
                                        Text("Select the  Product")
                                            .font(.headline)
                                        
                                        Spacer()
                                        
                                        Image(systemName: "chevron.right")
                                            .foregroundColor(.secondary)
                                    }
                                    .foregroundColor(.themeGreen)
                                }
                            }
                            
                            
                        }
                    header: {
                        Text("Select Below to start scheduling your trip")
                    }
                        
                        ScrollView {
                            Section("Selected For Trip") {
                                List {
                                    HStack {
                                        Text("Trip Date: ")
                                            .font(.headline)
                                            .fontWeight(.semibold)
                                        
                                        Spacer()
                                        
                                        Text(viewModel.tripDate.formatted(.dateTime))
                                            .font(.headline)
                                    }
                                    .foregroundColor(.themeGreen)
                                    
                                    HStack {
                                        Text("Customer: ")
                                            .font(.headline)
                                            .fontWeight(.semibold)
                                        
                                        Spacer()
                                        
                                        Text("Hard Rock Construction")
                                            .font(.headline)
                                    }
                                    .foregroundColor(.themeGreen)
                                    
                                    HStack {
                                        Text("Customer: ")
                                            .font(.headline)
                                            .fontWeight(.semibold)
                                        
                                        Spacer()
                                        
                                        Text("")
                                            .font(.headline)
                                    }
                                    .foregroundColor(.themeGreen)
                                    
                                    HStack {
                                        Text("Job: ")
                                            .font(.headline)
                                            .fontWeight(.semibold)
                                        
                                        Spacer()
                                        
                                        Text("Mid City Group B")
                                            .font(.headline)
                                    }
                                    .foregroundColor(.themeGreen)
                                    
                                    HStack {
                                        Text("Driver: ")
                                            .font(.headline)
                                            .fontWeight(.semibold)
                                        
                                        Spacer()
                                        
                                        Text("John Solomon")
                                            .font(.headline)
                                    }
                                    .foregroundColor(.themeGreen)
                                    
                                    HStack {
                                        Text("Arrival Type: ")
                                            .font(.headline)
                                            .fontWeight(.semibold)
                                        
                                        Spacer()
                                        
                                        Text(selectedDriverArriveType)
                                            .font(.headline)
                                    }
                                    .foregroundColor(.themeGreen)
                                    
                                    if selectedDriverArriveType == "Loaded" {
                                        HStack {
                                            Text("Vendor: ")
                                                .font(.headline)
                                                .fontWeight(.semibold)
                                            
                                            Spacer()
                                            
                                            Text("PMC")
                                                .font(.headline)
                                        }
                                        .foregroundColor(.themeGreen)
                                    }
                                        
                                    if selectedDriverArriveType == "Loaded" {
                                        HStack {
                                            Text("Product: ")
                                                .font(.headline)
                                                .fontWeight(.semibold)
                                            
                                            Spacer()
                                            
                                            Text("610 Crushed Concrete")
                                                .font(.headline)
                                        }
                                        .foregroundColor(.themeGreen)
                                    }
                                }
                                .padding(4)
                            }
                        }
                    }
                    .fullScreenCover(isPresented: $showAvailableDriverListView) {
                        SelectAvailableDriverView()
                    }
                    .fullScreenCover(isPresented: $showCustomerListView) {
                        TripSelectActiveCustomerView()
                    }
                    .fullScreenCover(isPresented: $showDateAndTimeView) {
                        TripDateSelectorView(viewModel: viewModel)
                    }
                    
                    .fullScreenCover(isPresented: $showJobListView) {
                        SelectJobListTripView(viewModel: jobViewModel)
                    }
                    .navigationTitle("Schedule Trip")
                    .navigationBarTitleDisplayMode(.inline)
                }
                
                    VStack(alignment: .center) {
                        Button {
                            //Post Trip to Firebase
                        } label: {
                            ButtonView(size: .medium, buttonString: "Schedule Trip")
                        }
                        
                    }
                    .padding()
                    
                
            }
        
    }
}

struct StartTripView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            StartTripView()
        }
    }
}
