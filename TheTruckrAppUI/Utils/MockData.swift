//
//  MockData.swift
//  AccordUI
//
//  Created by Stan Bugusky on 3/16/24.
//

import Foundation
import Firebase

struct MockData {
   
    static let users: [User] = [
        .init(fullname: "Stan Bugusky",
                email: "Stanbugs1234@icloud.com",
                coordinates: GeoPoint(latitude: 29.9511, longitude: 90.0812),
                accountType: .driver,
                homeLocation: nil,
                workLocation: nil,
                profileImageUrl: "https://firebasestorage.googleapis.com:443/v0/b/thetruckrapp.appspot.com/o/profile_image%2FC42E3FD9-85C8-47FC-BA93-8DBB318C304C?alt=media&token=a1b78c65-4af3-4525-8b65-769add5eb3ee"),
        .init(fullname: "Matt McMahon",
                email: "MMcMahon@RNGD.com",
                coordinates: GeoPoint(latitude: 29.9511, longitude: 90.0812),
                accountType: .driver,
                homeLocation: nil,
                workLocation: nil,
                profileImageUrl: ""),
        
    ]
}
