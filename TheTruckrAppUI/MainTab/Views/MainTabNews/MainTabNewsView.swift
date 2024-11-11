//
//  MainTabNewsView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 3/9/24.
//

import SwiftUI

struct MainTabNewsView: View {
    var body: some View {
        ZStack {
            HStack {
                Image("DumpTruckStatusImage")
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerSize: /*@START_MENU_TOKEN@*/CGSize(width: 20, height: 10)/*@END_MENU_TOKEN@*/))
            }
            HStack {
                Spacer()
                    
                    Text("Truck Status")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.green)
                        .padding(.top, 100)
            }
        }
    }
}

#Preview {
    MainTabNewsView()
}
