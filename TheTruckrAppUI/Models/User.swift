//
//  User.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 4/14/23.
//

import Firebase
import FirebaseFirestoreSwift
import FirebaseFirestore

enum AccountType: Int, Codable, Hashable {
    case dispatcher
    case driver
}

struct User: Identifiable, Codable, Equatable, Hashable {
    static func == (lhs: User, rhs: User) -> Bool {
        return true
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    @DocumentID var uid: String?
    let fullname: String
    let email: String
    var coordinates: GeoPoint
    var accountType: AccountType
    var homeLocation: SavedLocation?
    var workLocation: SavedLocation?
    var profileImageUrl: String?
    //
    
    var isCurrentUser: Bool { return Auth.auth().currentUser?.uid == id }
    
    var id: String {
        return uid ?? NSUUID().uuidString
    }
    
    var firstName: String {
        let formatter = PersonNameComponentsFormatter()
        let components = formatter.personNameComponents(from: fullname)
        return components?.givenName ?? fullname
    }
}
