//
//  JobRequestService.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 1/30/24.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct JobRequestService {
    let currentUser = UserService.shared.currentUser
    
    func sendJobRequest(requestorId: String, driverId: String, orderId: String, completion: @escaping(Bool) -> Void) {
        guard let user = currentUser else { return }
        
        let data = ["requestorId": requestorId,
                    "driverId": driverId,
                    "orderId": orderId,
                    "status": 0,
                    "type": 1,
                    "timestamp": Timestamp(date: Date())] as [String : Any]
        
        FirestoreConstants.UserCollection.document(user.id)
            .collection("order_requests")
            .document(driverId)
            .setData(data) { error in
                if let error = error {
                    print("DEBUG: Failed to upload Job/Order Request \(error.localizedDescription)")
                    completion(false)
                    return
                }
                completion(true)
            }
        
        FirestoreConstants.UserCollection.document(driverId)
            .collection("order_requests").document(user.id)
            .setData(data) {error in
            if let error = error {
                print("DEBUG: Failed to upload Friend Request: \(error.localizedDescription)")
                completion(false)
                return
            }
            completion(true)
        }
        
    }
}
