//
//  MessageSideMenuViewModel.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 5/15/23.
//

import Foundation

enum MessageSideMenuViewModel: Int, CaseIterable, Identifiable {
    
    case profile
    case lists
    case bookmarks
    case settings
    case logout
    
    var title: String {
        switch self {
        case .profile: return "Profile"
        case .lists: return "Lists"
        case .bookmarks: return "Bookmarks"
        case .settings: return "Settings"
        case .logout: return "Logout"
        }
    }
    
        var imageName: String {
            switch self {
            case .profile: return "person"
            case .lists: return "list.bullet"
            case .bookmarks: return "bookmark"
            case .settings: return "gear"
            case .logout: return "arrow.left.square"

        }
    }
    
    var id: Int {
        return self.rawValue
    }
}
