//
//  ProductDetailView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 5/20/23.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift


struct ProductDetailView: View {
    
    @FirestoreQuery(collectionPath: "products") var products: [Product]
    
    let product: Product
    
    var body: some View {
        NavigationView {
            List {
                
                ForEach(products) { product in
                    Text(product.productFullName)
                }
            }
            .navigationTitle("Product Detail")
        }
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ProductDetailView(product: dev.mockProduct)
        }
    }
}
