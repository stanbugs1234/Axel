//
//  ActiveSymbol.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 1/19/24.
//

import SwiftUI


struct ActiveSymbol: View {
    
    enum  SymboleSize {
        case xxSmall
        case xSmall
        case small
        case medium
        case large
        case xLarge
        case xxLarge
        
        var dimension: CGFloat {
            switch self {
            case .xxSmall: return 5
            case .xSmall: return 10
            case .small: return 14
            case .medium: return 18
            case .large: return 24
            case .xLarge: return 28
            case .xxLarge: return 30
            }
        }
        var dimension2: CGFloat {
            switch self {
            case .xxSmall: return 2
            case .xSmall: return 7
            case .small: return 10
            case .medium: return 14
            case .large: return 20
            case .xLarge: return 22
            case .xxLarge: return 34
            }
        }
    }
    
        let size: SymboleSize
    
    var body: some View {
        ZStack {
            Circle()
                .fill(.white)
                .frame(width: size.dimension, height: size.dimension)
            
            Circle()
                .fill(Color(.systemGreen))
                .frame(width: size.dimension2, height: size.dimension2)
        }
    }
}

#Preview {
    ActiveSymbol(size: .xSmall)
}
