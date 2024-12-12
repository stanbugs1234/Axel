//
//  DeliveryOptionRowView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 12/18/24.
//

import SwiftUI

struct DeliveryOptionRowView: View {
    let viewModel: DeliveryOptionMenuEnum
    
    var body: some View {
        HStack {
            Image(systemName: viewModel.imageName)
                .resizable()
                .frame(width: ButtonSize.medium.iconSize,
                       height: ButtonSize.medium.iconSize)
                .padding(.trailing, 8)
                .fontWeight(.semibold)

            Text(viewModel.title)
                .font(.headline)
                .fontWeight(.semibold)
            
            Spacer()
        }
        .foregroundStyle(Color.opposite)
        .padding()
    }
}

#Preview {
    DeliveryOptionRowView(viewModel: DeliveryOptionMenuEnum.delivery)
}
