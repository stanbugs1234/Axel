//
//  Truck.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 4/23/23.
//

import FirebaseFirestoreSwift
import Firebase

enum TruckState: Int, Codable {
    case availableToWork
    case downForMaintanence
    case scheduledToWork
}

struct Truck: Identifiable, Decodable, Hashable {
    @DocumentID var truckId: String?
    let truckName: String?
    let companyId: String
    let truckType: String
    let truckMadeYear: Date
    let truckMake: String
    let truckModel: String
    let truckSerialNumber: String
    let truckPurchaseDate: Date
    let truckInsurancePolicyNumber: String
    let isTruckInsurancePolicyCurrent: Bool
    let truckInsuranceDateExpiring: Date
   
    var id: String {
        return truckId ?? ""
    }
}
