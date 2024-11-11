//
//  TruckFilledImage.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 1/22/24.
//

import SwiftUI

struct ButtonImageFactored: View {
    
    enum ButtonImage {
        case truckFilled
        case truck
        case orders
        case customers
        case trips
        case activeTrip
        case active
        case inactive
        case drivers
        case ticket
        case driver
        case cart
        case stone
        
        
        var imageName: String {
            switch self {
            case .truckFilled: return "truck.box.badge.clock.fill"
            case .orders: return "note.text"
            case .customers: return "person.fill"
            case .truck: return "truck.box.fill"
            case .trips: return "point.bottomleft.forward.to.point.topright.scurvepath.fill"
            case .activeTrip: return "point.bottomleft.forward.to.arrowtriangle.uturn.scurvepath.fill"
            case .active: return "circle.badge.checkmark.fill"
            case .inactive: return "circle.badge.xmark"
            case .drivers: return "person.2.badge.key.fill"
            case .ticket: return "doc.richtext.fill"
            case .driver: return "person.badge.key.fill"
            case .cart: return "cart.fill"
            case .stone: return "mountain.2.fill"
            }
        }
        
//        var secondaryImageName: String? {
//            switch self {
//            case .truckFilled: return ""
//            case .orders: return ""
//            }
//        }
//        
//        var imageText: String? {
//            switch self {
//            case .truckFilled: return ""
//            case .orders: return ""
//            }
//        }
    }
    
    enum ImageSize {
        case xxSmall
        case xSmall
        case small
        case medium
        case large
        case xLarge
        case xxLarge
        
        var dimension: CGFloat {
            switch self {
            case .xxSmall: return 15
            case .xSmall: return 20
            case .small: return 28
            case .medium: return 46
            case .large: return 54
            case .xLarge: return 70
            case .xxLarge: return 90
            }
        }
        
        var fontSize: Font {
            switch self {
            case .xxSmall: return .caption
            case .xSmall: return .caption
            case .small: return .subheadline
            case .medium: return .title3
            case .large: return .title2
            case .xLarge: return .title
            case .xxLarge: return .custom("xxLarge", size: 45)
            }
        }
    }
    
    let size: ImageSize
    let image: ButtonImage
    let text: String?
    
    var body: some View {
        HStack() {

                Image(systemName: image.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: size.dimension, height: size.dimension)
//            
//            Image(systemName: image.secondaryImageName ?? "")
//                    .resizable()
//                    .scaledToFill()
//                    .frame(width: size.dimension/2, height: size.dimension/2)
//                    .foregroundColor(.green)

            Text(text ?? "")
                .font(size.fontSize)
        }
        .padding(.horizontal)
    }
}

#Preview {
    ButtonImageFactored(size: .xSmall, image: .truckFilled, text: "Trucks Filled")
}
