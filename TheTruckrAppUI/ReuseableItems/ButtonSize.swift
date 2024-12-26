//
//  ButtonSize.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 12/13/24.
//

import Foundation
import SwiftUICore

enum ButtonSize {
    case xxSmall
    case xSmall
    case small
    case medium
    case large
    case xLarge
    case xxLarge
    
    var width: CGFloat {
        switch self {
        case .xxSmall: return 28
        case .xSmall: return 32
        case .small: return 40
        case .medium: return 50
        case .large: return 64
        case .xLarge: return 80
        case .xxLarge: return 120
        }
    }
    
    var height: CGFloat {
        switch self {
        case .xxSmall: return 28
        case .xSmall: return 32
        case .small: return 40
        case .medium: return 20
        case .large: return 64
        case .xLarge: return 80
        case .xxLarge: return 120
        }
    }
    
    var fontSize: Font {
        switch self {
        case .xxSmall: return .caption2
        case .xSmall: return .footnote
        case .small: return .subheadline
        case .medium: return .subheadline
        case .large: return .headline
        case .xLarge: return .title
        case .xxLarge: return .custom("xxLarge", size: 45)
        }
    }
    
    var imageSize: CGFloat {
        switch self {
        case .xxSmall: return 28
        case .xSmall: return 32
        case .small: return 40
        case .medium: return 56
        case .large: return 64
        case .xLarge: return 75
        case .xxLarge: return 120
        }
    }
    
    var dimension: CGFloat {
        switch self {
        case .xxSmall: return 28
        case .xSmall: return 32
        case .small: return 50
        case .medium: return 56
        case .large: return 64
        case .xLarge: return 80
        case .xxLarge: return 120
        }
    }
    
    var iconSize: CGFloat {
        switch self {
        case .xxSmall: return 8
        case .xSmall: return 13
        case .small: return 20
        case .medium: return 30
        case .large: return 64
        case .xLarge: return 80
        case .xxLarge: return 120
        }
    }
}
