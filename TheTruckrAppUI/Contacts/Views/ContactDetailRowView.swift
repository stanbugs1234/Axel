//
//  ContactDetailRowView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 6/28/23.
//

import SwiftUI

struct ContactDetailRowView: View {
    let viewModel: ContactDetailRowViewModel
    
    var body: some View {
            VStack {
                Image(systemName: viewModel.imageName)
                    .resizable()
                    .frame(width: 30, height: 30)
                    .padding(3)
                Text(viewModel.title)
                    .font(.subheadline)
                    .padding(.bottom, 4)
            }
            .frame(width: 70, height: 70)
            .foregroundColor(.themeGreen)
        }
        
}

struct ContactDetailRowView_Previews: PreviewProvider {
    static var previews: some View {
        ContactDetailRowView(viewModel: ContactDetailRowViewModel.call)
    }
}
