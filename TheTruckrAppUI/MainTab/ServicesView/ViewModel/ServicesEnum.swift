//
//  Services.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 12/19/24.
//

import Foundation

enum ServicesEnum: Int, CaseIterable, Hashable, Identifiable, Codable {
    case reserve
    case orderNow
    
    
    var title: String {
        switch self {
        case .reserve: return "Reserve"
        case .orderNow: return "Order Now"
            
            
        }
    }
    
    var imageName: String {
        switch self {
        case .reserve: return "CalendarImage"
        case .orderNow: return "featuredTruck2"
        }
    }
    
    
    var id: Int {
        return self.rawValue
    }
}
