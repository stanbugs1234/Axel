//
//  SavedLocationRowView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 4/14/23.
//

import SwiftUI

struct SavedLocationRowView: View {
    let viewModel: SavedLocatationViewModel
    let user: User
    
    var body: some View {
        HStack(spacing: 12){
            Image(systemName: viewModel.imageName)
            .imageScale(.medium)
            .font(.title)
            .foregroundColor((Color(.systemBlue)))
            //.foregroundColor(Color.theme.primaryTextColor)
        
        VStack(alignment: .leading, spacing: 4) {
            Text(viewModel.title)
                .font(.system(size: 15, weight: .semibold))
            
            Text(viewModel.subtitle(forUser: user))
                .font(.system(size: 14))
                .foregroundColor(.gray)
            }
        }
    }
}

struct SavedLocationRowView_Previews: PreviewProvider {
    static var previews: some View {
        SavedLocationRowView(viewModel: .home, user: dev.mockUser)
    }
}
