//
//  OrderDriverRowView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 1/29/24.
//

import SwiftUI


struct OrderDriverRowView: View {
    let user: User
    let order: Order
    
    var body: some View {
        HStack {
            ZStack(alignment: .bottomTrailing) {
                CircularProfileImageView(user: user, size: .medium)
                
                ActiveSymbol(size: .small)
            }

            
            Text(user.fullname)
                .font(.subheadline)
            
            Spacer()
            
            VStack {
                ButtonImageFactored(size: .xxSmall, image: .active, text: "Loaded")
                    .padding(.bottom, 3)
                    .padding(.trailing, 8)
                
                HStack {
                    ButtonImageFactored(size: .xxSmall, image: .activeTrip, text: "Trips")
                    
                    Text("9")
                }
            }
            .font(.footnote)
        }
        .padding()
        .foregroundColor(.themeGreen)
    }
}

struct OrderDriverRowView_Previews: PreviewProvider {
    static var previews: some View {
        OrderDriverRowView(user: dev2.mockUser, order: dev2.mockOrder)
    }
}
