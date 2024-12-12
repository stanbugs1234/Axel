//
//  RatingViewModel.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 6/15/24.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift
import Combine

class RatingViewModel: ObservableObject {
    @Published var ratings = [Rating]()

    let user: User
    
    private let service = RatingService()
    
    init(user: User) {
        self.user = user
        self.fetchUserRatings()
    }
    
    //MARK: Fetch User Ratings
    
    //TODO: add function to fetch user
    
    //MARK: Fetch User Rating Count
    func fetchUserRatings() {
        guard let uid = user.uid else { return }
        service.fetchUserRatings(forUId: uid) { ratings in
            self.ratings = ratings
            
            for i in 0 ..< ratings.count {
                self.ratings[i].user = self.user
            }
        }
    }
    
    //MARK: Calculate Average Rating
    public func calculateAverageRating(uid: String) -> Double {
        let subCollection = self.ratings
        let sumOfRatings = subCollection.map { $0.rating}.reduce(0, +)
        let subCollectionCount = Double(subCollection.count)
        
        if subCollectionCount == 0 {
            return 0
        } else  {
            return Double(sumOfRatings) / Double(subCollection.count)
        }
    }
    
    //MARK: String Average User Rating
    public func averageUserRatingString(uid: String) -> String {
        let averageRating = calculateAverageRating(uid: uid)
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 1
        
        if averageRating == 0 {
            return String("No Reviews")
        } else {
            return formatter.string(for: averageRating)!
        }
    }
}
