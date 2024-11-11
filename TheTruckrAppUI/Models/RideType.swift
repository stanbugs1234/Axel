//
//  RideType.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 4/11/23.
//

import Foundation

    enum RideType: Int, CaseIterable, Identifiable {
    case triaxle
    case quadaxle
    case lowboy
    
    
    var id: Int {return rawValue}
    
    var description: String {
        switch self{
        case .triaxle: return "Triaxle"
        case .quadaxle: return "Quadaxle"
        case .lowboy: return "Lowboy"
        }
    }
    
    var imageName: String{
        switch self{
        case .triaxle: return "triaxle"
        case .quadaxle: return "quadaxle"
        case .lowboy: return "lowboy"
        }
    }
        
        var baseFare: Double {
            switch self {
            case .triaxle: return 60
            case.quadaxle: return 75
            case.lowboy: return 120
            }
        }
        
        func computePrice(for distanceInMeters: Double) -> Double {
            let distanceInMiles = distanceInMeters / 1600
            
            switch self {
            case .triaxle: return distanceInMiles * 1.5 + baseFare
            case.quadaxle: return distanceInMiles * 1.75 + baseFare
            case.lowboy: return distanceInMiles * 2.5 + baseFare
            }
        }
}
