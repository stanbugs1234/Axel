//
//  MainTabHomeViewModel.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 1/17/24.
//

import Foundation
import Combine
import Firebase

class MainTabHomeViewModel: ObservableObject {
    @Published var currentUser: User?
    @Published var recentMessages = [Chat]()
    
    private var cancellables = Set<AnyCancellable>()
    private let service = InboxService()
    
    init() {
//        AuthService.shared.signOut()
        setupSubscribers()
        service.observeRecentMessages()
    }
    
    private func setupSubscribers() {
        UserService.shared.$currentUser.sink { [weak self] user in
            self?.currentUser = user
        }.store(in: &cancellables)
        
        service.$documentChanges.sink { [weak self] changes in
            self?.loadInitialMessages(fromChanges: changes)
        }.store(in: &cancellables)
    }
    
    private func loadInitialMessages(fromChanges changes: [DocumentChange]) {
        var messages = changes.compactMap({ try? $0.document.data(as: Chat.self) })
        
        for i in 0 ..< messages.count {
            let message = messages[i]
                
            UserService.fetchUser(withUid: message.chatPartnerId) { user in
                messages[i].user = user
                self.recentMessages.append(messages[i])
            }
        }
    }
}
