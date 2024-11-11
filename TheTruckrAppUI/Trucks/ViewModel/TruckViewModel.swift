//
//  TruckViewModel.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 4/23/23.
//

import Foundation

enum TruckViewModel: Int, CaseIterable, Identifiable, Decodable {
    case triaxle
    case quadaxle
    case lowboy
    
    var title: String {
        switch self {
        case .triaxle: return "Home"
        case .quadaxle: return "Work"
        case .lowboy: return "Lowboy"
        }
    }
    
    var imageName: String {
        switch self {
        case .triaxle: return "triaxle"
        case .quadaxle: return "quadaxle"
        case .lowboy: return "lowboy"
        }
        
    }
    
    var subtitle: String {
        switch self {
        case .triaxle: return "Add Home"
        case .quadaxle: return "Add Work"
        case .lowboy: return "Lowboy"
        }
    }
    
    var databaseKey: String {
        switch self {
        case .triaxle: return "homeLocation"
        case .quadaxle: return "workLocation"
        case .lowboy: return "Lowboy"
        }
    }
    
    func subtitle(forUser user: User)  -> String {
        switch self {
        case .triaxle:
            if let homeLocation = user.homeLocation {
                return homeLocation.title
            } else {
                return "Add Home"
            }
        case .quadaxle:
            if let workLocation = user.workLocation {
                return workLocation.title
            } else {
                return "Add Work"
            }
        case .lowboy: return "Lowboy"
        }
    }
    
    var id: Int {return self.rawValue}
    
}

//enum TruckRowViewModel:
