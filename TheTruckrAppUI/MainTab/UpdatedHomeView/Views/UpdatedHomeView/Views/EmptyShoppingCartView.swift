//
//  EmptyShoppingCartView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 12/18/24.
//

import SwiftUI

struct EmptyShoppingCartView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            //MARK: Shopping Cart Image
            Image(systemName: "cart")
                .resizable()
                .frame(width: 100, height: 100)
            
            
            //MARK: Add Items to Cart
            Text("Add items to start a cart")
                .font(.headline)
                .fontWeight(.bold)
                .padding(.bottom, 20)
            
            //MARK: Add Message
            Text("Once you add items from a vendor or request a delivery, your cart will appear")
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
                .padding(.bottom, 55)
            
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Start shopping")
                    .foregroundStyle(.opposite)
            }
            
            .buttonStyle(BorderedProminentButtonStyle())
            .tint(.secondary)
            .clipShape(RoundedRectangle(cornerRadius: 20))
        }
    }
}

#Preview {
    EmptyShoppingCartView()
        .preferredColorScheme(.dark)
}
