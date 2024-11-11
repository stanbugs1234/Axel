//
//  NotificationView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 11/25/23.
//

import SwiftUI

struct NotificationView: View {
    @ObservedObject var friendViewModel: FriendRequestViewModel
    @StateObject var jobRequestViewModel = JobRequestViewModel()
    @State private var updateFriends = false
    
    var body: some View {
        let user = UserService.shared.currentUser
        VStack {
            ScrollView {
                LazyVStack {
                    VStack {
                        HStack {
                            Image(systemName: "person.badge.plus")
                                .renderingMode(.template)
                                .resizable()
                                .frame(width: 30, height: 30, alignment: .leading)
                            
                            Text("Friend Requests")
                                .padding(.leading, 8)
                                .foregroundColor(.primary)
                            
                            Spacer()
                        }
                        .padding(.leading)
                        .padding(.trailing)
                        .padding(.bottom, -4)
                        HStack {
                            if friendViewModel.friends.count == 0 {
                                HStack {
                                    Text("No Friend Requests at this time")
                                        .padding()
                                }
                            } else {
                                ForEach(friendViewModel.friends) { friend in
                                    FriendRequestRowView(friendViewModel: FriendRequestViewModel(), friend: friend)
                                        .padding(.top, -10)
                                }
                            }
                        }
                    }
                }
                
                Divider()
                
                VStack {
                    HStack {
                        Image(systemName: "point.bottomleft.forward.to.arrowtriangle.uturn.scurvepath.fill")
                            .renderingMode(.template)
                            .resizable()
                            .frame(width: 30, height: 30, alignment: .leading)
                        
                        Text("Job Request")
                            .padding(.leading, 8)
                            .foregroundColor(.primary)
                        
                        Spacer()
                    }
                    .padding(.leading)
                    .padding(.trailing)
                    
                    HStack {
                        Text("You have a Mother Fucking job requests")
                        
                    }
                    .padding(.top)
                }
                .padding(.top, 7)
            }
        }
        .onAppear(perform: {
            friendViewModel.fetchFriendRequests(forUid: user?.id ?? "") { friends in
                self.friendViewModel.friends = friends
            }
        })
        .foregroundColor(.themeGreen)
        .padding()
        .navigationTitle("Notifications")
    }
}

#Preview {
    NavigationView {
        NotificationView(friendViewModel: FriendRequestViewModel())
    }
}
