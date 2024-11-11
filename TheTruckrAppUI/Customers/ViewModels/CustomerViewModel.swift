//
//  CustomerViewModel.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 5/5/23.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

class CustomerViewModel: ObservableObject {
    @Published var customers = [Customer]()
 @Published var searchText = ""
    
    let uid = UserService.shared.currentUser?.id
    
    var searchableCustomers: [Customer] {
        if searchText.isEmpty {
            return customers
        } else {
            let lowercasedQuery = searchText.lowercased()
            
            return customers.filter({
                $0.customerFullName.lowercased().contains(lowercasedQuery) ||
                $0.customerAddress.lowercased().contains(lowercasedQuery) ||
                $0.customerState.title.lowercased().contains(lowercasedQuery)
            })
        }
    }
    
    let service = CustomerService()

    init() {
//        self.user = user
        fetchUserCustomers(forUid: uid ?? "") { customers in
            self.customers = customers
        }
    }
    
    func fetchAllCustomers() {
        service.fetchCustomers() { customers in
            self.customers = customers
            }
        }

    func fetchUserCustomers(forUid uid: String, completion: @escaping ([Customer]) -> Void) {
        Firestore.firestore().collection("customers")
            .whereField("uid", isEqualTo: uid)
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else {return}
                let customers = documents.compactMap({
                    try? $0.data(as: Customer.self) })
                completion(customers)
            }
    }
}
