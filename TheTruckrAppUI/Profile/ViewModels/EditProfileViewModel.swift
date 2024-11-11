//
//  EditProfileViewModel.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 6/15/23.
//

import Foundation

enum EditProfileViewModel: Int, Identifiable, CaseIterable, Hashable {
    
    case company
    
    var title: String {
        switch self {
        case .company: return "Company"
        }
    }
    
    
    var imageName: String {
        switch self {
        case .company: return "briefcase.fill"
        }
    }
    
    var id: Int {
        return self.rawValue
    }
}
