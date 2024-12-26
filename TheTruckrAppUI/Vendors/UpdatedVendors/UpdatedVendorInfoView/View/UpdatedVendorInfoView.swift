//
//  UpdatedVendorInfoView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 12/21/24.
//

import SwiftUI

enum VendorInfoEnum: Int, CaseIterable, Hashable, Identifiable, Codable {
    case groupOrder
    case schedule
    case addFavorites
    case vendorInfo
    
    var title: String {
        switch self {
        case .groupOrder: return "Start group order"
        case .schedule: return "Schedule"
        case .addFavorites: return "Add to Favorites"
        case .vendorInfo: return "Store info"
        }
    }
    
    var imageName: String {
        switch self {
        case .groupOrder: return "mappin.and.ellipse"
        case .schedule: return "calendar.badge.plus"
        case .addFavorites: return "heart"
        case .vendorInfo: return "info.circle"
        }
    }
    
    var id: Int {
        return self.rawValue
    }
}


struct UpdatedVendorInfoView: View {
    let vendor: Vendor
    
    var body: some View {
        VStack(alignment: .leading) {
            //MARK: Map View
            Rectangle()
                .frame(width: SizeConstants.cardWidth + 20, height: 250)
            
            //MARK: Vendor Name
            VStack(alignment: .leading) {
                Text(vendor.vendorFullName)
                    .font(.title2)
                    .fontWeight(.semibold)
            }
            .padding()

            
            Divider()
            
            //MARK: Vendor Info List View
            VStack {
                HStack {
                    //MARK: Map View Showing Estimated Time
                    Image(systemName: "mappin.and.ellipse")
                        .resizable()
                        .frame(width: 25,
                               height: 25)
                    
                    //MARK: Vendor Address
                    Text(vendor.vendorAddressName)
                        .multilineTextAlignment(.leading)
                        .padding(.leading)
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "square.on.square")
                            .resizable()
                            .frame(width: 20,
                                   height: 20)
                    }
                    
                    
                }
                .padding(.top)
                
                
                Divider()
                
                //MARK: Open Till
                HStack {
                    Image(systemName: "clock")
                        .resizable()
                        .frame(width: 25,
                               height: 25)
                    
                    Text("Open until 3:00 AM")
                        .padding(.leading)
                    
                    Spacer()
                    
                    Image(systemName: "plus")
                        .resizable()
                        .frame(width: 15,
                               height: 15)
                }
                .padding(.vertical, 25)
                
                Divider()
                
                //MARK: Rating Row
                HStack {
                    Image(systemName: "star")
                        .resizable()
                        .frame(width: 25,
                               height: 25)
                    
                    Text("4.4 (9000+ratings)")
                        .padding(.leading)
                    
                    Spacer()
                }
                
                Spacer()
            }
            .font(.headline)
            .padding(.horizontal, 25)
        }
        .foregroundStyle(.opposite)
        .padding(.horizontal, 5)
        
    }
}

#Preview {
    NavigationStack {
        UpdatedVendorInfoView(vendor: MockData.vendors[0])
            .preferredColorScheme(.dark)
    }
}
