//
//  MainTabHorizontalScrollViewModel.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 5/6/23.
//

//
//  MainHomeTabViewModel.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 4/29/23.
//

import Foundation

enum MainTabHorizontalScrollViewModel: Int, CaseIterable, Identifiable {
    case scheduleTrucks
    case map
    case trucks
    case drivers
    case tickets
    
    var title: String {
        switch self {
        case .scheduleTrucks: return "Schedule Trips"
        case .map: return "Map"
        case .trucks: return "Trucks"
        case .drivers: return "Drivers"
        case .tickets: return "Tickets"

            
        }
    }
    
    var imageName: String {
        switch self {
        case .scheduleTrucks: return "calendar.badge.plus"
        case .map: return "map"
        case .trucks: return "box.truck"
        case .drivers: return "steeringwheel"
        case .tickets: return "photo"

        }
    }
    
    var id: Int {
        return self.rawValue
    }
}

