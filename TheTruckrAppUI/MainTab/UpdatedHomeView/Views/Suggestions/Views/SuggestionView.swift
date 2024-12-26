//
//  SuggestionView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 12/15/24.
//

import SwiftUI

struct SuggestionView: View {
    @EnvironmentObject var updatedViewModel: UpdatedHomeViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Plan your next trip")
                    .font(.title2)
                    .fontWeight(.semibold)
                Spacer()
            }
            .padding(.horizontal)
            
            //MARK: Horizontal Scroll View
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(SuggestionViewEnums.allCases) { viewModel in
                        NavigationLink {
                            Text("\(viewModel.title)")
                        } label: {
                            SuggestionCardView(viewModel: viewModel)
                                .padding(.horizontal)
                        }
                    }
                }
            }
            .frame(height: SizeConstants.cardThirdHeight)
            .padding(.top)
        }
        .foregroundStyle(.opposite)
    }
}

#Preview {
    NavigationStack {
        SuggestionView()
            .preferredColorScheme(.dark)
            .environmentObject(UpdatedHomeViewModel())
    }
}
