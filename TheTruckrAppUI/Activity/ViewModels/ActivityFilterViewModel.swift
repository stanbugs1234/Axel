//
//  ActivityFilterViewModel.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 12/15/24.
//

import Foundation

enum ActivityFilterViewModel: Int, CaseIterable, Hashable, Identifiable, Codable {
    case personal
    case business
        
    var title: String {
        switch self {
        case .personal: return "Personal"
        case .business: return "Business"
        }
    }
    
    var imageName: String {
        switch self {
        case .personal: return "person.fill"
        case .business: return "suitcase.fill"
        }
    }
    
    var id: Int {
        return self.rawValue
    }
}
