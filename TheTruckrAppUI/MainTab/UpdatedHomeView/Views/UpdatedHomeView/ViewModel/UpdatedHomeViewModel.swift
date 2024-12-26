//
//  UpdatedHomeViewModel.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 12/18/24.
//

import Foundation

class UpdatedHomeViewModel: ObservableObject {
    @Published var deliveryOption: DeliveryOptionMenuEnum = .delivery
    @Published var deliveryType: UpdatedHomeRowCategoryViewModel = .triaxle
    @Published var filterType: ActivityFilterViewModel = .business
    @Published var searchText: String = ""
    @Published var vendors = [Vendor]()
    
    let service = VendorService()
    
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
    
    init() {
        fetchVendors()
    }
    
    //MARK: Fetch All Vendors
    func fetchVendors() {
        service.fetchVendors { vendors in
            self.vendors = vendors
        }
    }
    
 
    
    
    
}
