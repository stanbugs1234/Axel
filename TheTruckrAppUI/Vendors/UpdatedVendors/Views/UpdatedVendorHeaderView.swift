//
//  UpdatedVendorHeaderView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 12/19/24.
//

import SwiftUI
import Kingfisher

struct UpdatedVendorHeaderView: View {
    let vendor: Vendor
    let size: ProfileImageSize
    
    var body: some View {
        let abbreviatedName = initials(from: vendor.vendorFullName ?? "") ?? ""
        if vendor.id == "" {
            Image(systemName: "person")
                .resizable()
                .scaledToFill()
                .frame(width: SizeConstants.cardWidth, height: SizeConstants.cardQuarterHeight)
                .clipShape(Rectangle())
        } else {
            if vendor.vendorProfileImageUrl != "" {
                KFImage(URL(string: vendor.vendorProfileImageUrl ?? ""))
                    .resizable()
                    .frame(width: SizeConstants.cardWidth, height: SizeConstants.cardButtonHeight)
                    .scaledToFit()

                    .clipShape(Rectangle())
            } else {
                ZStack {
                    Rectangle()
                        .frame(width: size.dimension, height: size.dimension)
                        .foregroundColor(.gray)
                    
                    Text(abbreviatedName)
                        .font(size.fontSize)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                }
                .clipShape(Rectangle())
            }
        }
    }
}

#Preview {
    UpdatedVendorHeaderView(vendor: MockData.vendors[0], size: ProfileImageSize.xxLarge)
}
