//
//  Customer.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 5/5/23.
//

import FirebaseFirestoreSwift
import Firebase
import FirebaseFirestore

enum customerState: Int, Codable, Hashable {
    //0 - Active Customer
    case activeCustomer
    //1- Inactive Customer
    case inactiveCustomer
    
    var title: String {
        switch self {
        case .activeCustomer: return "Active"
        case .inactiveCustomer: return "Inactive"
        }
    }
}

struct Customer: Identifiable, Codable, Hashable {
    @DocumentID var customerId: String?
    let customerAddress: String
    let customerFullName: String
    let timestamp: Timestamp
    let uid: String
    var customerState: customerState
    

//    var user: User?
    
    var id: String {
        return customerId ?? ""
    }
}
