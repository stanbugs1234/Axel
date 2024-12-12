//
//  DriverHomeScreenButtonImage.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 12/5/24.
//

import SwiftUI

struct DriverHomeScreenButtonImage: View {
    let imageName: String
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        ZStack {
            Image(imageName)
                .resizable()
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            VStack {
                Text("Schedule")
                    .fontWeight(.semibold)
                    .font(.subheadline)
                    .offset(y: 35)
            }
        }
        .frame(width: width,
               height: height)
        .foregroundStyle(.black)
    }
}

#Preview {
    DriverHomeScreenButtonImage(imageName: "CalendarImage", width: SizeConstants.cardHalfWidth, height: SizeConstants.cardButtonHeight)
}
