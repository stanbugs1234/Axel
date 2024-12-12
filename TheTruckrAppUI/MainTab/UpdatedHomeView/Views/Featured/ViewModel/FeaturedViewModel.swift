//
//  FeaturedViewModel.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 12/19/24.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import Firebase

class FeaturedViewModel: ObservableObject {
    @Published var vendors = [Vendor]()
    
    let uid = UserService.shared.currentUser?.uid
    
    let service = VendorService()
    
    init() {
        fetchVendors()
    }
    
    func fetchVendors() {
        service.fetchVendors { vendors in
            self.vendors = vendors
        }
    }

    func fetchUserVendors(forUid uid: String, completion: @escaping([Vendor]) -> Void) {
        FirestoreConstants.VendorCollection
            .whereField("uid", isEqualTo: uid)
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else {return}
                
                let vendors = documents.compactMap({
                    try? $0.data(as: Vendor.self)
                })
                
                completion(vendors)
            }
        }
}
