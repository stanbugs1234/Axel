//
//  CreateNewProductView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 5/18/23.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift
import FirebaseStorage

struct CreateNewProductView: View {
    @State private var productFullName = ""
    @State private var companyName = ""
    @State private var productCategory = ""

    var body: some View {
        VStack {
            
            Spacer()
            
            Text("Enter Product Information Below")
                .font(.headline)
            Form {
                TextField("Enter Product Name",
                          text: $productFullName)
                
                TextField("Enter Vendor Name",
                          text: $companyName)
                
                TextField("Enter Product Category",
                          text: $productCategory)
            }
            
            Spacer()
            
            Button {
                Task {
                    createNewProduct()
                }
            } label: {
                ButtonView(size: .medium, buttonString: "Save")
            }
            
        }
        .toolbar {
            ToolbarItem(placement: .keyboard) {
                DismissKeyboardButton()
            }
        }
    }
}

struct CreateNewProductView_Previews: PreviewProvider {
    static var previews: some View {
        CreateNewProductView()
    }
}

extension CreateNewProductView {
    func createNewProduct() {
        let product = Product(
            productId: UUID().uuidString,
        productFullName: productFullName,
        companyName: companyName,
        productCategory: productCategory
        )
        
        guard let encodedProduct = try? Firestore.Encoder().encode(product) else {
            return }
        Firestore.firestore().collection("products").document().setData(encodedProduct) { _ in
            print("DEBUG: Did upload product to firestore")
        }
    }
}
