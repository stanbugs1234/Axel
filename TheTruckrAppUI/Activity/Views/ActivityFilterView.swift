//
//  ActivityFilterView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 12/14/24.
//

import SwiftUI

struct ActivityFilterView: View {
    @EnvironmentObject var updatedHomeViewModel: UpdatedHomeViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            //MARK: Filter By
            HStack {
                Spacer()
                
                Text("Filter by...")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Spacer()
            }
            .padding()
            
            Divider()
            
            //MARK: Profile Section
            VStack(alignment: .leading) {
                Text("Profile")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.vertical)
                
                    Picker("Filter options",
                           selection: $updatedHomeViewModel.filterType)
                    {
                        ForEach(ActivityFilterViewModel.allCases, id: \.self) { viewModel in
                                ActivityFilterRowView(viewModel: viewModel)
                        }
                    }
                    .pickerStyle(.segmented)
                    .padding(.horizontal)
                .padding(.bottom)
            }
        }
        .padding(.horizontal)
        .padding(.bottom, 30)
        
        //MARK: Apply Button
        Button {
            
        } label: {
            ZStack {
                Text("Apply")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .frame(width: SizeConstants.cardWidth - 30, height: SizeConstants.cardTileHeight/1.75, alignment: .center)
                    .foregroundStyle(Color.primary)
            }
            
        }

        .tint(Color(.systemGray5))
        .buttonStyle(BorderedProminentButtonStyle())
    }
}


#Preview {
    NavigationStack {
        ActivityFilterView()
            .preferredColorScheme(.dark)
            .environmentObject(UpdatedHomeViewModel())
    }
}
