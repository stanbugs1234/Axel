//
//  CustomerRowView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 6/5/23.
//

import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

struct CustomerRowView: View {
    let customer: Customer
    
    var body: some View {
        HStack(spacing: 12) {
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(customer.customerFullName)
                        .font(.headline).bold()
                        .foregroundColor(.themeGreen)
                    
                    Spacer()
                    
                    Text(customer.customerState.title)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                HStack {
                    Text(customer.customerAddress)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
            .padding(.leading)
            
            Spacer()
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
        .foregroundColor(.themeGreen)
        .background(Color.backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
        .shadow(color: .primary.opacity(0.3), radius: 10, x: 0, y: 5)
    }
}

struct CustomerRowView_Previews: PreviewProvider {
    static var previews: some View {
        CustomerRowView(customer: dev2.mockCustomer)
    }
}
