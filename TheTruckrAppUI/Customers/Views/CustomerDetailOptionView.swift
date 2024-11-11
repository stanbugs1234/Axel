//
//  CustomerDetailOptionView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 5/10/23.
//

import SwiftUI

struct CustomerDetailOptionView: View {
    let viewModel: ModelCustomerDetailView
    
    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: viewModel.imageName)
                .font(.title2)
                .imageScale(.medium)
            
            Text(viewModel.title)
                .font(.system(size: 16, weight: .semibold))
            
            Spacer()
        }
        .foregroundColor(.themeGreen)
    }
}

struct CustomerDetailOptionView_Previews: PreviewProvider {
    static var previews: some View {
        CustomerDetailOptionView(viewModel: ModelCustomerDetailView.jobs)
    }
}
