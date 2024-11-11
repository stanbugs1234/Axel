//
//  VendorDetailHeaderView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 2/20/24.
//

import SwiftUI

struct VendorDetailHeaderView: View {
    let vendor: Vendor
    
    var body: some View {
        let abbreviatedName = initials(from: vendor.vendorFullName)
        
        VStack {
            ZStack {
                Circle()
                    .frame(width: 65, height: 65, alignment: .leading)
                    .foregroundColor(.gray)
                Text(abbreviatedName!)
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
            }
            
            VStack {
                HStack(spacing: 5) {
                    Text(vendor.vendorFullName)
                        .font(.title)
                        .fontWeight(.semibold) 
                }
                .foregroundColor(.themeGreen)
                
                
                Text(vendor.vendorState.title)
                    .font(.footnote)
            }
        }
    }
}

struct VendorDetailHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        VendorDetailHeaderView(vendor: dev2.mockVendor)
    }
}
