//
//  SideMenuOptionViewModel.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 4/14/23.
//

import Foundation

enum UserDetailViewModel: Int, CaseIterable, Identifiable {
//    case home
    case scheduleTrip
    case trips
    case tickets
    case trucks
    case invoices
    case assignTruck
    case profile
    case messages
    case info

    var title: String{
        switch self {
//        case .home:
//            return "Home"
        case .trips:
            return "Driver Trips"
        case .tickets:
            return "Tickets"
        case .invoices:
            return "Invoices"
        case .assignTruck:
            return "Assign Driver to Truck"
        case .scheduleTrip:
            return "Schedule Trip for Driver"
        case .messages:
            return "Messages"
        case .trucks:
            return "Trucks"
        case .profile:
            return "Profile"
        case .info:
            return "Info"
        }
    }
    
    var imageName: String {
        switch self{
//        case .home: return "house"
        case .trips: return "mappin.and.ellipse"
        case .tickets: return "note.text"
        case .invoices: return "dollarsign.circle"
        case .assignTruck: return "person.badge.key.fill"
        case .scheduleTrip: return "box.truck.badge.clock"
        case .messages: return "text.bubble"
        case .trucks: return "box.truck"
        case .profile: return "person"
        case .info: return "questionmark.circle.fill"
        }
    }
    
    var id: Int {
        return self.rawValue
        
    }
}
