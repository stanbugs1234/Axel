//
//  VendorViewModel.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 5/8/23.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import Firebase

class VendorViewModel: ObservableObject {
    @Published var vendors = [Vendor]()
    @Published var searchText = ""
    
    let uid = UserService.shared.currentUser?.uid
    
    var searchableVendors: [Vendor] {
        if searchText.isEmpty {
            return vendors
        } else {
            let lowercasedQuery = searchText.lowercased()
            
            return vendors.filter({
                $0.vendorFullName.lowercased().contains(lowercasedQuery) ||
                $0.vendorAddressName.lowercased().contains(lowercasedQuery)
            })
        }
    }
    
    let service = VendorService()
    
    init() {
        fetchUserVendors(forUid: uid ?? "") { vendors in
            self.vendors = vendors
        }
    }

    func fetchUserVendors(forUid uid: String, completion: @escaping([Vendor]) -> Void) {
        Firestore.firestore().collection("vendors")
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
    
    

