//
//  UserViewModel.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 4/22/23.
//

import Foundation

enum UserViewModel: Int, CaseIterable, Identifiable {
    case employeeDriver
    case outsideHauler
    
    var title: String {
        switch self {
        case .employeeDriver: return "Driver"
        case .outsideHauler: return "Outside Hauler"
        }
    }
    
    var imageName: String {
        switch self {
        case .employeeDriver: return "house.circle.fill"
        case .outsideHauler: return "archivebox.circle.fill"
        }
        
    }
    
    var subtitle: String {
        switch self {
        case .employeeDriver: return "Add Home"
        case .outsideHauler: return "Add Work"
        }
    }
    
    var databaseKey: String {
        switch self {
        case .employeeDriver: return "homeLocation"
        case .outsideHauler: return "workLocation"
        }
    }
    
    func subtitle(forUser user: User)  -> String {
        switch self {
        case .employeeDriver:
            if let homeLocation = user.homeLocation {
                return homeLocation.title
            } else {
                return "Add Home"
            }
        case .outsideHauler:
            if let workLocation = user.workLocation {
                return workLocation.title
            } else {
                return "Add Work"
            }
        }
    }
    
    var id: Int {return self.rawValue}
    
}

