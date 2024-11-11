//
//  ModelCustomerDetailView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 5/10/23.
//

import Foundation

enum ModelCustomerDetailView: Int, Identifiable, CaseIterable, Hashable {
    
    case scheduleTrips
    case info
    case jobs
    case trips
    case tickets
    case invoices
    case contacts

    
    
    var title: String{
        switch self {
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
        case .scheduleTrips:
            return "Schedule Trip"
        case .contacts:
            return "Contacts"
        }
    }
    
        var imageName: String {
            switch self {
            case .info: return "info.bubble"
            case .jobs: return "doc.richtext"
            case .trips: return "mappin.and.ellipse"
            case .tickets: return "note.text"
            case .invoices: return "dollarsign.circle"
            case .scheduleTrips: return "point.topleft.down.curvedto.point.bottomright.up"
            case .contacts: return "person"
            
        }
    }
    
    var id: Int {
        return self.rawValue
    }
}

