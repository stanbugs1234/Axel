//
//  RatingRowView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 11/20/24.
//

import SwiftUI

struct RatingRowView: View {
    @ObservedObject var ratingViewModel: RatingViewModel
    
    let user: User
    
    var body: some View {
        HStack{
            //MARK: User Rating
            Text(ratingViewModel.averageUserRatingString(uid: user.uid!))
                .font(.caption)
                .foregroundColor(.secondary)
            if ratingViewModel.averageUserRatingString(uid: user.uid!) == "No Reviews" {
                Image(systemName: "star.fill")
                    .resizable()
                    .frame(width: 8, height: 8)
                    .scaledToFill()
                    .foregroundColor(.secondary)
            } else {
                Image(systemName: "star.fill")
                    .resizable()
                    .frame(width: 8, height: 8)
                    .scaledToFill()
                    .foregroundColor(.yellow)
            }

        }
        .padding(.top, 2)
        
    }
}

#Preview {
    RatingRowView(ratingViewModel: RatingViewModel(user: MockData.users.first!), user: MockData.users.first!)
}
