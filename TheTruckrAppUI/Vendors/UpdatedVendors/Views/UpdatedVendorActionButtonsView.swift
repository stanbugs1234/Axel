//
//  UpdatedVendorActionButtonsView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 12/20/24.
//

import SwiftUI

struct UpdatedVendorActionButtonsView: View {
    @EnvironmentObject var viewModel: UpdatedHomeViewModel
    
    var body: some View {
        HStack {
            Picker("Delivery Options", selection: $viewModel.deliveryOption)
            {
                ForEach(DeliveryOptionMenuEnum.allCases, id: \.self) { option in
                    Text(option.title)
                 }
            }
            .clipShape(RoundedRectangle(cornerRadius: 30))
            .padding(.trailing, 40)
            .pickerStyle(.segmented)
            
            //TODO: Design Group Order
            NavigationLink {
                Text("Group Order")
            } label: {
                ZStack {
                    HStack {
                        Image(systemName: "person.fill.badge.plus")
                            .resizable()
                            .frame(width: 20, height: 20)
                            
                        Text("Group Order")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                    }
                }
            }
            .buttonStyle(BorderedButtonStyle())
            .buttonBorderShape(.roundedRectangle(radius: 30))
//            .padding(.horizontal, 25)
        }
        .foregroundStyle(.opposite)
    }
}

#Preview {
    NavigationStack {
        UpdatedVendorActionButtonsView()
            .preferredColorScheme(.dark)
            .environmentObject(UpdatedHomeViewModel())
    }
}
