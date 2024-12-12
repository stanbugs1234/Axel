//
//  SearchCategoriesEnum.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 12/22/24.
//

import Foundation

enum SearchCategoriesEnum: Int, CaseIterable, Hashable, Identifiable, Codable {
    case triaxle
    case quadaxle
    case lowboy
    case stone
    case sand
    case clay
    case equipmentRentals
    
    
    var title: String {
        switch self {
        case .triaxle: return "Triaxle"
        case .quadaxle: return "Quadaxle"
        case .lowboy: return "Lowboy"
        case .stone: return "Stone"
        case .sand: return "Sand"
        case .clay: return "Clay"
        case .equipmentRentals: return "Equipment Rentals"
            
        }
    }
    
    var imageName: String {
        switch self {
        case .triaxle: return "triaxle"
        case .quadaxle: return "quadaxle"
        case .lowboy: return "lowboy"
        case .stone: return "stone"
        case .sand: return "sand"
        case .clay: return "clay"
        case .equipmentRentals: return "equipmentRental"
        }
    }
    
    //    var secondaryImageName: String {
    //        switch self {
    //        case .trucks: return "wind"
    //        case .invoice: return ""
    //        case .schedule: return ""
    //        }
    //    }
    
    var id: Int {
        return self.rawValue
    }
}
