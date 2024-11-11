//
//  Home2.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 11/8/24.
//

import SwiftUI

struct Home2: View {
    @StateObject var mainHomeViewModel = MainHomeViewModel()
      
    let user: User
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            HStack(alignment: .center) {
                //MARK: Greeting
                GreetingView(user: user, viewModel: mainHomeViewModel)
                    .padding(.top, 30)
            }
            
            Rectangle()
                .frame(width: SizeConstants.cardWidth, height: SizeConstants.cardThirdHeight)
            
            Spacer()
            
            Rectangle()
                .frame(width: SizeConstants.cardWidth, height: SizeConstants.cardButtonHeight)
            
            Spacer()
            
            Rectangle()
                .frame(width: SizeConstants.cardWidth, height: SizeConstants.cardButtonHeight)
            
            Spacer()
        }
    }
}

#Preview {
    Home2(user: MockData.users[0])
}
