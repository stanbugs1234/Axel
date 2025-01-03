//
//  SearchBarView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 6/4/23.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var text: String
    let placementString: String
    
    var body: some View {
        HStack {
            TextField(placementString, text: $text)
                .padding(8)
                .padding(.horizontal, 24)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0,
                                   maxWidth: .infinity,
                                   alignment: .leading)
                            .padding(.leading, 8)
                        
                    }
                )
        }
        .padding(.horizontal, 4)
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(text: .constant(""), placementString:"Search...")
    }
}
