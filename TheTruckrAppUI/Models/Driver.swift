//
//  Driver.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 4/24/23.
//

import FirebaseFirestoreSwift
import Firebase

enum DriverState: Int, Codable {
    case availableToWork
    case notAvailableToWork
    case scheduledToWork
}

struct Driver: Identifiable, Codable, Hashable {
    @DocumentID var driverId: String?
    let driverFullName: String?
    let companyId: String
    let accountType: String
    let medicalCardId: String
    let isMedicalCardCurrent: Bool
    let driverliscenseNumber: String
    let isDriverLiscenseActive: Bool
    let dateBecameDriver: Date

    
    
    
    var id: String {
        return driverId ?? ""
    }
}
