//
//  Rating.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 12/3/23.
//

import FirebaseFirestoreSwift
import Firebase
import FirebaseFirestore

struct Rating: Identifiable, Codable, Hashable {
    @DocumentID var ratingId: String?
    let driverUid: String
    let rating: Int
    let personGivingReviewUid: String
    let timestamp: Timestamp
    
    var user: User?
    
    var id: String {
        return ratingId ?? ""
    }
}
