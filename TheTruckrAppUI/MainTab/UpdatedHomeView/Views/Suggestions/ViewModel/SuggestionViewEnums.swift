//
//  SuggestionViewModel.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 12/16/24.
//

import Foundation

enum SuggestionViewEnums: Int, CaseIterable, Hashable, Identifiable, Codable {
    case truck
    case quad
    case lowboy
    case equipment
        
    var title: String {
        switch self {
        case .truck: return "Triaxle"
        case .quad: return "Quadaxle"
        case .lowboy: return "Lowboy"
        case .equipment: return "Equipment Rentals"
        }
    }
    
    var imageName: String {
        switch self {
        case .truck: return "featuredTruck1"
        case .quad: return "featuredTruck2"
        case .lowboy: return "updatedLowBoy"
        case .equipment: return "equipmentRental"
        }
    }
    
    var id: Int {
        return self.rawValue
    }
}
