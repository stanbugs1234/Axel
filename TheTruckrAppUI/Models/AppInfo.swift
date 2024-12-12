//
//  AppInfo.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 12/8/24.
//

import Foundation

enum AppInfo: Int, CaseIterable, Hashable, Identifiable, Codable {
    case app
    
    var title: String {
        switch self {
        case .app: return "Axel"
        }
    }
}
