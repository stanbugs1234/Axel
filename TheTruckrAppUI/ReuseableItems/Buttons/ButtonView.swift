//
//  SaveButtonView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 5/5/23.
//

import SwiftUI

struct ButtonView: View {
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
            case .medium: return 110
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
    }
    
    let size: ButtonSize
    
    let buttonString: String
    
    var body: some View {
        Text(buttonString)
            .bold()
            .font(size.fontSize)
            .frame(width: size.width, height: size.height, alignment: .center)
            .padding(.horizontal)
            .padding(.vertical, 8)
            .foregroundColor(.backgroundColor)
            .background(Color.opposite)
            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            .shadow(color: .primary.opacity(0.3), radius: 10, x: 0, y: 5)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(size: .medium, buttonString: "Save")
    }
}
