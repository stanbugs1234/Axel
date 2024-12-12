//
//  DriverScheduleView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 11/28/24.
//

import SwiftUI

struct DriverScheduleView: View {
    var body: some View {
        ZStack {
            Image("CalendarImage")
                .resizable()
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            VStack {
                Text("Schedule")
                    .fontWeight(.semibold)
                    .font(.subheadline)
                    .offset(y: 35)
            }
        }
        .frame(width: SizeConstants.cardHalfWidth,
               height: SizeConstants.cardButtonHeight)
        .foregroundStyle(.black)
    }
}

#Preview {
    DriverScheduleView()
}
