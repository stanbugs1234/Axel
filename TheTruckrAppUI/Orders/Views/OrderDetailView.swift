//
//  OrderDetailView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 6/27/23.
//

import SwiftUI

struct OrderDetailView: View {
    @State private var showDriversView = false
    @State private var selectedDriver: User?
    
    let order : Order
    
    var body: some View {
        VStack {
            //MARK: Header
            HStack {
                ButtonImageFactored(size: .xSmall, image: .customers, text: "")
                    .padding(.bottom, 6)
                
                Text(order.customerName)
                    .font(.headline)
                    .padding(.bottom, 6)
                    .padding(.horizontal)
                
                Spacer()
                
                //MARK: Date & Time
                VStack(alignment: .trailing) {
                    Text(order.orderDate.dateDisplayFormat)
                        .font(.footnote)
                    
                    Text(order.orderDate.timeOnlyDisplayFormat)
                        .font(.caption)
                }
                .foregroundColor(.secondary)
            }
            .padding(.vertical)
            
            //MARK: Trucks - Images & Texts Section
            Section {
                OrderDetailsImageRowView(order: order)
                    .padding(.bottom, 10)
               
                Divider()
            }
            
            //MARK: Driver List
            VStack {
                Text("Drivers")
                
                Spacer()
                Button {
                    showDriversView.toggle()
                } label: {
                    ButtonView(size: .medium, buttonString: "Add Drivers")
                }
                .fullScreenCover(isPresented: $showDriversView) {
                    AddDriverListView(selectedDriver: $selectedDriver, order: order)
                }
            }
            
            Spacer()
            
            //MARK: Ticket List
            Divider()
            
            VStack {
                Text("Tickets")
                

            }
            
           Spacer()
        }
        .padding()
        .foregroundColor(.themeGreen)
        .navigationTitle("Order Details")
    }
}

struct OrderDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            OrderDetailView(order: dev2.mockOrder)
        }
    }
}
