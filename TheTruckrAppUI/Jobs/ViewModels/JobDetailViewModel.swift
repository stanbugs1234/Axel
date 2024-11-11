//
//  JobDetailViewModel.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 5/13/23.
//

import Foundation

enum JobDetailViewModel: Int, Identifiable, CaseIterable, Hashable {
    
    case scheduleTrips
    case info
    case trips
    case tickets
    case invoices
    case locations


    var title: String{
        switch self {
        case .info:
            return "Info"
        case .trips:
            return "Trips"
        case .tickets:
            return "Tickets"
        case .invoices:
            return "Invoices"
        case .scheduleTrips:
            return "Schedule Trip"
        case .locations:
            return "Locations"
        }
    }
    
        var imageName: String {
            switch self {
            case .info: return "info.bubble"
            case .trips: return "mappin.and.ellipse"
            case .tickets: return "note.text"
            case .invoices: return "dollarsign.circle"
            case .scheduleTrips: return "point.topleft.down.curvedto.point.bottomright.up"
            case .locations: return "map.fill"
            
        }
    }
    
    var id: Int {
        return self.rawValue
    }
}
