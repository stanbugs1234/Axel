//
//  JobRequestViewModel.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 1/30/24.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

@MainActor
class JobRequestViewModel: ObservableObject {
    @Published var searchText = ""
    @Published var drivers = [User]()
    @Published var didSendJobRequest = false
    @Published var requests = [JobRequest]()
    
    let user = UserService.shared.currentUser
    let service = JobRequestService()
    
    init() {
        Task { try await fetchUsers() }
        fetchJobRequests(forUid: user?.uid ?? "") { requests in
            self.requests = requests
        }
    }
    
    var searchableUsers: [User] {
        if searchText.isEmpty {
            return drivers
        } else {
            let lowercasedQuery = searchText.lowercased()
            
            return drivers.filter({
                $0.fullname.lowercased().contains(lowercasedQuery) ||
                $0.email.lowercased().contains(lowercasedQuery)
            })
        }
    }
    
    //MARK: Send Job Request
    
    func sendJobRequest(requestorId: String, driverId: String, orderId: String) {
        service.sendJobRequest(requestorId: requestorId, driverId: driverId, orderId: orderId) { success in
            if success {
                self.didSendJobRequest = true
            } else {
                print("Didn't send Job request for some fucking reason")
            }
        }
    }
    
    func fetchUsers() async throws {
        guard let currentUid = Auth.auth().currentUser?.uid else { return}
        let users = try await UserService.fetchAllUser()
        self.drivers = users.filter({ $0.id != currentUid })
    }
    
    func fetchJobRequests(forUid uid: String, completion: @escaping([JobRequest]) -> Void) {
        guard let uid = user?.id else {return}
        FirestoreConstants.UserCollection.document(uid).collection("order_requests")
            .whereField("uid", isEqualTo: uid)
            .whereField("status", isEqualTo: 0)
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else {return}
                let friends = documents.compactMap({
                    try? $0.data(as: JobRequest.self) })
                completion(friends)
            }
    }
}
