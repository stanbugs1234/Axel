//
//  FriendRequestViewModel.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 11/24/23.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

class FriendRequestViewModel: ObservableObject {
    @Published var friends = [Friend]()
    @Published var didSendFriendRequest = false
    
    let user = UserService.shared.currentUser
    let service = FriendRequestService()
    
    init() {
        fetchFriendRequests(forUid: user?.uid ?? "") { friends in
            self.friends = friends
        }
    }
    
    func sendFriendRequest(userFullName: String, profileImageUrl: String, acceptorUid: String) {
        service.sendFriendRequest(userFullName: userFullName, profileImageUrl: profileImageUrl, acceptorUid: acceptorUid) { success in
            if success {
                self.didSendFriendRequest = true
            } else {
                print("Didn't Send Friend Request For some fucking God Damn Reason")
            }
        }
    }
    
    //Fetch Friend Requests that are in the requested Type
    func fetchFriendRequests(forUid uid: String, completion: @escaping ([Friend]) -> Void) {
        guard let uid = user?.id else {return}
        Firestore.firestore().collection("users").document(uid).collection("friend_requests")
            .whereField("uid", isEqualTo: uid)
            .whereField("status", isEqualTo: 0)
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else {return}
                let friends = documents.compactMap({
                    try? $0.data(as: Friend.self) })
                completion(friends)
            }
    }
    
    func addFriend(_ friend: Friend, userFullName: String, profileImageUrl: String, acceptorUid: String) {
        service.addFriendRequest(friend, userFullName: userFullName, profileImageUrl: profileImageUrl, acceptorUid: acceptorUid) { success in
            if success {
                self.didSendFriendRequest = true
            } else {
                print("Didn't Accept Friend Request for some fucking God Damn Reason")
            }
        }
        print("DEBUG: Friend Added")
    }
    
    func deleteFriend(_ friend: Friend, userFullName: String, profileImageUrl: String, acceptorUid: String) {
        service.rejectFriendRequest(friend, userFullName: userFullName, profileImageUrl: profileImageUrl, acceptorUid: acceptorUid) { success in
            if success {
                self.didSendFriendRequest = true
            } else {
                print("Didn't Accept Friend Request for some fucking God Damn Reason")
            }
        }
        print("DEBUG: Removed Friend Request")
    }    
}
