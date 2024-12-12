//
//  DeliverNowAddressPicker.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 12/18/24.
//

import SwiftUI

struct DeliverNowAddressPicker: View {
    @State var text: String = ""
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                SearchBarView(text: $text,
                              placementString: "Search for an address")
                    .padding(.bottom)
            }
            
            HStack {
                Text("Saved addresses")
                    .fontWeight(.semibold)
                
                Spacer()
            }
            
            
            Divider()
            
            HStack {
                Text("Time preference")
                    .fontWeight(.semibold)
                
                Spacer()
            }
            .padding(.vertical)
            
            HStack {
                Image(systemName: "clock")
                    .resizable()
                    .frame(width: 20, height: 20)
                    
                Text("Deliver now")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .padding(.horizontal)
                
                Spacer()
                
                Button {
                    
                } label: {
                   Text("Schedule")
                        .font(.subheadline)
                        .foregroundStyle(.opposite)
                        .foregroundStyle(.secondary)
                }
                .buttonStyle(BorderedButtonStyle())
                .buttonBorderShape(.roundedRectangle)

            }
            .padding(.horizontal)
            
            Spacer()
            
        }
        .padding()
        .navigationTitle(Text("Addresses"))
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        DeliverNowAddressPicker()
            .preferredColorScheme(.dark)
    }
}
