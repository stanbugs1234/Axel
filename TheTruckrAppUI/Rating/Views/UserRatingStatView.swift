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
        Text(ratingViewModel.averageUserRating(uid: user.uid!))
            .font(.caption)
        
        Image(systemName: "star.fill")
            .renderingMode(.template)
            .resizable()
            .scaledToFill()
            .frame(width: 10, height: 10)
            .foregroundColor(.yellow)
    }
}

struct UserRatingStatView_Previews: PreviewProvider  {
    static var previews: some View {
        UserRatingStatView(user: dev2.mockUser)
    }
   
}
