//
//  CustomerInforViewModel.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 5/20/23.
//

import Foundation
import FirebaseFirestore


enum CustomerInfoDetailViewModel: Int, CaseIterable, Identifiable, Hashable {
    case jobs
    case trips
    case invoices
    
    
    var title: String {
        switch self {
        case .jobs: return "Jobs"
        case .trips: return "Trips"
        case .invoices: return "Invoices"
            
        }
    }
    
    var imageName: String {
        switch self{
        case .jobs: return "newspaper.circle.fill"
        case .trips: return "newspaper.circle.fill"
        case .invoices: return "newspaper.circle.fill"
            
        }
    }
    
    var id: Int {
        return self.rawValue
    }
    
    func getJobByCustomer() {
        Firestore.firestore().collection("jobs")
            .whereField("customer", isEqualTo: true)
            .getDocuments { querySnapshot, err in
                if let err = err {
                    print("Errorgetting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        print("\(document.documentID) => \(document.data())")
                    }
                }
            }
    }
    
    func getJobByCustomerCount() {
        
    }
}
