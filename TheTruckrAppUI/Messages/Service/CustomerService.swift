//
//  CustomerService.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 6/5/23.
//

import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

struct CustomerService {
    
    func uploadCustomer(customerAddress: String, customerFullName: String, completion: @escaping(Bool) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        
        let data = ["customerFullName": customerFullName,
                    "customerAddress": customerAddress,
                    "uid": uid,
                    "customerState": 0,
                    "timestamp": Timestamp(date: Date())] as [String : Any]
        
        Firestore.firestore().collection("customers")
            .document()
            .setData(data) {error in
                if let error = error {
                    print("DEBUG: Failed to upload customer with error: \(error.localizedDescription)")
                    completion(false)
                    return
                }
                completion(true)
            }
    }
    
    func fetchCustomers(completion: @escaping([Customer]) -> Void) {
        Firestore.firestore().collection("customers")
        //            .order(by: "customerFullName", descending: false)
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else { return }
                
                let customers = documents.compactMap({ try? $0.data(as: Customer.self) })
                print("DEBUG: Fetching Customers")
                completion(customers)
            }
    }
    
    func fetchCustomers(forUId uid: String, completion: @escaping ([Customer]) -> Void) {
        Firestore.firestore().collection("customers")
            .whereField("uid", isEqualTo: uid)
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else { return }
                let customers = documents.compactMap({ try? $0.data(as: Customer.self) })
                completion(customers)
            }
    }
}
