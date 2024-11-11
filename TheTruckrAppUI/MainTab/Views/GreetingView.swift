//
//  GreetingView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 1/21/24.
//

import SwiftUI

struct GreetingView: View {
    let user: User?
    let viewModel: MainHomeViewModel
    
    var body: some View {
        HStack {
            Text(viewModel.greetingMessage)
            
            Text(user?.fullname ?? "")
        }
        .font(.title3)
        .fontWeight(.semibold)
        .foregroundColor(.themeGreen)
        .padding(.bottom, 30)
    }
}

struct GreetingView_Previews: PreviewProvider {
    static var previews: some View {
        GreetingView(user: dev2.mockUser, viewModel: MainHomeViewModel())
    }
}
