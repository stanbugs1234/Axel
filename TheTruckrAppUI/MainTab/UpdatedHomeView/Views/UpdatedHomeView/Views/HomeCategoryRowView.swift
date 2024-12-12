//
//  HomeCategoryRowView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 12/14/24.
//

import SwiftUI

struct HomeCategoryRowView: View {
    @EnvironmentObject var updatedHomeViewModel: UpdatedHomeViewModel
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing: 32) {
                ForEach(UpdatedHomeRowCategoryViewModel.allCases) { viewModel in
                    NavigationLink {
                        Text("\(viewModel.title)")
                    } label: {
                        CategoryRowIconTitleView(viewModel: viewModel)
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        HomeCategoryRowView()
            .environmentObject(UpdatedHomeViewModel())
    }
}
