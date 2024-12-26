//
//  VendorRowViewModel.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 12/24/24.
//

import Foundation

class VendorRowViewModel: ObservableObject {
    @Published var vendor: Vendor
    @Published var services = [Services]()
    
    let service: VendorService = VendorService()
    
    init(vendor: Vendor) {
        self.vendor = vendor
        checkIfUserLikedVendor()
        getVendorServices()
    }
    
    func getVendorServices() {
        service.fetchVendorServiceCategories(forUid: vendor.vendorId!) { services in
            self.services = services
        }
    }
 
    func checkIfUserLikedVendor() {
        service.checkIfUserLikedVendor(vendor) { didLike in
            if didLike {
                self.vendor.didLike = true
            }
            
        }
    }
    
    func likeVendor() {
        service.likeVendor(vendor) {
            self.vendor.didLike = true
        }
    }
    
    func unlikeVendor() {
        service.unlikeVendor(vendor) {
            self.vendor.didLike = false
        }
    }
}
