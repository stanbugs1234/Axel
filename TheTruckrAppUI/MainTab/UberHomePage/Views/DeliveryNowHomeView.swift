//
//  DeliveryNowHomeView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 12/15/24.
//

import SwiftUI

struct DeliveryNowHomeView: View {
    @State private var searchText = ""
    @State private var showTimePicker = false
    
    var body: some View {
        ScrollView {
            HStack {
                ZStack {
                    HStack {
                        SearchBarView(text: $searchText, placementString: "Where to?")
                            .frame(height: 50)
                        
                        Spacer()
                        
                        Button {
                            showTimePicker.toggle()
                        } label: {
                            HStack {
                                Image(systemName: "clock.fill")
                                Text("Now")
                                Image(systemName: "chevron.down")
                            }
                            .foregroundStyle(.primary)
                        }
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 30, style: .circular))
                    .buttonStyle(BorderedProminentButtonStyle())
                    .tint(.background)
                }
            }
            
        }
    }
}

#Preview {
    NavigationStack {
        DeliveryNowHomeView()
            .preferredColorScheme(.dark)
    }
}
