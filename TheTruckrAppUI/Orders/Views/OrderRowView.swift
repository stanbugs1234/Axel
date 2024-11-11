//
//  OrderRowView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 6/23/23.
//

import SwiftUI

struct OrderRowView: View {
    let order: Order
    
    var body: some View {
        VStack {
            //MARK: Date & Customer Name
            HStack {
                Text(order.customerName)
                    .font(.headline)
                    .bold()
                    .padding(.bottom, 18)
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text(order.orderDate.dateDisplayFormat)
                    
                    
                    Text(order.orderDate.timeOnlyDisplayFormat)
                }
                .font(.footnote)
                .foregroundColor(.secondary)
            }
            
            
            //MARK: Jobs
            
            
            //MARK: Trucking Information
            //MARK: Requested Trucks
            HStack {
                VStack {
                    ButtonImageFactored(size: .xSmall,
                                        image: .orders,
                                        text: "Trucks Ordered: ")
                    
                    ButtonImageFactored(size: .xSmall,
                                        image: .truckFilled,
                                        text: "Trucks Filled: ")
                    .padding(.trailing, 10)
                }
                
                
                VStack(alignment: .trailing) {
                    
                    Text(order.numberOfTrucks.description)
                        .foregroundColor(.secondary)
                        .padding(.bottom, 6)
                    
                    
                    Text(order.numberOfTrucks.description)
                        .foregroundColor(.secondary)
                }
                .padding(.vertical)
                
                
                Spacer()
                
                VStack {
                    ButtonImageFactored(size: .xSmall, image: .ticket, text: "Tickets: ")
                        .padding(.bottom, 5)
                    
                    ButtonImageFactored(size: .xSmall, image: .drivers, text: "Drivers: ")
                }
                
                VStack {
                    Text("30")
                        .foregroundColor(.secondary)
                        .padding(.bottom, 6)
                    
                    Text("6")
                        .foregroundColor(.secondary)
                }
            }
            .font(.footnote)
            .padding(.bottom, 7)
            
            HStack() {
                
                
                
                Spacer()
            }
            .font(.subheadline)
            .padding(.bottom, 15)
            
            Divider()
        }
        .foregroundColor(.themeGreen)
        .padding(.horizontal)
        .padding(.vertical, 5)
    }
}

struct OrderRowView_Previews: PreviewProvider {
    static var previews: some View {
        OrderRowView(order: dev2.mockOrder)
    }
}
