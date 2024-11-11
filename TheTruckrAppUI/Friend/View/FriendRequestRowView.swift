//
//  FriendRequestRowView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 11/22/23.
//

import SwiftUI
import Kingfisher

struct FriendRequestRowView: View {
    @ObservedObject var friendViewModel: FriendRequestViewModel
    @State private var addFriendButtonTitle = "Add Friend"
    @State private var deleteFriendButtonTitle = "Reject"
    @State private var updateFriends = false
    
    let friend: Friend
    
    var body: some View {
        let abbreviatedName = initials(from: friend.userFullName)
        let maxWidth = UIScreen.main.bounds.width / 4.5
        let user = UserService.shared.currentUser
        
        HStack {
            //MARK: Abbreviation Circle
            if friend.profileImageUrl == "" {
                ZStack {
                    Circle()
                        .frame(width: 65, height: 65, alignment: .leading)
                        .foregroundColor(.gray)
                    
                    Text(abbreviatedName!)
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                }
                
            } else {
                //MARK: User Profile Image
                KFImage(URL(string: friend.profileImageUrl!))
                    .resizable()
                    .frame(width: 65, height: 65)
                    .scaledToFit()
                    .clipShape(Circle())
            }
            
            //MARK: User Name
            VStack {
                HStack {
                    Text(friend.userFullName)
                        .font(.headline)
                        .padding(.leading)
                    
                    Spacer()
                    
                    //Need to calculate the
                    Text("2w")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                .padding(.top)
                
                //MARK: Mutal Friends - Need to Calculate
                HStack {
                    Text("56 Mutal Friends")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.bottom, 3)
//                .padding(.top, 1)

                
                //MARK: Add Friend Button
                HStack {
                    Button {
                        friendViewModel.addFriend(friend, userFullName: friend.userFullName, profileImageUrl: friend.profileImageUrl!, acceptorUid: friend.uid)
                        addFriendButtonTitle = "Friend Added"
                        friendViewModel.fetchFriendRequests(forUid: user?.id ?? "") { friends in
                            self.friendViewModel.friends = friends
                        }
                    } label: {
                            Text(addFriendButtonTitle)
                            .frame(width: maxWidth, height: 25)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                    }
                    .buttonStyle(.borderedProminent)
                    .accentColor(.themeGreen)
                    .padding(.trailing, 15)
                    
                    //MARK: Remove Friend Button
                    Button {
                        friendViewModel.deleteFriend(friend, userFullName: friend.userFullName, profileImageUrl: friend.profileImageUrl!, acceptorUid: friend.uid)
                        deleteFriendButtonTitle = "Rejected"
                        friendViewModel.fetchFriendRequests(forUid: user?.id ?? "") { friends in
                            self.friendViewModel.friends = friends
                        }
                    } label: {
                        Text(deleteFriendButtonTitle)
                            .foregroundColor(.primary)
                            .frame(width: maxWidth, height: 25)
                            .fontWeight(.semibold)
                    }
                    .buttonStyle(.bordered)
                    
                    Spacer()
                }
                .font(.subheadline)
                .padding(.leading)
                Divider()
            }
        }
        .padding()
    }
}

struct FriendRequestRowView_Previews: PreviewProvider {
    static var previews: some View {
        FriendRequestRowView(friendViewModel: FriendRequestViewModel(), friend: dev2.mockFriendRequest)
    }
}
