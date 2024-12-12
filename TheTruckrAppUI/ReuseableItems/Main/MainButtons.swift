//
//  MainButtons.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 4/29/23.
//

import SwiftUI

enum ButtonSize {
    case xxSmall
    case xSmall
    case small
    case medium
    case large
    case xLarge
    case xxLarge
    
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
    var fontSize: Font {
        switch self {
        case .xxSmall: return .caption2
        case .xSmall: return .footnote
        case .small: return .subheadline
        case .medium: return .title3
        case .large: return .title2
        case .xLarge: return .title
        case .xxLarge: return .custom("xxLarge", size: 45)
        }
    }
}

struct MainButtons: View {
    var viewModel: MainHomeTabViewModel
    let size: ButtonSize
    
    var body: some View {
        ZStack {
            VStack {
                Image(systemName: viewModel.imageName)
                    .resizable()
                    .frame(width: size.dimension, height: size.dimension)
                    .scaledToFill()

                Text(viewModel.title)
                    .font(size.fontSize)
                    .fontWeight(.semibold)
            }
            .frame(width: 100, height: 100, alignment: .center)
            .foregroundColor(.themeGreen)
            .background(Color.backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .shadow(color: .primary.opacity(0.3), radius: 10, x: 0, y: 5)
        }
    }
}

struct MainButtons_Previews: PreviewProvider {
    static var previews: some View {
        MainButtons(viewModel: .scheduleTrucks, size: .small)
    }
}
