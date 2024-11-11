//
//  AuthViewModel.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 4/13/23.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift
import FirebaseFirestore
import Combine


class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    private var cancellables = Set<AnyCancellable>()
    
    private let service = UserService.shared
    
    
    init() {
        userSession = Auth.auth().currentUser
//        self.userSession = Auth.auth().currentUser
        print("DEBUG: AuthView Model User Session is \(String(describing: self.userSession?.uid))")
//        fetchUser()
        loadCurrentUserData()
    }

    func signIn(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Failed to sign in with error \(error.localizedDescription)")
                return
            }
            self.userSession = result?.user
            guard let firebaseUser =  result?.user else {return}
            self.userSession = firebaseUser
        }
    }
    
    func registerUser(withEmail email: String, password: String, fullname: String) {
        guard let location = LocationManager.shared.userLocation else { return }
    
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Failed to sign up with error \(error.localizedDescription)")
                return
            }
            
            guard let firebaseUser =  result?.user else {return}
            self.userSession = firebaseUser
            
            let user = User(
                fullname: fullname,
                email: email,
//                uid: firebaseUser.uid,
                coordinates: GeoPoint(latitude: location.latitude, longitude: location.longitude),
                accountType: .dispatcher,
                profileImageUrl: "")
            
            self.currentUser = user
            guard let encodedUser = try? Firestore.Encoder().encode(user) else { return }
            Firestore.firestore().collection("users").document(firebaseUser.uid).setData(encodedUser)
        }
    }
    
//    func signout() {
//        do {
//            try Auth.auth().signOut()
//            self.currentUser = nil
//        } catch let error {
//            print("DEBUG: Failed to sign out with error\(error.localizedDescription)")
//        }
//    }
    
    func signout() {
        userSession = nil
        try? Auth.auth().signOut()
    }

    func fetchUser() {
        guard let uid = self.userSession?.uid else {return}
//         signout()
        service.$currentUser
            .sink { user in
            self.currentUser = user
        }
        .store(in: &cancellables)
    }
    
    
    func uploadProfileImage(_ image: UIImage) {
        guard let uid = userSession?.uid else {return}
        
        ImageUploader.uploadImage(image: image) { profileImageUrl in
            Firestore.firestore().collection("users")
                .document(uid)
                .updateData(["profileImageUrl": profileImageUrl])
        }
    }
    
    private func loadCurrentUserData() {
        Task { try await UserService.shared.fetchCurrentUser()}
    }
}
