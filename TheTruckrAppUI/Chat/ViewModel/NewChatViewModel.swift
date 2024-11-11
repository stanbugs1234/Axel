//
//  NewChatViewModel.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 1/17/24.
//

import Foundation
import Firebase

@MainActor
class NewChatViewModel: ObservableObject {
    @Published var users = [User]()
    @Published var searchText = ""
    
    init() {
        Task { try await fetchUsers() }
    }
    
    var searchableUsers: [User] {
        if searchText.isEmpty {
            return users
        } else {
            let lowercasedQuery = searchText.lowercased()
            
            return users.filter({
                $0.fullname.lowercased().contains(lowercasedQuery) ||
                $0.email.lowercased().contains(lowercasedQuery)
            })
        }
    }

    func fetchUsers() async throws {
        guard let currentUid = Auth.auth().currentUser?.uid else { return}
        let users = try await UserService.fetchAllUser()
        self.users = users.filter({ $0.id != currentUid })
    }
}
