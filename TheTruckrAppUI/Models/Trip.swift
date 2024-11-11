//
//  Trip.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 4/16/23.
//

import FirebaseFirestoreSwift
import Firebase

enum TripState: Int, Codable, Hashable{
    case requested
    case rejected
    case accepted
}

struct Trip: Identifiable, Codable, Hashable {
    @DocumentID var tripId: String?
    let dispatcherUid: String
    let driverUid: String
    let dispatcherName: String
    let driverName: String
    let dispatcherLocation: GeoPoint
    let driverLocation: GeoPoint
    let pickupLocationName: String
    let dropoffLocationName: String
    let pickupLocationAddress: String
//    let orderId: String
    let pickupLocation: GeoPoint
    let dropoffLocation: GeoPoint
    let tripCost: Double
    var distanceToPassenger: Double
    var travelTimeToPassenger: Int
    var state: TripState
    
    
//    var order: Order?
    
    var id: String {
        return tripId ?? ""
    }
}
