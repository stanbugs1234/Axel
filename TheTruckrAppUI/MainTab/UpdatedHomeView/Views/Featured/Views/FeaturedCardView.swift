//
//  FeaturedCardView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 12/14/24.
//

import SwiftUI
import Kingfisher

struct FeaturedCardView: View {
    @EnvironmentObject var updatedHomeViewModel: UpdatedHomeViewModel
    let vendor: Vendor
    
    var body: some View {
        let abbreviatedName = initials(from: vendor.vendorFullName) ?? ""
        
        //MARK: Image
        VStack(alignment: .leading) {
            HStack {
                if vendor.vendorProfileImageUrl != "" {
                    KFImage(URL(string: vendor.vendorProfileImageUrl ?? ""))
                        .resizable()
                        .frame(width: 250, height: 150)
                        .scaledToFill()
                        
                } else {
                    ZStack {
                        RoundedRectangle(cornerRadius: 30)
                            .frame(width: 250, height: 150)
                            .foregroundColor(.gray)
                        
                        Text(vendor.vendorFullName)
//                        Text(abbreviatedName)
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                    }
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .frame(width: 250)
            
            //MARK: Vendor Name
            VStack(alignment: .leading) {
                HStack {
                    Text(vendor.vendorFullName)
                        .font(.headline)
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    //MARK: Like Button
                    //TODO: Add ViewModel & Add Like Functionality
                    Button {
                        
                    } label: {
                        Image(systemName: "heart")
                            .resizable()
                            .frame(width: ButtonSize.xSmall.iconSize,
                                   height: ButtonSize.xSmall.iconSize)
                            .padding(.leading, -5)
                    }
                }
                
                //MARK: Rating
                //TODO: Add Rating to Vendors
                HStack {
                    Text("4.4")
                        .font(.subheadline)
                    
                    Image(systemName: "star.fill")
                        .resizable()
                        .frame(width: ButtonSize.xSmall.iconSize,
                               height: ButtonSize.xSmall.iconSize)
                        .padding(.leading, -5)
                        .fontWeight(.semibold)
                }
            }
            .padding(.leading, 5)
            .foregroundStyle(.opposite)
        }
        .frame(width: 250)
        .padding(.horizontal)
        
    }
}
 
#Preview {
    FeaturedCardView( vendor: MockData.vendors[0])
        .environmentObject(UpdatedHomeViewModel())
}
