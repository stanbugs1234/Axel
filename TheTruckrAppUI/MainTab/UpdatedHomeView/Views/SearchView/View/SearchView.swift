//
//  SearchView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 12/22/24.
//

import SwiftUI

struct SearchView: View {
    @EnvironmentObject var updatedHomeViewModel: UpdatedHomeViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            //MARK: Search Header View
            SearchHeaderView()
            
            //MARK: Recent
            if updatedHomeViewModel.searchText.isEmpty {
                RecentSearchView()
            } else{
                
            }
            
            //MARK: Top Categories
            ScrollView(showsIndicators: false){
                VStack(alignment: .leading) {
                    if updatedHomeViewModel.searchText.isEmpty {
                        Text("Top Categories")
                            .font(.headline)
                            .foregroundStyle(.secondary)
                            .padding(.vertical)
                    } else {
                        Text("Top \(updatedHomeViewModel.searchText) Companies")
                            .font(.headline)
                            .foregroundStyle(.secondary)
                            .padding(.vertical)
                    }
                    
                    if updatedHomeViewModel.searchText.isEmpty {
                        ForEach(UpdatedHomeRowCategoryViewModel.allCases) { viewModel in
                            Button {
                                updatedHomeViewModel.searchText = viewModel.title
                            } label: {
                                SearchCategoriesRowView(viewModel: viewModel)
                            }
                        }
                    } else {
                        //MARK: Filter Category View
                        ScrollView(showsIndicators: false) {
                            ZStack {
                                FilterCategoryView()
                            }
                        }
                    }
                }
            }
        }
        .padding()
        .navigationTitle("Search")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem {
                NavigationLink {
                    EmptyShoppingCartView()
                } label: {
                    Image(systemName: "cart")
                        .resizable()
                        .frame(width: ButtonSize.small.iconSize, height: ButtonSize.small.iconSize)
                        .padding(.trailing, 10)
                        .fontWeight(.bold)
                        .foregroundStyle(.opposite)
                }
                
            }
        }
    }
}

#Preview {
    NavigationStack {
        SearchView()
            .preferredColorScheme(.dark)
            .environmentObject(UpdatedHomeViewModel())
    }
}
