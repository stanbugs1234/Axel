//
//  MessageUserStatsView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 5/15/23.
//

import SwiftUI

struct MessageUserStatsView: View {
    var body: some View {
        HStack(spacing: 24) {
            HStack(spacing: 4) {
                Text("87")
                    .font(.subheadline)
                    .bold()
                
                Text("Friends")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            HStack(spacing: 4) {
                Text("1.9M")
                    .font(.subheadline)
                    .bold()
                
                Text("Follows")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
    }
}

struct MessageUserStatsView_Previews: PreviewProvider {
    static var previews: some View {
        MessageUserStatsView()
    }
}
