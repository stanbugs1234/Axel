//
//  SuggestionCardView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 12/16/24.
//

import SwiftUI

struct SuggestionCardView: View {
    @EnvironmentObject private var updatedHomeViewModel: UpdatedHomeViewModel
    let viewModel: SuggestionViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(viewModel.imageName)
                .resizable()
                .frame(width: 250, height: 150)
                .scaledToFill()
                .clipShape(RoundedRectangle(cornerRadius: 20))
            
            HStack {
                Text(viewModel.title)
                    .font(.headline)
                    .fontWeight(.semibold)
                
                Image(systemName: "arrow.right.fill")
                    .resizable()
                    .frame(width: ButtonSize.xSmall.iconSize,
                           height: ButtonSize.xSmall.iconSize)
                    .padding(.leading, -5)
            }
            
//            HStack {
//                Text("4.1")
//                
//                Image(systemName: "star.fill")
//                    .resizable()
//                    .frame(width: ButtonSize.xSmall.iconSize,
//                           height: ButtonSize.xSmall.iconSize)
//                    .padding(.leading, -5)
//                    .fontWeight(.semibold)
//                    
//            }
//            .padding(.top, -5)
        }
    }
}

#Preview {
    SuggestionCardView(viewModel: SuggestionViewModel.truck)
        .environmentObject(UpdatedHomeViewModel())
}
