//
//  CustomerDetailViewModel.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 5/10/23.
//

//
//  SideMenuOptionViewModel.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 4/14/23.
//

import Foundation

enum CustomerDetailViewModel: Int, CaseIterable, Identifiable {
    case jobs

    var title: String{
        switch self {
        case .jobs:
            return "Jobs"
        }
    }
    
    var imageName: String {
        switch self{
        case .jobs: return "newspaper.circle.fill"

        }
    }
    
    
    var id: Int {
        return self.rawValue
    }
    
}
