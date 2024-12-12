//
//  HorizontalCategoryIconTitleView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 12/13/24.
//

import SwiftUI

struct CategoryRowIconTitleView: View {
    let viewModel: UpdatedHomeRowCategoryViewModel
    
    var body: some View {
            VStack {
                Image(viewModel.imageName)
                    .resizable()
                    .frame(width: ButtonSize.xLarge.iconSize, height: ButtonSize.xLarge.iconSize)
                    .clipShape(Circle())
                    .padding(.bottom, -8)
                
                Text(viewModel.title)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.secondary)
                    .padding(.top, 8)
            }
    }
}

#Preview {
    CategoryRowIconTitleView(viewModel: UpdatedHomeRowCategoryViewModel.triaxle)
}
