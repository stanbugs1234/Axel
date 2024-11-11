//
//  MainHomeNewsRowView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 11/4/23.
//

import SwiftUI

struct MainHomeNewsRowView: View {
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
            case .small: return 220
            case .medium: return 260
            case .large: return 280
            case .xLarge: return 330
            case .xxLarge: return 120
            }
        }
        
        var height: CGFloat {
            switch self {
            case .xxSmall: return 28
            case .xSmall: return 32
            case .small: return 70
            case .medium: return 125
            case .large: return 150
            case .xLarge: return 180
            case .xxLarge: return 120
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
        
        var fontSize: Font {
            switch self {
            case .xxSmall: return .caption2
            case .xSmall: return .footnote
            case .small: return .subheadline
            case .medium: return .title3
            case .large: return .title3
            case .xLarge: return .title2
            case .xxLarge: return .custom("xxLarge", size: 45)
            }
        }
    }
    
    let viewModel: MainHomeNewsRowViewModel
    
    let size: ButtonSize
    
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                    .frame(width: size.width, height: size.height, alignment: .center)
                    .shadow(color: .primary.opacity(0.3), radius: 10, x: 0, y: 5)
                    .foregroundColor(.backgroundColor)
                
                    HStack {
                        //MARK: Secondary Image
                        Image(systemName: viewModel.secondaryImageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: size.imageSize/3, height: size.imageSize/3)
                            .rotationEffect(.degrees(180))
                            .offset(x: -8, y: 0)
                            .padding(.leading)
                        
                        //MARK: Primary Image
                        Image(systemName: viewModel.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: size.imageSize, height: size.imageSize, alignment: .leading)
                            .offset(x: -10, y: 0)
                        
                        //MARK: Image Text
                        HStack {
                            Text(viewModel.title)
                                .font(size.fontSize)
                                .fontWeight(.semibold)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.trailing, 38)
            }
        }
        .foregroundColor(.themeGreen)
    }
}

struct MainHomeNewsRowView_Previews: PreviewProvider {
    static var previews: some View {
        MainHomeNewsRowView(viewModel: .trucks, size: .small)
    }
}

