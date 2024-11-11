//
//  EditProfileOptionRowView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 6/15/23.
//

import SwiftUI

struct EditProfileOptionRowView: View {
    let viewModel: EditProfileViewModel
    
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
        .foregroundColor(.black)
    }
}

struct EditProfileOptionRowView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileOptionRowView(viewModel: EditProfileViewModel.company)
    }
}
