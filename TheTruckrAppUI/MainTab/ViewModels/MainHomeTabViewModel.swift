//
//  MainHomeTabViewModel.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 4/29/23.
//

import Foundation

enum MainHomeTabViewModel: Int, CaseIterable, Hashable, Identifiable, Codable {
    case scheduleTrucks
    case yourTips
    case map
    case trucks
    case drivers
    case invoices
    case tickets
    case jobs
    case orders
    case customers
    case vendors
    case products
    case contacts
    case camera
//    case settings
    
    var title: String {
        switch self {
        case .scheduleTrucks: return "Reserve"
        case .yourTips: return "Trips"
        case .map: return "Map"
        case .trucks: return "Trucks"
        case .drivers: return "Drivers"
        case .invoices: return "Invoices"
        case .tickets: return "Tickets"
        case .jobs: return "Jobs"
        case .orders: return "Orders"
        case .customers: return "Customers"
        case .vendors: return "Vendors"
        case .products: return "Products"
        case .contacts: return "Contacts"
        case .camera: return "Upload Tickets"
//        case .settings: return "Settings"
            
        }
    }
    
    var imageName: String {
        switch self {
        case .scheduleTrucks: return "calendar.badge.plus"
        case .yourTips: return "point.topleft.down.curvedto.point.bottomright.up"
        case .map: return "map"
        case .trucks: return "box.truck"
        case .drivers: return "steeringwheel"
        case .invoices: return "doc.plaintext"
        case .tickets: return "photo"
        case .jobs: return "rectangle.stack.badge.person.crop"
        case .orders: return "filemenu.and.cursorarrow"
        case .customers: return "person.3"
        case .vendors: return "house.and.flag.circle"
        case .contacts: return "person"
        case .products: return "cart.fill"
        case .camera: return "camera"
//        case .settings: return "gear"
        }
    }
    
    var id: Int {
        return self.rawValue
    }

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
}
