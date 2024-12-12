//
//  MainListButtonView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 11/13/24.
//

import SwiftUI

enum MainButtonSize {
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
        case .small: return .body
        case .medium: return .title3
        case .large: return .title2
        case .xLarge: return .title
        case .xxLarge: return .custom("xxLarge", size: 45)
        }
    }
}

struct MainListButtonView: View {
    var viewModel: MainHomeTabViewModel
    let size: MainButtonSize
    
    var body: some View {
        ZStack {
            HStack {
                Image(systemName: viewModel.imageName)
                    .resizable()
                    .frame(width: size.dimension, height: size.dimension)
                    .scaledToFill()
                    .padding(.leading, 25)
                
                Text(viewModel.title)
                    .font(size.fontSize)
                    .fontWeight(.semibold)
                    .padding(.leading, 25)
                
                Spacer()
               
            }
            .frame(width: SizeConstants.cardWidth, height: SizeConstants.cardButtonHeight)
            .foregroundColor(.themeGreen)
            .background(Color.backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            .shadow(color: .primary.opacity(0.3), radius: 5, x: 0, y: 2.5)
            .padding(.horizontal)
        }
    }
}
#Preview {
    MainListButtonView(viewModel: .scheduleTrucks, size: .small)
}
