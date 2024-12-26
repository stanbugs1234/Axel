//
//  SearchViewModel.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 12/26/24.
//

import Foundation

class SearchViewModel: ObservableObject {
    @Published var selectedVendors = [Vendor]()
    
    let service = VendorService()
    
//    init() {
//        fetchVendorsByCategory(forVendorId: vendorId, serviceCategory: Int) { vendors in
//            self.selectedVendors = vendors
//        }
//    }
//    
    //MARK: Fetch Vendors by Category
    func fetchVendorsByCategory(forVendorId vendorUid: String, serviceCategory: Int, completion: @escaping([Vendor]) -> Void) {
        service.fetchVendorsByCategory(forVendorId: vendorUid, serviceCategory: serviceCategory) { vendors in
            self.selectedVendors = vendors
        }
    }
}
