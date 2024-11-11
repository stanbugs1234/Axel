//
//  MessageSideMenuOptionRowView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 5/24/23.
//

import SwiftUI

struct MessageSideMenuOptionRowView: View {
    var viewModel: MessageSideMenuViewModel
    
    var body: some View {
        HStack(spacing: 5) {
            Image(systemName: viewModel.imageName)
                .font(.headline)
                .foregroundColor(.gray)
            
            Text(viewModel.title)
                .foregroundColor(.black)
                .font(.subheadline)
        }
        .padding(10)
    }
}

struct MessageSideMenuOptionRowView_Previews: PreviewProvider {
    static var previews: some View {
        MessageSideMenuOptionRowView(viewModel: MessageSideMenuViewModel.profile)
    }
}
