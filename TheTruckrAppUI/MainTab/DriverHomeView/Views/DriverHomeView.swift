//
//  Home2.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 11/8/24.
//

import SwiftUI

struct DriverHomeView: View {
    @StateObject var mainHomeViewModel = GreetingViewModel()
    @StateObject var viewModel = DriverViewModel()
      
    let user: User
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            HStack(alignment: .center) {
                //MARK: Greeting
                GreetingView(user: user,
                             viewModel: mainHomeViewModel)
            }
            
            //MARK: Status View
            DriverStatusView()
            
            HStack {
                //MARK: Schedule View
                DriverHomeScreenButtonImage(
                    imageName: "CalendarImage",
                    width: SizeConstants.cardHalfWidth,
                    height: SizeConstants.cardButtonHeight)
                
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: SizeConstants.cardHalfWidth,
                           height: SizeConstants.cardButtonHeight)
            }
            
            //MARK: Schedule View
            DriverHomeScreenButtonImage(
                imageName: "DrivingWindshield",
                width: SizeConstants.cardWidth,
                height: SizeConstants.cardThirdHeight)

            
            //MARK: Schedule View
            DriverHomeScreenButtonImage(
                imageName: "CalendarImage",
                width: SizeConstants.cardWidth,
                height: SizeConstants.cardThirdHeight)
        }
        .padding(.vertical)
    }
}

#Preview {
    NavigationStack {
        DriverHomeView(user: MockData.users[0])
    }
}
