//
//  TripViewModel.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 6/12/23.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

class TripViewModel: ObservableObject {
    @Published var trips = [Trip]()
    @Published var customers = [Customer]()
//    @Published var customer = Customer()
    @Published var searchText = ""
    @Published var tripDate = Date()
   
    private let viewModel = AuthViewModel()
    
    let uid = Auth.auth().currentUser?.uid
    
    var searchableTrips: [Trip] {
        if searchText.isEmpty {
            return trips
        } else {
            let lowercasedQuery = searchText.lowercased()
            
            return trips.filter({
                $0.driverName.lowercased()
                    .contains(lowercasedQuery)
                // Need to add more to query - research trip model
            })
        }
    }
    
    //
    //let service = TripService()
}
