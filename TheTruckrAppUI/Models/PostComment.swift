//
//  PostComment.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 12/25/23.
//

import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

struct PostComment: Identifiable, Decodable {
    @DocumentID var postCommentId: String?
    let caption: String
    let userFullName: String
    let userURL: String
    let timestamp: Timestamp
    let postId: String
    let uid: String
    var likes: Int
    
    var user: User?
    var didLike: Bool? = false
    
    var id: String {
        return postCommentId ?? ""
    }
}
