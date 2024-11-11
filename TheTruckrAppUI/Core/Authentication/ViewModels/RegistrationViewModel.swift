//
//  RegistrationViewModel.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 1/16/24.
//

import SwiftUI

class RegistrationViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var fullName = ""
    
    func createUser() async throws {
        try await AuthService().createUser(withEmail: email, password: password, fullname: fullName)
    }
    
    
}
