//
//  OrderRequestView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 1/30/24.
//

import SwiftUI
import Kingfisher

struct OrderRequestView: View {
    @State private var addJobButtonTitle = "Add Job"
    @State private var deleteJobButtonTitle = "Reject Job"
    
    let user: User
    let order: Order
    let trip: Trip
    
    var body: some View {
        let maxWidth = UIScreen.main.bounds.width / 2.5
        VStack {
            //MARK: User Profile or Initials
            HStack {
                CircularProfileImageView(user: user, size: .xxLarge)
                    .padding(.bottom)
            }
            //MARK: User Info
            VStack {
                HStack {
                    Text(user.fullname)
                        .font(.title3)
                        .padding(.leading)
                    
                    Image(systemName: "star.fill")
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(.yellow)
                        .frame(width: 12, height: 12)
                    
                    //MARK: Rating
                    Text("4.7")
                        .font(.caption)
                    
                    Spacer()
                    
                    Text("$90/HR")
                        .font(.headline)
                    
                }
                .padding(.top, 1)
                .padding(.bottom, 4)
                
                //MARK: Order Time
                HStack {
                    //Need to calculate the
                    Text(Date().dateDisplayFormat)
                    
                    Spacer()
                    
                    Text(order.orderDate.timeOnlyDisplayFormat)
                }
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(.secondary)
                .padding(.bottom, 4)
                .padding(.leading)
            }
            
            //MARK: Trip Details
            HStack {
                Text("Arrive: Empty ")
                
                
                Text(order.vendorName)
            }
            .font(.subheadline)
            .foregroundColor(.secondary)
            .fontWeight(.semibold)
            
            //MARK: Add Job Button
            HStack {
                Button {
                    //
                } label: {
                    Text(addJobButtonTitle)
                        .frame(width: maxWidth, height: 30)
                        .fontWeight(.semibold)
                }
                .buttonStyle(.borderedProminent)
                
                //MARK: Remove Job Button
                Button {
                    //                        friendViewModel.deleteFriend(friend, userFullName: friend.userFullName, profileImageUrl: friend.profileImageUrl!, acceptorUid: friend.uid)
                    //                        deleteFriendButtonTitle = "Rejected"
                } label: {
                    Text(deleteJobButtonTitle)
                        .foregroundColor(.primary)
                        .frame(width: maxWidth, height: 30)
                        .fontWeight(.semibold)
                    
                }
                .buttonStyle(.bordered)
                
            }
            .padding(.horizontal)
            .padding(.bottom)
            
            Divider()
            
        }
        .padding(.horizontal)
    }
}

struct OrderReqeustView_Previews: PreviewProvider {
    static var previews: some View {
        OrderRequestView(user: dev2.mockUser, order: dev2.mockOrder, trip: dev2.mockTrip)
    }
}
