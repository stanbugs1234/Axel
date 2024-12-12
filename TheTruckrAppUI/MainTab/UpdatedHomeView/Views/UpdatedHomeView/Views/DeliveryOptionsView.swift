//
//  DeliveryOptionsView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 12/18/24.
//

import SwiftUI

struct DeliveryOptionsView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: UpdatedHomeViewModel
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("Delivery Options")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(Color.primary)
                Spacer()
            }
            
            Divider()
            
            Picker("Delivery Options", selection: $viewModel.deliveryOption)
            {
                ForEach(DeliveryOptionMenuEnum.allCases, id: \.self) { option in
                    DeliveryOptionRowView(viewModel: option)
                }
            }
            .pickerStyle(.wheel)
            
            
            //MARK: Confirm Button
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                ZStack {
                    Text("Confirm \(viewModel.deliveryOption)")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .frame(width: SizeConstants.cardWidth - 30, height: SizeConstants.cardTileHeight/2, alignment: .center)
                        .foregroundStyle(Color.primary)
                }
                
            }
            
            .tint(Color.gray)
            .buttonStyle(BorderedProminentButtonStyle())
        }
        .padding()
    }
}

#Preview {
    DeliveryOptionsView()
        .environmentObject(UpdatedHomeViewModel())
}
