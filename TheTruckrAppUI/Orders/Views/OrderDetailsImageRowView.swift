//
//  OrderDetailsImageRowView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 1/23/24.
//

import SwiftUI

struct OrderDetailsImageRowView: View {
    let order: Order
    var body: some View {
        HStack {
            VStack {
                ButtonImageFactored(size: .xSmall, image: .orders, text: "Trucks Requested: ")
                    .padding(.leading, 6)
                    .padding(.bottom, 10)
                
                ButtonImageFactored(size: .xSmall, image: .truck, text: "Trucks Filed: ")
                    .padding(.trailing, 18)
            }
            .padding(.vertical)
            
            VStack {
                Text("\(order.numberOfTrucks)")
                    .padding(.bottom)
                
                Text("\(order.numberOfTrucks)")
            }
            .foregroundColor(.secondary)
            .font(.footnote)
            
            Spacer()
            
            VStack {
                ButtonImageFactored(size: .xSmall, image: .drivers, text: "Drivers: ")
                    .padding(.bottom, 10)
                
                ButtonImageFactored(size: .xSmall, image: .activeTrip, text: "Order Trips: ")
            }
            
            VStack {
                Text("3")
                    .padding(.bottom)
                
                
                Text("15")
            }
            .foregroundColor(.secondary)
            .font(.footnote)
            .padding(.trailing, 25)
        }
        .foregroundColor(.themeGreen)
    }
}

struct OrderDetailsImageRowView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            OrderDetailsImageRowView(order: dev2.mockOrder)
        }
    }
}
