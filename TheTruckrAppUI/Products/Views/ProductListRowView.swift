//
//  ProductListRowView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 3/15/24.
//

import SwiftUI

struct ProductListRowView: View {
    let product: Product
    
    var body: some View {
        VStack {
            HStack {
                Text(product.productFullName)
                
                Spacer()
                
                ButtonImageFactored(size: .xSmall, image: .stone, text: "")
                
                Text(product.productCategory)
                    .font(.caption)
            }
            HStack {
                Text(product.companyName)
                    .font(.subheadline)
                
                Spacer()
                

            }
            .padding(.vertical)
        }
    }
}

struct ProductListRowView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListRowView(product: dev2.mockProduct)
    }
}
