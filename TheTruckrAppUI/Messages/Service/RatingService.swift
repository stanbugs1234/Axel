//
//  RatingService.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 12/3/23.
//

import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

struct RatingService {
    func uploadRating(driverUid: String, rating: Int, completion: @escaping(Bool) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        
        let data = ["driverUid": driverUid,
                    "rating": rating,
                    "personGivingReviewUid": uid,
                    "timestamp": Timestamp(date: Date())] as [String : Any]
        
        FirestoreConstants.UserCollection.document(driverUid).collection("ratings")
            .document()
            .setData(data) {error in
                if let error = error {
                    print("DEBUG: Failed to upload Ratings with error: \(error.localizedDescription)")
                    completion(false)
                    return
                }
                completion(true)
            }
        
//        Firestore.firestore().collection("ratings")
//            .document()
//            .setData(data) {error in
//                if let error = error {
//                    print("DEBUG: Failed to upload Ratings with error: \(error.localizedDescription)")
//                    completion(false)
//                    return
//                }
//                completion(true)
//            }
    }
    
    func fetchUserRatings(forUId uid: String, completion: @escaping ([Rating]) -> Void) {
        FirestoreConstants.UserCollection.document(uid).collection("ratings")
            .whereField("driverUid", isEqualTo: uid)
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else { return }
                let ratings = documents.compactMap({ try? $0.data(as: Rating.self) })
                completion(ratings)
            }
    }
}
