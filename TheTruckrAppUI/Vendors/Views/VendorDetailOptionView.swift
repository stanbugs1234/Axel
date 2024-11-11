//
//  VendorDetailOptionView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 5/11/23.
//

import SwiftUI

struct VendorDetailOptionView: View {
    
    let viewModel: VendorDetailViewModel
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: viewModel.imageName)
                .font(.title2)
                .imageScale(.medium)
            
            Text(viewModel.title)
                .font(.system(size: 16, weight: .semibold))
            
            Spacer()
        }
        //.foregroundColor(Color.theme.primaryTextColor)
        .foregroundColor(.themeGreen)
    }
}

struct VendorDetailOptionView_Previews: PreviewProvider {
    static var previews: some View {
        VendorDetailOptionView(viewModel: VendorDetailViewModel.info)
    }
}
