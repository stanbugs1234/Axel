//
//  UserRatingStatView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 6/20/24.
//

import SwiftUI

struct UserRatingStatView: View {
    let user: User
    @ObservedObject var ratingViewModel: RatingViewModel
    
    init(user: User) {
        self.user = user
        self.ratingViewModel = RatingViewModel(user: user)
    }
    
    var body: some View {
        Text(ratingViewModel.averageUserRatingString(uid: user.uid!))
            .font(.caption)
        
        Image(systemName: "star.fill")
            .renderingMode(.template)
            .resizable()
            .scaledToFill()
            .frame(width: 10, height: 10)
            .foregroundColor(.yellow)
    }
}

#Preview {
    UserRatingStatView(user: MockData.users[0])
}
