//
//  AuthService.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 1/16/24.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth
import Foundation
import Firebase
import FirebaseFirestoreSwift

class AuthService: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    
    static let shared = AuthService()
    
    init() {
        self.userSession = Auth.auth().currentUser
        loadCurrentUserData()
        print("DEBUG: AuthService user session id is \(userSession?.uid)")
    }

    //MARK: Login with Email
    @MainActor
    func login(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            loadCurrentUserData()
        } catch {
            print("DEBUG: Failed to sign in user with error: \(error.localizedDescription)")
        }
    }
    
    //MARK: Create new user
    @MainActor
    func createUser(withEmail email: String, password: String, fullname: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            try await self.uploadUserData(email: email, fullname: fullname, id: result.user.uid)
            loadCurrentUserData()
        } catch {
            print("DEBUG: Failed to create user with error: \(error.localizedDescription)")
        }
    }
    
    //MARK: Create new user with email verification
//    func createUserwithEmailValidation(withEmail email: String, password: String, fullname: String) async throws { 
//        
//        let actionCodeSettings = ActionCodeSettings()
//        actionCodeSettings.url = URL(string: "https://www.example.com")
//        // The sign-in operation has to always be completed in the app.
//        actionCodeSettings.handleCodeInApp = true
//        actionCodeSettings.setIOSBundleID(Bundle.main.bundleIdentifier!)
//        actionCodeSettings.setAndroidPackageName("com.example.android",
//                                                 installIfNotAvailable: false, minimumVersion: "12")
//        Auth.auth().sendSignInLink(toEmail: email,
//                                                                                                                                                 actionCodeSettings: actionCodeSettings) { error in
//        // ...
//        if let error = error {
//            self.showMessagePrompt(error.localizedDescription)
//            return
//        }
//        // The link was successfully sent. Inform the user.
//        // Save the email locally so you don't need to ask the user for it again
//        // if they open the link on the same device.
//        UserDefaults.standard.set(email, forKey: "Email")
//        self.showMessagePrompt("Check your email for link")
//        // ...
//        }
//    }

    //MARK: Sign Out
    func signOut() {
        do {
            try Auth.auth().signOut()
            self.userSession = nil
            UserService.shared.currentUser = nil
        } catch {
            print("DEBUG: Failed to sign out with error \(error.localizedDescription)")
        }
    }
    
    //MARK: Reset Password
    func resetPassword(email: String) async throws {
        do {
            let result: Void = try await Auth.auth().sendPasswordReset(withEmail: email)
        } catch {
            print("DEBUG: Failed to reset password with error \(error.localizedDescription)")
        }
    }
    
    private func uploadUserData(email: String, fullname: String, id: String) async throws {
        guard let location = LocationManager.shared.userLocation else { return }
        
        let user = User(uid: id,
                        fullname: fullname,
                        email: email,
                        coordinates: GeoPoint(
                            latitude: location.latitude,
                            longitude: location.longitude),
                        accountType: .dispatcher,
                        profileImageUrl: "")
        guard let encodedUser = try? Firestore.Encoder().encode(user) else { return }
        try await Firestore.firestore().collection("users").document(id).setData(encodedUser)
    }
    
    //MARK: Load Current User data
    private func loadCurrentUserData() {
        Task { try await
            UserService.shared.fetchCurrentUser()}
    }
    
    //MARK: Upload Profile Image
    func uploadProfileImage(_ image: UIImage) {
        guard let uid = userSession?.uid else {return}
        
        ImageUploader.uploadImage(image: image) { profileImageUrl in
            Firestore.firestore().collection("users")
                .document(uid)
                .updateData(["profileImageUrl": profileImageUrl])
        }
    }
}
