//
//  UberInfoRowView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 11/26/24.
//

import SwiftUI

struct ReservationInfoRowView: View {
    var image: String
    var title: String

    
    var body: some View {
        HStack {
            Image(systemName: image)
                .resizable()
                .frame(width: 30, height: 30, alignment: .center)
            
            Text(title)
                .padding(.leading)
            
            Spacer()
        }
        .padding(.bottom, 35)
    }
}

#Preview {
    ReservationInfoRowView(image: "person.badge.clock.fill", title: "Extra wait time included to meet your ride" )
}
