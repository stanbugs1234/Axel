//
//  InvoiceListView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 10/8/23.
//

import SwiftUI

struct InvoiceListView: View {
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Text("Total Amount")
                        .fontWeight(.semibold)
                    
                    Text("1068.44")
                        .fontWeight(.bold)
                }
            }
//            
//            ForEach(invoice) { invoice in
//                InvoiceListRowView(invoice: invoice)
//            }
        }
    }
}

struct InvoiceListView_Previews: PreviewProvider {
    static var previews: some View {
        InvoiceListView()
    }
}
