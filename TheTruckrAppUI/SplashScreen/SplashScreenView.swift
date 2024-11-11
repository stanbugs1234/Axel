//
//  SplashScreenView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 5/13/23.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    @State private var size = 0.2
    @State private var opacity = 0.25
    @State private var buttonIsActive = false
    @State private var speedA = 1.0
    @State private var speedB = 0.55
    
    var body: some View {
        if isActive {
            MainTabView(friendViewModel: FriendRequestViewModel())
        } else{
            VStack {
                VStack{
                    HStack {
                        Image(systemName: "wind")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .rotationEffect(.degrees(180))
                            .symbolEffect(.pulse)
                            
                        
                        Image(systemName: "box.truck.fill")
                            .font(.system(size:80))
                    }
                    .foregroundColor(.themeGreen)
                    
                    HStack {
                        Image(systemName: "poweron")
                            .rotationEffect(.degrees(90))
                            .symbolEffect(.pulse, options: .speed(speedB))                            .padding(.horizontal, 8)
                        
                        Image(systemName: "poweron")
                            .rotationEffect(.degrees(90))
                            .symbolEffect(.pulse, options: .speed(speedA))
                            
                            .padding(.horizontal, 8)
                        
                        Image(systemName: "poweron")
                            .rotationEffect(.degrees(90))
                            .symbolEffect(.pulse, options: .speed(speedB))
                            .padding(.horizontal, 8)
                        
                        Image(systemName: "poweron")
                            .rotationEffect(.degrees(90))
                            .symbolEffect(.pulse, options: .speed(speedA))
                            .padding(.horizontal, 8)
                        
                        Image(systemName: "poweron")
                            .rotationEffect(.degrees(90))
                            .symbolEffect(.pulse, options: .speed(speedB))
                            .padding(.horizontal, 8)
                        
                        Image(systemName: "poweron")
                            .rotationEffect(.degrees(90))
                            .symbolEffect(.pulse, options: .speed(speedA))
                            .padding(.horizontal, 8)
                    }
                    
                    
                    Text("HAULR")
                        .font(Font.custom("Helena-Bold", size: 40))
                        .fontWeight(.bold)
                        .foregroundColor(.themeGreen.opacity(0.60))
                }
//                .scaleEffect(size)
//                .opacity(opacity)
//                .onAppear {
//                    withAnimation(.easeIn(duration: 2.0)) {
//                        self.size = 1.25
//                        self.opacity = 1.0
//                    }
//                }
            }
            .background()
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
