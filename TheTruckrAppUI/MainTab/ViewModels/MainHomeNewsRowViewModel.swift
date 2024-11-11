//
//  MainHomeNewsRowViewModel.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 11/4/23.
//

import Foundation

enum MainHomeNewsRowViewModel: Int, CaseIterable, Hashable, Identifiable, Codable {
    case trucks
    case schedule
    case invoice

    
    var title: String {
        switch self {
        case .trucks: return "Truck Status"
        case .invoice: return "Invoice"
        case .schedule: return "Reserve A Truck"
            
        }
    }
    
    var imageName: String {
        switch self {
        case .trucks: return "box.truck.fill"
        case .invoice: return "doc.fill"
        case .schedule: return "calendar.badge.clock"
        }
    }
    
    var secondaryImageName: String {
        switch self {
        case .trucks: return "wind"
        case .invoice: return ""
        case .schedule: return ""
        }
    }
    
    var id: Int {
        return self.rawValue
    }
}
