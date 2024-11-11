//
//  CustomerDetailView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 5/6/23.
//

import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

struct CustomerDetailView: View {
    let customer: Customer
    
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                //MARK: CustomerDetailHeaderView
                VStack(alignment: .leading, spacing: 4) {
                    CustomerDetailHeaderView(customer: customer)
                }
                .padding(.horizontal)
            }
            
            //option list
            optionListCustomerDetailView
        }
        .navigationTitle("Customer Details")
        .navigationBarTitleDisplayMode(.inline)
    }
    
}


struct CustomerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            CustomerDetailView(customer: dev2.mockCustomer)
        }
    }
}

extension CustomerDetailView {
    var optionListCustomerDetailView: some View {
        List{
            ForEach(ModelCustomerDetailView.allCases) { viewModel in
                NavigationLink(value: viewModel) {
                    CustomerDetailOptionView(viewModel: viewModel)
                        .padding(.top)
                }
            }
        }
        .navigationDestination(for: ModelCustomerDetailView.self) { viewModel in
            switch viewModel {
            case .info:
                CustomerInfoView(customer: customer)
            case .jobs:
                JobListView()
            case .trips:
                Text("Trips")
            case .tickets:
                Text("Tickets")
            case .invoices:
                Text("Invoices")
            case .scheduleTrips:
                ScheduleTripView()
            case .contacts:
                Text("Contacts")
            }
        }
    }
}
