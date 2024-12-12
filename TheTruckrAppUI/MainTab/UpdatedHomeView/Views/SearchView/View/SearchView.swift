//
//  SearchView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 12/22/24.
//

import SwiftUI

struct SearchView: View {
    @EnvironmentObject var updatedHomeViewModel: UpdatedHomeViewModel
    @State private var searchText = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            //MARK: Search Bar
            SearchBarView(text: $searchText, placementString: "Search \(AppConstants.appName)")
                
            //MARK: Recent
            ScrollView(showsIndicators: false){
                VStack {
                    HStack {
                        Text("Recent")
                            .font(.headline)
                            .foregroundStyle(.secondary)
                        Spacer()
                    }
                    
                    HStack {
                        Image(systemName: "clock")
                        
                        VStack(alignment: .leading) {
                            Text("Stone")
                                .fontWeight(.semibold)
                            
                            Divider()
                        }
                        .padding(.horizontal)
                        
                        Spacer()
                    }
                    .padding(.vertical)
                }
                
                
            //MARK: Top Categories
                VStack(alignment: .leading) {
                    Text("Top Categories")
                        .font(.headline)
                        .foregroundStyle(.secondary)
                        .padding(.vertical)
                    
                    ForEach(UpdatedHomeRowCategoryViewModel.allCases) { viewModel in
                        NavigationLink {
                            Text("\(viewModel.title)")
                        } label: {
                            SearchCategoriesRowView(viewModel: viewModel)
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
}
    
    #Preview {
        NavigationStack {
            SearchView()
                .preferredColorScheme(.dark)
                .environmentObject(UpdatedHomeViewModel())
        }
    }
