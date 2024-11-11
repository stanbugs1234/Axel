//
//  Post.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 6/4/23.
//
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Post: Identifiable, Decodable {
    @DocumentID var id: String?
    let caption: String
    let timestamp: Timestamp
    let uid: String
    var likes: Int
    
    var user: User?
    var didLike: Bool? = false
    
}
