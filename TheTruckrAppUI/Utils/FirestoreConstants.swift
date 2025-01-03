//
//  FirestoreConstants.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 1/19/24.
//

import Foundation
import Firebase

struct FirestoreConstants {
    static let UserCollection = Firestore.firestore().collection("users")
    static let VendorCollection = Firestore.firestore().collection("vendors")
    static let PostCollection = Firestore.firestore().collection("posts")
    static let PostCommentsCollection = Firestore.firestore().collection("post_comments")
    static let MessagesCollection = Firestore.firestore().collection("messages")
    static let OrderRequestCollection = Firestore.firestore().collection("orders")
    static let TripCollection = Firestore.firestore().collection("trips")
}
