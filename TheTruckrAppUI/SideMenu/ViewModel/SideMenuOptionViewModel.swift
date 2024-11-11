//
//  SideMenuOptionViewModel.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 4/14/23.
//

import Foundation

enum SideMenuOptionViewModel: Int, CaseIterable, Identifiable {
    case home
    case trips
    case tickets
    case drivers
    case trucks
    case wallet
    case customers
//    case vendors
    case messages
    case settings
 
    
    var title: String{
        switch self {
        case .home:
            return "Home"
        case .trips:
            return "Your Trips"
        case .tickets:
            return "Tickets"
        case .drivers:
            return "Drivers"
        case .wallet:
            return "Wallet"
        case .customers:
            return "Customers"
//        case .vendors:
//            return "Vendors"
        case .settings:
            return "Settings"
        case .messages:
            return "Messages"
        case .trucks:
            return "Trucks"
        }
    }
    
    var imageName: String {
        switch self{
        case .home: return "house"
        case .trips: return "mappin.and.ellipse"
        case .tickets: return "note.text"
        case .drivers: return "person"
        case .wallet: return "dollarsign.circle"
        case .customers: return "person.3"
//        case .vendors: return "homekit"
        case .settings: return "gearshape"
        case .messages: return "text.bubble"
        case .trucks: return "box.truck"
        }
    }
    
    var id: Int {
        return self.rawValue
    }
}
