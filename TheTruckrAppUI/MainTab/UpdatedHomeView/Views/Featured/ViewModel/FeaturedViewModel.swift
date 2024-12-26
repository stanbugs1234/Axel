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
    @Published var services = [Services]()
    @Published var selectedCategoryVendors = [Vendor]()
    
    let uid = UserService.shared.currentUser?.uid
    
    let service = VendorService()
    
    
    
    init() {
        fetchVendors()
    }
    
    //MARK: Fetch All Vendors
    func fetchVendors() {
        service.fetchVendors { vendors in
            self.vendors = vendors
        }
    }

    
    //MARK: Fetch Vendors by Category
    func fetchVendorsByCategory(forVendorId vendorUid: String, serviceCategory: Int, completion: @escaping([Vendor]) -> Void) {
        service.fetchVendorsByCategory(forVendorId: vendorUid, serviceCategory: serviceCategory) { vendors in
            self.selectedCategoryVendors = vendors
        }
    }
    
    //MARK: Fetch Services for Vendor
    func fetchVendorServiceCategories(forUid vendorUid: String, completion: @escaping([Services]) -> Void) {
        service.fetchVendorServiceCategories(forUid: vendorUid) { services in
            self.services = services
        }
    }
    
    //MARK: FetchUserVendors
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
