//
//  ActivityFilterRowView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 12/15/24.
//

import SwiftUI

struct ActivityFilterRowView: View {
    let viewModel: ActivityFilterViewModel
    
    var body: some View {
            Group {
                Image(systemName: viewModel.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 18, height: 18)
                
                Text(viewModel.title)
                    .fontWeight(.semibold)
            
        }
    }
}

#Preview {
    ActivityFilterRowView(viewModel: ActivityFilterViewModel.personal)
}
