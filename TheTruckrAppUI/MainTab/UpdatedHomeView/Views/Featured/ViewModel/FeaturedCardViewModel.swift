//
//  FeaturedCardViewModel.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 12/15/24.
//

import Foundation

enum FeaturedCardViewModel: Int, CaseIterable, Hashable, Identifiable, Codable {
    case pmc
    case otwell
    case threeC
        
    var title: String {
        switch self {
        case .pmc: return "PMC"
        case .otwell: return "Otwell Services"
        case .threeC: return "Three C's Properties"
        }
    }
    
    var imageName: String {
        switch self {
        case .pmc: return "pmc"
        case .otwell: return "otwell"
            case .threeC: return "threecs"
        }
    }
    
    var rating: Decimal {
        switch self {
        case .pmc: return 3.8
        case .otwell: return 4.1
        case .threeC: return 4.5
        }
    }
    
    var id: Int {
        return self.rawValue
    }
}
