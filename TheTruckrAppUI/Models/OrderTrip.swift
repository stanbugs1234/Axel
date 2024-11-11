//
//  OrderTrip.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 1/29/24.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct OrderTrip: Identifiable, Codable, Hashable {
    @DocumentID var orderTripId: String?
    let driverId: String
    let orderId: String
    let to: GeoPoint
    let from: GeoPoint
    let arriveEmpty: Bool
    let product: String?
    let vendorName: String?
    let quantity: Float
    let timeStamp: Timestamp
    
    var driver: User?
    
    var id: String {
        return orderTripId ?? NSUUID().uuidString
    }
    
    
}
