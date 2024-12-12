//
//  UserService.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 4/16/23.
//

import Firebase
import FirebaseFirestoreSwift


class UserService {
    @Published var currentUser: User?
    
    static let shared = UserService()
    
    init() {
        Task { try await fetchCurrentUser() }
    }
    
    @MainActor
    func fetchCurrentUser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let snapshot = try await FirestoreConstants.UserCollection.document(uid).getDocument()
        let user = try snapshot.data(as: User.self)
        self.currentUser = user
    }
    
    static func fetchAllUser() async throws -> [User] {
        let query = FirestoreConstants.UserCollection
        let snapshot = try await query.getDocuments()
        return snapshot.documents.compactMap ({ try? $0.data(as:User.self) })
    }
    
    static func fetchAllUsersWithLimit(limit: Int?) async throws -> [User] {
        let query = FirestoreConstants.UserCollection
        if let limit {query.limit(to: limit) }
        let snapshot = try await query.getDocuments()
        return snapshot.documents.compactMap ({ try? $0.data(as:User.self) })
    }
    
    static func fetchUser(withUid uid: String, completion: @escaping(User) -> Void) {
        FirestoreConstants.UserCollection.document(uid).getDocument { snapshot, _ in
            guard let user = try? snapshot?.data(as: User.self) else { return }
            completion(user)
        }
    }
    
    func fetchUsers(forUid uid: String, completion: @escaping ([User]) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        
        FirestoreConstants.UserCollection.document(uid).collection("friend_requests")
            .whereField("uid", isEqualTo: uid)
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else {return}
                let friends = documents.compactMap({
                    try? $0.data(as: User.self) })
                completion(friends)
            }
    }
    
    func fetchUserByUid(forUid uid: String, completion: @escaping (User) -> Void) {
        Firestore.firestore().collection("users").document(uid).getDocument { snapshot, _ in
            print("DEBUG: Did fetch Inidividual user from firestore")
            guard let snapshot = snapshot else {return}
            guard let user = try? snapshot.data(as: User.self) else {return}
            self.currentUser = user
        }
    }
    
    func fetchUserCommentbyUid(forUid uid: String, completion: @escaping(User) -> Void) {
        FirestoreConstants.UserCollection
            .whereField("uid", isEqualTo: uid)
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else {return}
                let user = documents.compactMap({ try? $0.data(as: User.self) })
            }
    }
}
