//
//  VendorDetailViewModel.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 5/11/23.
//

import Foundation


enum VendorDetailViewModel: Int, CaseIterable, Identifiable {
    case scheduleTrips
    case info
    case jobs
    case trips
    case tickets
    case invoices
    case products
    case locations
    case contacts

    
    var title: String{
        switch self {
        case .scheduleTrips:
            return "Schedule Trips"
        case .info:
            return "Info"
        case .jobs:
            return "Jobs"
        case .trips:
            return "Trips"
        case .tickets:
            return "Tickets"
        case .invoices:
            return "Invoices"
        case .products:
            return "Products"
        case .locations:
            return "Locations"
        case .contacts:
            return "Contacts"
        }
    }
    
    var imageName: String {
        switch self {
        case .scheduleTrips: return "point.topleft.down.curvedto.point.bottomright.up"
        case .info: return "info.bubble"
        case .jobs: return "doc.richtext"
        case .trips: return "mappin.and.ellipse"
        case .tickets: return "note.text"
        case .invoices: return "dollarsign.circle"
        case .products: return "target"
        case .locations: return "map.fill"
        case .contacts: return "person.2.fill"
    }
}
    
    var id: Int {
        return self.rawValue
    }
}
