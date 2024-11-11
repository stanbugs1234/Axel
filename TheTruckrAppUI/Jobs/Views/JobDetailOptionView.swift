//
//  JobDetailOptionVieew.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 5/14/23.
//

import SwiftUI

struct JobDetailOptionView: View {
    let viewModel: JobDetailViewModel
    
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

struct JobDetailOptionView_Previews: PreviewProvider {
    static var previews: some View {
        JobDetailOptionView(viewModel: JobDetailViewModel.info)
    }
}
