//
//  VendorDetailStatView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 3/15/24.
//

import SwiftUI

struct VendorDetailStatView: View {
    var body: some View {
        VStack {
            HStack {
                //Trips
                Text("4")
                
                ButtonImageFactored(size: .xSmall, image: .trips, text: "Trips")
                    .padding(.leading, 8)
                
                Spacer()
                
                //Invoices
                Text("16")

                ButtonImageFactored(size: .xSmall, image: .orders, text: "Orders")
                    .padding(.trailing, 25)
            }
            
            HStack {
                //Trips
                Text("10")
                
                ButtonImageFactored(size: .xSmall, image: .cart, text: "Products")
                
                Spacer()
                
                //Invoices
                Text("16")

                ButtonImageFactored(size: .xSmall, image: .customers, text: "Customers")
            }
        }
        .font(.caption)
        .padding()
        .foregroundColor(.themeGreen)
    }
}

#Preview {
    VendorDetailStatView()
}
