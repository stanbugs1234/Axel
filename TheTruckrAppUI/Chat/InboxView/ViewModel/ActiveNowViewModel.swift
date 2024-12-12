//
//  ActiveNowViewModel.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 1/19/24.
//

import Foundation
import Firebase


class ActiveNowViewModel: ObservableObject {
    @Published var users = [User]()
    
    init() {
        Task { try await fetchUsers() }
    }
    
    @MainActor
    private func fetchUsers() async throws {
        guard let currentUid = Auth.auth().currentUser?.uid else { return}
        let users = try await UserService.fetchAllUser()
        self.users = users.filter({ $0.id != currentUid })
    }
}
