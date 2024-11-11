//
//  Constants.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 1/19/24.
//

import Foundation
import Firebase

struct FirestoreConstants {
    static let UserCollection = Firestore.firestore().collection("users")
    static let MessagesCollection = Firestore.firestore().collection("messages")
    static let OrderRequestCollection = Firestore.firestore().collection("orders")
}
