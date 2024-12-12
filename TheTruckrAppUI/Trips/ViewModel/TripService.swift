//
//  TripService.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 11/7/23.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift


struct TripService {
    func fetchJobs(completion: @escaping([Trip]) -> Void) {
        FirestoreConstants.TripCollection
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else {return}
                
                let trips = documents.compactMap({ try? $0.data(as: Trip.self) })
                print("DEBUG: Fetching Trips")
                completion(trips)
            }
    }
    
    func calculateCharge(numberOfTrucks: Int, fee: Int) -> Double {
        let chargeDouble = Double(numberOfTrucks * fee)
        let chargeCCFee = chargeDouble * 0.03 + chargeDouble
        return chargeCCFee
        
    }
}



