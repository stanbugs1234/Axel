//
//  UploadCustomerViewModel.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 6/5/23.
//

import Firebase

class UploadCustomerViewModel: ObservableObject {
    @Published var didUploadCustomer = false
    let service = CustomerService()
    
    func uploadCustomer(customerAddress: String, customerFullName: String) {
        service.uploadCustomer(customerAddress: customerAddress, customerFullName: customerFullName) { success in
            if success {
                self.didUploadCustomer = true
            } else {
                print("Did not Upload for what ever fucking reason")
            }
        }
    }
}
