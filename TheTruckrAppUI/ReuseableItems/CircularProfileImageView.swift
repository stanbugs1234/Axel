//
//  CircularProfileImageView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 1/16/24.
//

import SwiftUI
import Kingfisher

enum ProfileImageSize {
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

struct CircularProfileImageView: View {
    var user: User?
    let size: ProfileImageSize

    
    var body: some View {
        let abbreviatedName = initials(from: user?.fullname ?? "") ?? ""
        if user?.uid == "" {
            Image(systemName: "person")
                .resizable()
                .scaledToFill()
                .frame(width: size.dimension, height: size.dimension)
                .clipShape(Circle())
        } else {
        if user?.profileImageUrl != "" {
            KFImage(URL(string: user?.profileImageUrl ?? ""))
                .resizable()
                .scaledToFill()
                .frame(width: size.dimension, height: size.dimension)
                .clipShape(Circle())
        } else {
            ZStack {
                Circle()
                    .frame(width: size.dimension, height: size.dimension)
                    .foregroundColor(.gray)
                
                Text(abbreviatedName)
                    .font(size.fontSize)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
            }
            .clipShape(Circle())
        }
        }
    }
}


struct CircularProfileImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProfileImageView(user: dev2.mockUser, size: .xxxLarge)
    }
}
