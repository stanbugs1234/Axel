//
//  OrderViewModel.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 6/20/23.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

class OrderViewModel: ObservableObject {
    @Published var jobs = [Job]()
    @Published var tripDate = Date()
    @Published var searchText = ""
    @Published var orders = [Order]()
    @Published var orderComments = ""
    @Published var numberOfTrucks = 0
    @Published var customerFullName = ""
    @Published var jobName = ""
    @Published var customers = [Customer]()
    @Published var vendorName = ""
    @Published var didUploadOrder = false
    
    let uid = Auth.auth().currentUser?.uid
    
    let service = OrderService()
    
    var searchableOrder: [Order] {
        if searchText.isEmpty {
            return orders
        } else {
            let lowercasedQuery = searchText.lowercased()
            
            return orders.filter({
                $0.customerName.lowercased()
                    .contains(lowercasedQuery) ||
                $0.jobName.lowercased().contains(lowercasedQuery) ||
                $0.vendorName.lowercased()
                    .contains(lowercasedQuery)
//                $0.orderDate.lowercased()
//                    .contains(lowercasedQuery)
                
            })
        }
    }  
    
    init() {
        fetchUserOrders(forUid: uid ?? "") { orders in
            self.orders = orders
        }
    }
    
    func uploadOrder(orderDate: Date, 
                     customerName: String,
                     jobName: String,
                     numberOfTrucks: Int,
                     vendorName: String,
                     orderComments: String) {
        service.uploadOrder(orderDate: tripDate, 
                            customerName: customerFullName,
                            jobName: jobName,
                            numberOfTrucks: numberOfTrucks,
                            vendorName: vendorName,
                            orderComments: orderComments) { success in
            if success {
                self.didUploadOrder = true
            } else {
                print("Did not upload for what ever fucking reason")
            }
        }
    }
    
    func fetchUserOrders(forUid uid: String, completion: @escaping ([Order]) -> Void) {
        FirestoreConstants.OrderRequestCollection
            .whereField("uid", isEqualTo: uid)
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else {return}
                let orders = documents.compactMap({
                    try? $0.data(as: Order.self) })
                completion(orders)
            }
    }
}
