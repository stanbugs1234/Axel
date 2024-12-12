//
//  PickupPassengerView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 4/17/23.
//

import SwiftUI

struct PickupPassengerView: View {
    var body: some View {
        VStack {
            Capsule()
                .foregroundColor(Color(.systemGray5))
                .frame(width: 48, height: 6)
                .padding(.top, 8)
            
        }
    }
}

struct PickupPassengerView_Previews: PreviewProvider {
    static var previews: some View {
        PickupPassengerView()
    }
}
