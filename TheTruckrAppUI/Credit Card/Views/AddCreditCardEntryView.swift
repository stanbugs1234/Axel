//
//  AddCreditCardEntryView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 12/3/24.
//

import SwiftUI

struct AddCreditCardEntryView: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var cardPayment: CardPayment = CardPayment()
    let processPayment: () -> Void = {}
    
    var body: some View {
        VStack {
            VStack(spacing: 20) {
                TextField("Card Holder Name", text: $cardPayment.holderName)
                    .addColorBorderStyle()
                
                TextField("Card Number", text: $cardPayment.number)
                    .addColorBorderStyle()
                
                HStack(spacing: 10) {
                    HStack {
                        Spacer()
                        TextField("08", text: $cardPayment.expMonth)
                        Text("/")
                            .font(.title3)
                            .foregroundColor(colorScheme == .light ? .blue : .white)
                        TextField("23", text: $cardPayment.expYear)
                        Spacer()
                    }
                    .addColorBorderStyle()
                    
                    TextField("CVC", text: $cardPayment.cvc)
                        .addColorBorderStyle()
                    
                    TextField("Zip Code", text: $cardPayment.zipCode)
                        .addColorBorderStyle()
                }
            }
            
            Spacer()
            
            Button {
                processPayment()
            } label: {
                Text("Complete Purchase")
                    .foregroundColor(colorScheme == .light ? .white : .black)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(colorScheme == .light ? Color.blue : Color.white)
                    )
            }
        }
        .padding()
    }
}


#Preview {
    AddCreditCardEntryView()
        .preferredColorScheme(.dark)
}
