//
//  UpdatedVendorViewModel.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 12/24/24.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import Firebase

class UpdatedVendorViewModel: ObservableObject {
    @Published var vendors = [Vendor]()
    
    init() {
        
    }
}
