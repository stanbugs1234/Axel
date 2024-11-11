//
//  LoginViewModel.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 1/16/24.
//

import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    func login() async throws{
        try await AuthService.shared.login(withEmail: email, password: password)
    }
    
    func resetPassword() async throws {
        try await AuthService.shared.resetPassword(email: email)
    }
    
    func isEmailValid() {
        errorMessage = "Invalid Email Address"
    }
}
