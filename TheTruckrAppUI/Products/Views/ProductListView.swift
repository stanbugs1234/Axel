//
//  ProductListView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 5/17/23.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

struct ProductListView: View {
    
    @FirestoreQuery(collectionPath: "products") var products: [Product]
    
    var body: some View {
            VStack {
                VStack{
                    List{
                        ForEach(products) { product in
                            NavigationLink(value: product) {
                                
                                VStack(spacing: 10) {
                                    Text(product.productFullName)

                                    Text(product.companyName)
                                }
                            }
                        }
                    }
                    .navigationTitle("Products")
                    .navigationBarTitleDisplayMode(.inline)
                }
                
                //Add New Customer Button
                VStack(alignment: .center) {
                    NavigationLink {
                        CreateNewProductView()
                    } label: {
                        CreateNewButton(buttonText: "Create New Product")
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .keyboard) {
                    DismissKeyboardButton()
                }
            }
    }
}

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ProductListView()
        }

    }
}
