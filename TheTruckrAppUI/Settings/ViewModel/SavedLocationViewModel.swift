//
//  SavedLocationViewModel.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 4/15/23.
//

import Foundation

enum SavedLocatationViewModel: Int, CaseIterable, Identifiable {
    case home
    case work
    case pickUpLocation
    
    var title: String {
        switch self {
        case .home: return "Home"
        case .work: return "Work"
        case .pickUpLocation: return "Pickup Location"
        }
    }
    
    var imageName: String {
        switch self {
        case .home: return "house.circle.fill"
        case .work: return "archivebox.circle.fill"
        case .pickUpLocation: return "map"
        }
        
    }
    
    var subtitle: String {
        switch self {
        case .home: return "Add Location"
        case .work: return "Add Work"
        case .pickUpLocation: return "Add Pickup Location"
        }
    }
    
    var databaseKey: String {
        switch self {
        case .home: return "homeLocation"
        case .work: return "workLocation"
        case .pickUpLocation: return "pickUpLocation"
        }
    }
    
    func subtitle(forUser user: User)  -> String {
        switch self {
        case .home:
            if let homeLocation = user.homeLocation {
                return homeLocation.title
            } else {
                return "Add Home"
            }
        case .work:
            if let workLocation = user.workLocation {
                return workLocation.title
            } else {
                return "Add Work"
            }
            
            //TODO: change user.workLocation to user.pickUpLocation.  Leaving now to see if it will work then will add user.pickUpLocation
        case .pickUpLocation:
            if let workLocation = user.workLocation {
                return workLocation.title
            } else {
                return "Add Work"
            }
        }
    }
    
    var id: Int {return self.rawValue}
    
}
