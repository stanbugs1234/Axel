//
//  ContentViewModel.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 1/16/24.
//

import Firebase
import Combine

class ContentViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupSubscribers()
    }
    
    private func setupSubscribers () {
        AuthService.shared.$userSession.sink { [weak self]  userSession in
            self?.userSession = userSession
        }.store (in: &cancellables)
    }
}
