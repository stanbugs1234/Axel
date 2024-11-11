//
//  MainOverviewRowView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 10/22/23.
//

import SwiftUI

struct MainOverviewRowView: View {
    @State private var screenWidth = UIScreen.main.bounds.size.width
    
    let title: String
    
    var body: some View {
        
        ZStack {
            VStack {
                HStack{
                    Text(title)
                        .font(.title2)
                        .fontWeight(.bold)
                    Spacer()
                }
                HStack {
                    Text("Number of Drivers: ")
                    Text("20")
                    Spacer()
                }
                .padding(.vertical)
            }
            .padding()
            .padding(.bottom, 130)
            
            VStack {
                Image(systemName: "rainbow")
                    .resizable()
                    .scaleEffect(2.5)
                    .blur(radius: 50)
                    .cornerRadius (14)
                    .frame(maxWidth: (screenWidth - 20))
                    .frame(maxHeight: 250)
                    .opacity (0.08)
                
                
            }
        }
    }
}

#Preview {
    MainOverviewRowView(title: "Drivers")
}
