//
//  VendorOptionMenuEnum.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 12/21/24.
//

import Foundation

enum VendorOptionMenuEnum: Int, CaseIterable, Hashable, Identifiable, Codable {
    case groupOrder
    case schedule
    case addFavorites
    case vendorInfo
    
    var title: String {
        switch self {
        case .groupOrder: return "Start group order"
        case .schedule: return "Schedule"
        case .addFavorites: return "Add to Favorites"
        case .vendorInfo: return "Store info"
        }
    }
    
    var imageName: String {
        switch self {
        case .groupOrder: return "person.fill.badge.plus"
        case .schedule: return "caldendar.badge.plus"
        case .addFavorites: return "heart"
        case .vendorInfo: return "info.circle"
        }
    }
    
    var id: Int {
        return self.rawValue
    }
}
