//
//  ServicesCardRowView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 12/19/24.
//

import SwiftUI

struct ServicesCardRowView: View {
    let viewModel: ServicesEnum
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Spacer()
                
                Image(viewModel.imageName)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .font(.system(size: 16))
            }
            Text(viewModel.title)
                .font(.subheadline)
                .foregroundColor(.backgroundColor)
        }
        .padding()

        .background(Color(.systemGray6))
        .frame(width: SizeConstants.cardHalfWidth, height: SizeConstants.cardTileHeight)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        
    }
}

#Preview {
    ServicesCardRowView(viewModel: ServicesEnum.orderNow)
}
