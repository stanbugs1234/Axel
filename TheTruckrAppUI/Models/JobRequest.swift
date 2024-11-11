//
//  JobRequest.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 1/30/24.
//

import Foundation
import FirebaseFirestoreSwift
import Firebase
import FirebaseFirestore

enum JobRequestStatus: Int, Codable, Hashable {
    // 0 - Requested
    case requested
    //1 - Accepted
    case accepted
    //2 - Rejected
    case rejected
}

enum JobRequestType: Int, Codable, Hashable {
    //0 - User Sent Friend Request
    case OwnRequest
    //1 - Friend Sent Friend Request
    case OrderRequest
}

struct JobRequest: Identifiable, Codable, Hashable {
    @DocumentID var jobRequestId: String?
    let requestorId: String
    let driverId: String
    let status: JobRequestStatus
    let type: JobRequestType
    let orderId: String
    let timestamp: Timestamp
    
    var order: Order?
    
    var id: String {
        return jobRequestId ?? ""
    }
}
