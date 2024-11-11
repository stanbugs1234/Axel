//
//  Contact.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 6/24/23.
//

import FirebaseFirestoreSwift
import Firebase
import FirebaseFirestore

enum contactState: Int, Codable, Hashable {
    case activeContact
    case inactiveContact
}

struct Contact: Identifiable, Codable, Hashable {
    @DocumentID var contactId: String?
    let contactFullName: String
    let contactPhoneNumber: String
    let contactEmail: String?
    let contactCompanyName: String?
    let uid: String
    let timestamp: Timestamp
    
    var user: User?
    
    var id: String {
        return contactId ?? ""
    }
}
