//
//  InvoiceView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 2/19/24.
//

import SwiftUI

struct InvoiceView: View {
    let invoice: Invoice
    
    var body: some View {
        VStack {
            HStack {
                ButtonImageFactored(size: .medium, image: .truck, text: "")
                
                Spacer()
                
                VStack {
                    Text("Otwell Services")
                        .fontWeight(.bold)
                    
                    Text("123 Main Street")
                    
                    Text("Harvey, LA 70001")
                    
                    Text("985-504-9876")
                }
            }
            .padding(.bottom, 20)
            
            HStack {
                Text("Billd to")
                
                Spacer()
                
                Text("Date Issued")
                    .padding(.trailing)
                
                Text("Invoice #")
            }
            .fontWeight(.bold)
            .padding(.top, 5)
            
            HStack {
                VStack(alignment: .leading) {
                    Text("RNGD")
                    
                    Text("713 Tchoup")
                    
                    Text("New Orleans, LA")
                    
                    Text("70001")
                }
                .padding(.top, 1)
                
                Spacer()
                
                VStack {
                    Text("2/23/23")
                       
                }
                .padding(.bottom, 60)
                .padding(.trailing, 30)
                
                VStack {
                    Text(invoice.invoiceNumber)
                }
                .padding(.bottom, 60)
            }
            
            Divider()
            
            HStack {
                Text("Task")
                    .padding(.horizontal)
                
                Text("Rate")
                    .padding(.horizontal)
                
                Text("Qty")
                    .padding(.horizontal)
                
                Text("Amount")
                    .padding(.horizontal)
                    
            }
            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)

            
            Divider()
        }
        .padding()
    }
}


struct InvoiceView_Previews: PreviewProvider {
    static var previews: some View {
        InvoiceView(invoice: dev2.mockInvoice)
    }
}
