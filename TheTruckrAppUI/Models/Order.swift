//
//  Order.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 6/23/23.
//

import FirebaseFirestoreSwift
import Firebase
import FirebaseFirestore

enum orderState: Int, Codable, Hashable {
    case activeOrder
    case inactiveOrder
}

struct Order: Identifiable, Codable, Hashable {
    @DocumentID var orderId: String?
    var orderDate = Date()
    let customerName: String
    let jobName: String
    let numberOfTrucks: Int
    let vendorName: String
    let orderComments: String
    let uid: String
    let timestamp: Timestamp
    
    var user: User?
    var trip: Trip?
   
    var id: String {
        return orderId ?? ""
    }
}
