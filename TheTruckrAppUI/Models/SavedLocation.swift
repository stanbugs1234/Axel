//
//  SavedLocation.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 4/15/23.
//

import Firebase

struct SavedLocation: Codable {
    let title: String
    let address: String
    let coordinates: GeoPoint
}
