//
//  Services.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 12/24/24.
//

import Foundation
import FirebaseFirestoreSwift
import Firebase

struct Services: Identifiable, Codable, Hashable {
    @DocumentID var serviceId: String?
    let companyId: String
    let serviceCategory: SuggestionViewEnums
    let timestamp: Timestamp
    let uid: String
    
    var id: String {
        return serviceId ?? ""
    }
}
