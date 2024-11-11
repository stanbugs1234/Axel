//
//  Friend.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 11/24/23.
//

import FirebaseFirestoreSwift
import Firebase
import FirebaseFirestore

enum FriendRequestStatus: Int, Codable, Hashable {
    // 0 - Requested
    case requested
    //1 - Accepted
    case accepted
    //2 - Rejected
    case rejected
}

enum FriendRequestType: Int, Codable, Hashable {
    //0 - User Sent Friend Request
    case OwnRequest
    //1 - Friend Sent Friend Request
    case FriendRequest
}

struct Friend: Identifiable, Codable, Hashable {
    @DocumentID var friendId: String?
    let userFullName: String
    let profileImageUrl: String?
    let status: FriendRequestStatus
    let type: FriendRequestType
    let requestorUid: String
    let uid: String
    let timestamp: Timestamp
    
    var user: User?
    
    var id: String {
        return friendId ?? ""
    }
}
