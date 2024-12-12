//
//  DeliveryOptionMenuEnum.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 12/18/24.
//

import Foundation

enum DeliveryOptionMenuEnum: Int, CaseIterable, Hashable, Identifiable, Codable {
    case delivery
    case pickup
        
    var title: String {
        switch self {
        case .delivery: return "Delivery"
        case .pickup: return "Pickup"
        }
    }
    
    var imageName: String {
        switch self {
        case .delivery: return "truck.box"
        case .pickup: return "figure.walk"
        }
    }
    
    var id: Int {
        return self.rawValue
    }
}

