//
//  FeaturedRowView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 12/18/24.
//

import SwiftUI
import Kingfisher

struct FeaturedRowView: View {
    @EnvironmentObject var viewModel: UpdatedHomeViewModel
    let vendor: Vendor
    
    var body: some View {
        HStack(alignment: .top) {
            //MARK: Vendor Image
            VStack {
                if vendor.vendorProfileImageUrl != nil {
                    KFImage(URL(string:vendor.vendorProfileImageUrl ?? ""))
                        .resizable()
                        .frame(width: 80, height: 80)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .shadow(radius: 10)
                }
                
            }
            
            //MARK: Vendor Name
            VStack(alignment: .leading) {
                Text(vendor.vendorFullName)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                Text("$0 Delivery Fee")
                    .font(.footnote)
                    .padding(.top)
            }
            
            Spacer()
            
            //MARK: Miles Away
            //TODO: Add View Model to show miles from pickup location
            VStack(alignment: .trailing) {
                Text("4.4")
            }
        }
        .foregroundStyle(.opposite)
        .padding(.horizontal, 3)
    }
}

#Preview {
    NavigationStack {
        FeaturedRowView(vendor: MockData.vendors[0])
            .preferredColorScheme(.dark)
            .environmentObject(UpdatedHomeViewModel())
    }
}
