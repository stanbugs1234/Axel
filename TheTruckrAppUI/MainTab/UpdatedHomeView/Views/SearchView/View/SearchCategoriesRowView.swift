//
//  SearchCategoriesRowView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 12/22/24.
//

import SwiftUI

struct SearchCategoriesRowView: View {
    let viewModel: UpdatedHomeRowCategoryViewModel
    
    var body: some View {
        HStack {
            Image(viewModel.imageName)
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(Circle())

            
            VStack(alignment: .leading) {
                Text(viewModel.title)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.opposite)
                    .padding(.top, 8)
                
                Divider()
            }
            .padding()
        }
    }
}

#Preview {
    SearchCategoriesRowView(viewModel: UpdatedHomeRowCategoryViewModel.clay)
}
