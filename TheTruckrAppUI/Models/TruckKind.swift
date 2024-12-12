//
//  TruckKind.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 12/8/24.
//

import Foundation

enum TruckKind: Int, CaseIterable, Hashable, Identifiable, Codable {
    case triaxle
    case quadaxle
    case lowboy
    
    
    var title: String {
        switch self {
            //        case .dashboard: return "Dashboard"
        case .triaxle: return "Triaxle"
        case .quadaxle: return "Quadaxle"
        case .lowboy: return "Lowboy"
            
            
        }
    }
    
//    var imageName: String {
//        switch self {
//        case .profile: return "calendar.badge.plus"
//        case .helpAndSupport: return "questionmark.circle.fill"
//        case .about: return "eye.fill"
//        case .logout: return "rectangle.portrait.and.arrow.right.fill"
//            
//        }
//    }
    
    var id: Int {
        return self.rawValue
    }
}
