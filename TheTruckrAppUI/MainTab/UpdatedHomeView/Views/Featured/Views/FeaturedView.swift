//
//  FeaturedView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 12/14/24.
//

import SwiftUI

struct FeaturedView: View {
    @EnvironmentObject var updatedHomeViewModel: UpdatedHomeViewModel
    @StateObject var viewModel = FeaturedViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Featured on \(AppConstants.appName)")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.horizontal)
                Spacer()
                
                //MARK: Navigation Menu
                NavigationLink {
                    FeaturedNavView(viewModel: viewModel)
                } label: {
                    Image(systemName: "arrowshape.forward.circle.fill")
                        .resizable()
                        .frame(width: ButtonSize.small.iconSize,
                               height: ButtonSize.small.iconSize)
                        .foregroundStyle(Color.primary)
                }
                .padding(.trailing)
            }
            .padding(.bottom)
            
            //MARK: Horizontal Scroll View
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(viewModel.vendors) { vendor in
                        NavigationLink {
                            UpdatedVendorDetailView(vendor: vendor)
                        } label: {
                            FeaturedCardView(vendor: vendor)
                        }
                    }
                }
            }
            .padding(.top)
        }
    }
}

#Preview {
    NavigationStack {
        FeaturedView()
            .preferredColorScheme(.dark)
            .environmentObject(UpdatedHomeViewModel())
    }
}
