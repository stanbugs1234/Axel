//
//  CustomerInfoView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 5/19/23.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

struct CustomerInfoView: View {
    let customer: Customer
    @ObservedObject var jobViewModel = JobViewModel()
    
    @FirestoreQuery(collectionPath: "jobs") var jobs: [Job]
    @FirestoreQuery(collectionPath: "invoices") var invoices: [Invoice]
    @FirestoreQuery(collectionPath: "trips") var trips: [Trip]
    @FirestoreQuery(collectionPath: "orders") var orders: [Order]
    
    var body: some View {
        let invoiceCount = invoices.count
        let jobCount = jobs.count
        let tripCount = trips.count
        let orderCount = orders.count
        
        VStack {
            HStack {
                Text(customer.customerFullName)
                    .font(.title2)
                    .fontWeight(.semibold)
            }
            .foregroundColor(.themeGreen)
            
            List {
                Section ("General Information"){
                    HStack {
                        Text("Customer: ")
                            .foregroundColor(.themeGreen)
                            .fontWeight(.semibold)
                        
                        Spacer()
                        
                        Text(customer.customerFullName)
                    }
                    
                    HStack {
                        Text("Address: ")
                            .foregroundColor(.themeGreen)
                            .fontWeight(.semibold)
                        
                        Spacer()
                        
                        Text(customer.customerAddress)
                    }
                    
                    HStack {
                        Text("Status: ")
                            .foregroundColor(.themeGreen)
                            .fontWeight(.semibold)
                        Spacer()
                        
                        //Need to link to Customer Status
                        Text(customer.customerState.title)
                    }
                    HStack {
                        Text("Created Date: ")
                            .foregroundColor(.themeGreen)
                            .fontWeight(.semibold)
                        
                        Spacer()
                        
                        Text(customer.timestamp.dateValue().dateDisplayFormat)
                    }
                }
                
                //MARK: Customer Breakdown
                Section("Customer Breakdown") {
                    HStack {
                        Text("Jobs Count: ")
                            .foregroundColor(.themeGreen)
                            .fontWeight(.semibold)
                        
                        Spacer()
                        
                        Text("\(jobCount)")
                    }
                    
                    HStack {
                        Text("Order Count: ")
                            .foregroundColor(.themeGreen)
                            .fontWeight(.semibold)
                        
                        Spacer()
                        
                        Text("\(orderCount)")
                    }
                    
                    HStack {
                        Text("Trip Count: ")
                            .foregroundColor(.themeGreen)
                            .fontWeight(.semibold)
                        
                        Spacer()
                        
                        Text("\(tripCount)")
                    }
                }
                
                //MARK: Invoice Section
                Section("Invoice") {
                    HStack {
                        Text("Total Invoiced: ")
                            .foregroundColor(.themeGreen)
                            .fontWeight(.semibold)
                        
                        Spacer()
                        
                        Text("$67,809.76")
                    }
                    
                    HStack {
                        Text("Invoice Count: ")
                            .foregroundColor(.themeGreen)
                            .fontWeight(.semibold)
                        
                        Spacer()
                        
                        Text("\(invoiceCount)")
                    }
                }
            }
        }
        .navigationBarTitle("Customer Information")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CustomerInfoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            CustomerInfoView(customer: dev2.mockCustomer)
        }
    }
}

//extension CustomerInfoView {
//    var invoiceSection: some View {
//        HStack {
//            Text("Invoice Amount: ")
//                .foregroundColor(.themeGreen)
//                .fontWeight(.semibold)
//
//            Spacer()
//
//            Text("$67,809.76")
//        }
//
//        HStack {
//            Text("Invoice Count: ")
//                .foregroundColor(.themeGreen)
//                .fontWeight(.semibold)
//
//            Spacer()
//
//            Text("\(invoiceCount)")
//        }
//    }
//}


extension CustomerInfoView {
    func CustomerJobCount() async{
        let db = Firestore.firestore()
        let query = db.collection("jobs")
        let countQuery = query.count
        do {
            let snapshot = try await countQuery.getAggregation(source: .server)
            print(snapshot.count)
        } catch {
            print(error)
        }
    }
}
