//
//  FilterCategoryView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 12/24/24.
//

import SwiftUI

struct FilterCategoryView: View {
    @EnvironmentObject var updatedHomeViewModel: UpdatedHomeViewModel
    @StateObject var viewModel = FeaturedViewModel()
    @State private var selectedFilter: SearchCategoriesEnum = .clay

    
    var body: some View {
    //MARK: Category Filter View
        VStack {
                LazyVStack {
                    ForEach(viewModel.vendors) { vendor in
                        NavigationLink {
                            UpdatedVendorDetailView(vendor: vendor)
                        } label: {
                            FilterCategoryRowView(vendor: vendor )
                        }
                    }
                }
        }
        .frame(width: SizeConstants.cardWidth)
        
        //MARK: Message View
//        var messageView: some View {
//            ScrollView {
//                LazyVStack {
//                    ForEach(viewModel.posts(forFilter: self.selectedFilter)) { post in
//                        PostRowView(post: post, user: post.user!)
//                            .padding()
//                    }
//                }
//            }
//        }
    }
}

#Preview {
    NavigationStack {
        FilterCategoryView(viewModel: FeaturedViewModel())
            .preferredColorScheme(.dark)
            .environmentObject(UpdatedHomeViewModel())
    }
}
