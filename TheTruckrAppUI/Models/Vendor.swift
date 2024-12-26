//
//  Vendors.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 5/8/23.
//

import FirebaseFirestoreSwift
import Firebase
import FirebaseFirestore



struct Vendor: Identifiable, Codable, Hashable {
    @DocumentID var vendorId: String?
    let vendorFullName: String
    let vendorCompanyId: String?
//    var vendorGeoAddress: GeoPoint
    let vendorAddressName: String
    let vendorState: vendorState
    let uid: String
    let timestamp: Timestamp
    let vendorProfileImageUrl: String?
    var likes: Int
    
    var user: User?
    var didLike: Bool? = false

    var id: String {
        return vendorId ?? ""
    }
}

//MARK: Might Remove
enum vendorState: Int, Codable {
    //0 - All New Vendor's should be active
    case activeVendor
    //1 - Need to determine how to automatically make inactive
    case inactiveVendor
    
    var title: String {
        switch self {
        case .activeVendor: return "Active"
        case .inactiveVendor: return "Inactive"
        }
    }
}
