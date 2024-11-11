//
//  MainHeaderView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 5/12/23.
//

import SwiftUI
import Kingfisher


struct MainHeaderView: View {
    @State private var showMenu = false
    
    var body: some View {
        
        ZStack(alignment: .topLeading) {
            ZStack {
                Color(.black)
                //                    .ignoresSafeArea()
                
                HStack {
                    Button {
                        showMenu.toggle()
                    } label: {
                        Image(systemName: "person")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 35,
                                           height: 35)
                                    .foregroundColor(.white)
                    }
                    
                    Spacer()
                    
                    Text("TRUCKN")
                        .foregroundColor(.white)
                        .font(.system(size: 38))
                        .padding()
                    
                    Spacer()
                }
                .padding()
            }
        }
        .frame(height: 60)
    }
}

struct MainHeaderView_Previews: PreviewProvider {
    static var previews: some View {
            MainHeaderView()
    }
}
