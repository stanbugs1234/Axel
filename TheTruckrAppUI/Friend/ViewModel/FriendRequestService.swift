//
//  FriendRequestService.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 11/24/23.
//

import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

struct FriendRequestService {
    let currentUser = UserService.shared.currentUser
    
    func sendFriendRequest(userFullName: String, profileImageUrl: String, acceptorUid: String, completion: @escaping(Bool) -> Void) {
        guard let user = currentUser else {return}
        
        let data = ["userFullName": userFullName,
                    "profileImageUrl": profileImageUrl,
                    "status": 0,
                    "type": 1,
                    "requestorUid": user.id,
                    "uid": acceptorUid,
                    "timestamp": Timestamp(date: Date())] as [String : Any]
        
        Firestore.firestore().collection("users").document(user.id).collection("friend_requests")
            .document(acceptorUid)
            .setData(data) {error in
                if let error = error {
                    print("DEBUG: Failed to upload Friend Request: \(error.localizedDescription)")
                    completion(false)
                    return
                }
                completion(true)
            }
        
        Firestore.firestore().collection("users").document(acceptorUid ).collection("friend_requests").document(user.id)
            .setData(data) {error in
                if let error = error {
                    print("DEBUG: Failed to upload Friend Request: \(error.localizedDescription)")
                    completion(false)
                    return
                }
                completion(true)
            }
    }
    
    //Changes the Friend type from Requested to Accepted
    func addFriendRequest(_ friend: Friend, userFullName: String, profileImageUrl: String, acceptorUid: String, completion: @escaping(Bool) -> Void) {
        guard let user = Auth.auth().currentUser else {return}
        guard let documentId = friend.friendId else {return}
        
        let data = ["userFullName": userFullName,
                    "profileImageUrl": profileImageUrl,
                    "status": 1,
                    "type": 1,
                    "requestorUid": user.uid,
                    "uid": acceptorUid,
                    "timestamp": Timestamp(date: Date())] as [String : Any]
        
        Firestore.firestore().collection("users").document(user.uid).collection("friend_requests")
            .document(documentId)
            .setData(data) {error in
                if let error = error {
                    print("DEBUG: Failed to upload Friend Request: \(error.localizedDescription)")
                    completion(false)
                    return
                }
                completion(true)
            }
        
//        Firestore.firestore().collection("requests")
//            .document(documentId)
//            .setData(data) {error in
//                if let error = error {
//                    print("DEBUG: Failed to upload Friend Request: \(error.localizedDescription)")
//                    completion(false)
//                    return
//                }
//                completion(true)
//            }
    }
    
    //Changes the Friend type from Requested to Rejected
    func rejectFriendRequest(_ friend: Friend, userFullName: String, profileImageUrl: String, acceptorUid: String, completion: @escaping(Bool) -> Void) {
        guard let user = currentUser else {return}
        guard let documentId = friend.friendId else {return}
        
        let data = ["userFullName": userFullName,
                    "profileImageUrl": profileImageUrl,
                    "status": 1,
                    "type": 2,
                    "requestorUid": user.id,
                    "uid": acceptorUid,
                    "timestamp": Timestamp(date: Date())] as [String : Any]
        
        Firestore.firestore().collection("requests")
            .document(documentId)
            .setData(data) {error in
                if let error = error {
                    print("DEBUG: Failed to upload Friend Request: \(error.localizedDescription)")
                    completion(false)
                    return
                }
                completion(true)
            }
    }
    
    //MARK: Check if friend request exists
    func checkIfUsersAreFriends(_ friend: Friend, completion: @escaping(Bool) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let friendUid = friend.friendId else { return }
        
        Firestore.firestore().collection("users")
            .document(uid).collection("friend_requests")
            .document(friend.friendId ?? "").getDocument { snapshot, _ in
                guard let snapshot = snapshot else { return }
                completion(snapshot.exists)
            }
    }
}
