//
//  AccountOptionView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 11/19/23.
//

import SwiftUI

struct AccountOptionView: View {
    let viewModel: AccountOptionsViewModel
    
    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: viewModel.imageName)
                .font(.title2)
                .imageScale(.medium)
                .foregroundColor(viewModel.tintColor)
            
            Text(viewModel.title)
                .font(.system(size: 16, weight: .semibold))
            
            Spacer()
        }
        .padding(.vertical)
        
    }
}

#Preview {
    AccountOptionView(viewModel: AccountOptionsViewModel.helpAndSupport)
}
