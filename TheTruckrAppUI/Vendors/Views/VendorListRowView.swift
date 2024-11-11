//
//  VendorListRowView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 11/12/23.
//

import SwiftUI

struct VendorListRowView: View {
    let vendor: Vendor
    
    var body: some View {
        HStack {
            VStack{
                HStack {
                    Text(vendor.vendorFullName)
                        .font(.headline)
                    
                    Spacer()
                    
                    Text(vendor.vendorState.title)
                        .foregroundColor(.secondary)
                        .font(.footnote)
                    
                    Divider()
                }
            }
            .foregroundColor(.themeGreen)
            .padding()
            
        }
    }
}

struct VendorListRowView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            VendorListRowView(vendor: dev2.mockVendor)
        }
    }
}
