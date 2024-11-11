//
//  InvoiceListRowView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 2/19/24.
//

import SwiftUI

struct InvoiceListRowView: View {
    let invoice: Invoice
    
    var body: some View {
        VStack {
            HStack {
                Text(invoice.customerFullName)
                    .font(.title3)
                    .fontWeight(.bold)
                
                Spacer()
                
                Text(invoice.timestamp.dateValue().dateDisplayFormat)
                

            }
            .padding(.bottom, 5)
            
            HStack {
                Text("Inv. Number: ")
                Text(invoice.invoiceNumber)
                
                Spacer()
                
                
                Text("Status: ")
                
                Text(invoice.invoiceStatus.title)
                
            }
            .padding(.bottom, 8)
            
            HStack {
                Spacer()
                
                Text(invoice.totalAmount.toCurrency())
                    .font(.title3)
                    .fontWeight(.bold)
            }
            
            Divider()
        }
    }
}

struct InvoiceListRowView_Previews: PreviewProvider {
    static var previews: some View {
        InvoiceListRowView(invoice: dev2.mockInvoice)
    }
}
