//
//  UploadVendorViewModel.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 6/14/23.
//

import Firebase

class UploadVendorViewModel: ObservableObject {
    @Published var didUploadVendor = false
    let service = VendorService()
    
    func uploadVendor(vendorFullName: String,
                      vendorCompanyId: String?,
                      vendorAddressName: String) {  
        service.uploadVendor(
            vendorFullName: vendorFullName,
            vendorCompanyId: vendorCompanyId!,
            vendorAddressName: vendorAddressName) { success in
            if success {
                self.didUploadVendor = true
            } else {
                print("Did not Upload for what ever fucking reason")
            }
        }
    }
}
