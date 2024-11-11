//
//  Product.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 5/17/23.
//

import Foundation
import FirebaseFirestoreSwift
import Firebase

enum productState: Int, Codable, Hashable {
    case activeProduct
    case inactiveProduct
}

struct Product: Identifiable, Codable, Hashable {
    @DocumentID var productId: String?
    let productFullName: String
    let companyName: String
    let productCategory: String

    
    var id: String {
        return productId ?? ""
    }
}
