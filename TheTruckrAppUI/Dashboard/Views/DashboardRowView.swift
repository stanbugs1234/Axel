//
//  DashboardRowView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 10/9/23.
//

import SwiftUI

struct DashboardRowView: View {
    
    var title: String
    
    var body: some View {
        ZStack {
           Rectangle()
                .frame(width: .infinity, height: 225)
                .cornerRadius(15)
                .foregroundColor(.backgroundColor)
            HStack {
                Text(title)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.opposite)
                    .offset(y: -85)
                
                Spacer()
            }
            .padding()

        }
        .padding(.top)
    }
}

#Preview {
    DashboardRowView(title: "Account Overview")
}
