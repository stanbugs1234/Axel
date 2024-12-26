//
//  RecentSearchView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 12/24/24.
//

import SwiftUI

struct RecentSearchView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Recent")
                    .font(.headline)
                    .foregroundStyle(.secondary)
                Spacer()
            }
            .padding(.vertical)
            
            HStack {
                Image(systemName: "clock")
                
                VStack(alignment: .leading) {
                    Text("Stone")
                        .fontWeight(.semibold)
                    
                    Divider()
                }
                .padding(.horizontal)
                
                Spacer()
            }
            .padding(.vertical)
        }    }
}

#Preview {
    RecentSearchView()
}
