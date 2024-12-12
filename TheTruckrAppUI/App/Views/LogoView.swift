//
//  Logo.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 12/8/24.
//

import SwiftUI

enum LogoImageSize {
    case xxSmall
    case xSmall
    case small
    case medium
    case large
    case xLarge
    case xxLarge
    case xxxLarge
    
    var dimension: CGFloat {
        switch self {
        case .xxSmall: return 28
        case .xSmall: return 32
        case .small: return 40
        case .medium: return 56
        case .large: return 64
        case .xLarge: return 80
        case .xxLarge: return 150
        case .xxxLarge: return 180
        }
    }
    
    var fontSize: Font {
        switch self {
        case .xxSmall: return .caption2
        case .xSmall: return .footnote
        case .small: return .subheadline
        case .medium: return .title3
        case .large: return .title2
        case .xLarge: return .title
        case .xxLarge: return .custom("xxLarge", size: 55)
        case .xxxLarge: return .custom("xxxLarge", size: 65)
        }
    }
}

struct LogoView: View {
    let size: LogoImageSize

    var body: some View {
        Image(AppConstants.appImage)
            .resizable()
            .frame(width: size.dimension,
                   height: size.dimension,
                   alignment: .center)
            .foregroundStyle(.secondary)
    }
}

#Preview {
    LogoView(size: .large)
}
