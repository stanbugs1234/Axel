//
//  OrderService.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 6/23/23.
//

import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

struct OrderService {
    
    func uploadOrder(orderDate: Date,
                     customerName: String,
                     jobName: String,
                     numberOfTrucks: Int,
                     vendorName: String,
                     orderComments: String, completion: @escaping(Bool) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        
        
        let data = [
            "orderDate": orderDate,
            "customerName": customerName,
            "jobName": jobName,
            "numberOfTrucks": numberOfTrucks,
            "vendorName": vendorName,
            "orderComments": orderComments,
            "uid": uid,
            "timestamp": Timestamp(date: Date())] as [String : Any]
        
        Firestore.firestore().collection("orders").document()
            .setData(data) { error in
                if let error = error {
                    print("DEBUG: Faild to upload order with error:\(error.localizedDescription)")
                    completion(false)
                    return
                }
                completion(true)
            }
    }
    
    func fetchUserOrders(forUid uid: String, completion: @escaping ([Order]) -> Void) {
        Firestore.firestore().collection("orders")
            .whereField("uid", isEqualTo: uid)
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else {return}
                let orders = documents.compactMap({ try? $0.data(as: Order.self)
                })
                completion(orders)
            }
    }
}
