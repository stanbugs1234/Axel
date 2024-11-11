//
//  CustomerDetailHeaderView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 11/4/23.
//

import SwiftUI

struct CustomerDetailHeaderView: View {
    let customer: Customer
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerSize: CGSize(width: 20, height: 10))
                .foregroundColor(.backgroundColor)
                .frame(width: .infinity, height: 125, alignment: .center)
                .shadow(radius: 7)
            VStack {
                HStack {
                    Text(customer.customerFullName)
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    Text(customer.customerState.title)
                        .font(.footnote)
                        .foregroundColor(.secondary)
                }
                .padding(.bottom,5)
                
                HStack {
                    Text(customer.customerAddress)
                        .foregroundColor(.secondary)
                    
                    Spacer()
                }
            }
            .foregroundColor(.themeGreen)
            .fontWeight(.semibold)
            .padding()
        }

    }
}


struct CustomerDetailHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            CustomerDetailHeaderView(customer: dev2.mockCustomer)
        }
    }
}
