//
//  VendorInfoView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 6/15/23.
//

import SwiftUI

struct VendorInfoView: View {
    let vendor: Vendor
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack{
                HStack {
                    Text(vendor.vendorFullName)
                        .font(.headline)
                        .fontWeight(.semibold)
                    Spacer()
                    Text(vendor.vendorState.title)
                        .foregroundColor(.secondary)
                }
            }
            
            HStack {
                Text(vendor.vendorAddressName)
                    .font(.headline)
                    .fontWeight(.semibold)
            }
        }
        .padding()
    }
}

struct VendorInfoView_Previews: PreviewProvider {
    static var previews: some View {
        VendorInfoView(vendor: dev2.mockVendor)
    }
}
