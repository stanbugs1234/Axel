//
//  UploadRatingViewModel.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 12/3/23.
//

import Firebase

class UploadRatingViewModel: ObservableObject {
    @Published var didUploadRating = false
    @Published var rating = 0
    @Published var title = "No Reviews"
    
    let service = RatingService()
    
    func uploadRating(driverUid: String, rating: Int) {
        service.uploadRating(driverUid: driverUid, rating: rating) { success in
            if success {
                self.didUploadRating = true
            } else {
                print("Did not Upload for what ever fucking reason")
            }
        }
    }
}
