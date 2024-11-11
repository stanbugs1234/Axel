//
//  UserDetailOptionView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 5/17/23.
//

import SwiftUI

struct UserDetailOptionView: View {
    let viewModel: UserDetailViewModel
    
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

struct UserDetailOptionView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailOptionView(viewModel: UserDetailViewModel.scheduleTrip)
    }
}
