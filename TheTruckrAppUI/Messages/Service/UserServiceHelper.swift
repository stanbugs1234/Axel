//
//  UserService.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 6/1/23.
//

import Firebase
import FirebaseFirestore
import FirebaseStorage
import FirebaseFirestoreSwift

struct UserServiceHelper {
    
    func fetchUser(withUid id: String, completion: @escaping(User) -> Void) {
        Firestore.firestore().collection("users")
            .document(id)
            .getDocument { snapshot, _ in
                guard let snapshot = snapshot else { return }
                
                guard let user = try? snapshot.data(as: User.self) else {return}
                completion(user)
            }
    }
    
    func fetchUsers(completion: @escaping([User]) -> Void) {
        Firestore.firestore().collection("users")
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else { return }
                let users = documents.compactMap({ try? $0.data(as: User.self) })
                    completion(users)
            }
    }
}
