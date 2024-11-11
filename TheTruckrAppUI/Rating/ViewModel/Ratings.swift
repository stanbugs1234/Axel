//
//  RatingViewModel.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 12/2/23.
//

import Foundation

enum Ratings: Int, Identifiable, CaseIterable, Hashable {
    case zeroStar
    case oneStar
    case twoStar
    case threeStar
    case fourStar
    case fiveStar
    
    var title: String {
        switch self {
        case .zeroStar: return ""
        case .oneStar: return "Horrible, would not recommend"
        case .twoStar: return "Poor, had several issues"
        case .threeStar: return "Moderate"
        case .fourStar: return "OK, but had an issue"
        case .fiveStar: return "Excellent, would recommend again"
        }
    }
    
    var id: Int {
        switch self {
        case .zeroStar: return 0
        case .oneStar: return 1
        case .twoStar: return 2
        case .threeStar: return 3
        case .fourStar: return 4
        case .fiveStar: return 5
        }
    }
}
