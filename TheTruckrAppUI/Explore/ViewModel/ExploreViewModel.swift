//
//  ExploreViewModel.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 5/30/23.
//

import Foundation
import Firebase

@MainActor
class ExploreViewModel: ObservableObject {
    @Published var users = [User]()
    @Published var searchText = ""
    
    var searchableUsers: [User] {
        if searchText.isEmpty {
            return users
        } else {
            let lowercasedQuery = searchText.lowercased()
            
            return users.filter({
                $0.email.lowercased().contains(lowercasedQuery) ||
                $0.fullname.lowercased().contains(lowercasedQuery)
            })
        }
    }

    init() {
        Task { try await fetchUsers() }
    }
    
//    let service = UserServiceHelper()
//    


    func fetchUsers() async throws {
        guard let currentUid = Auth.auth().currentUser?.uid else { return}
        let users = try await UserService.fetchAllUser()
        self.users = users.filter({ $0.id != currentUid })
    }
}
