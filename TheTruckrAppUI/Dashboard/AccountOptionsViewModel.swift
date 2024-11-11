//
//  AccountViewModel.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 5/20/23.
//

import Foundation
import SwiftUI

enum AccountOptionsViewModel: Int, CaseIterable, Hashable, Identifiable, Codable {
    //    case dashboard
    case profile
    case helpAndSupport
    case about
    case logout

    
    var title: String {
        switch self {
            //        case .dashboard: return "Dashboard"
        case .profile: return "Schedule Trips"
        case .helpAndSupport: return "Help & Support"
        case .about: return "About"
        case .logout: return "Log out"

            
        }
    }
    
    var imageName: String {
        switch self {
        case .profile: return "calendar.badge.plus"
        case .helpAndSupport: return "questionmark.circle.fill"
        case .about: return "eye.fill"
        case .logout: return "rectangle.portrait.and.arrow.right.fill"

        }
    }
    
    var tintColor: Color {
        switch self {
        case .profile: return .blue
        case .helpAndSupport: return .yellow
        case .about: return .green
        case .logout: return .red
        }
    }
    
    var id: Int {
        return self.rawValue
    }
}
