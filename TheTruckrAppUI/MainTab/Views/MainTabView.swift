//
//  MainTabView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 4/27/23.
//

import SwiftUI
import Kingfisher

struct MainTabView: View {
    @ObservedObject var friendViewModel: FriendRequestViewModel
    @StateObject var viewModel = InboxViewModel()
    
    @State private var selectedIndex = 0
    @State private var showMenu = false
    
    @State var photo = Photo()
    
    private var user: User? {
        return UserService.shared.currentUser
    }
    var body: some View {
        ZStack {
            //MARK: Home Screen
            TabView(selection: $selectedIndex) {
                NavigationStack {
                    MainHomeView()
                        .onTapGesture {
                            self.selectedIndex = 0
                        }
                }
                .tabItem {
                    VStack{
                        Image(systemName: "house")
                        Text("Home")
                    }
                }.tag(0)
                
                //MARK: Friends Screen
                NavigationStack {
                    ExploreView()
                    //                        UserView()
                        .onTapGesture {
                            self.selectedIndex = 1
                        }
                }
                .tabItem {
                    VStack {
                        Image(systemName: "person.2")
                        Text("Friends")
                    }
                }.tag(1)
                
                //MARK: Inbox View
                NavigationStack {
                    InboxView()
                        .onTapGesture {
                            self.selectedIndex = 2
                        }
                }
                .tabItem {
                    VStack {
                        Image(systemName: "bubble.left.and.text.bubble.right.fill")
                        Text("Chats")
                    }
                }.tag(2)
                
                //MARK: PostView
                NavigationStack{
                    MessagesView()
                        .onTapGesture {
                            self.selectedIndex = 3
                        }
                }
                
                .tabItem {
                    VStack {
                        Image(systemName: "envelope")
                        Text("Posts")
                    }
                }.tag(3)
                
                //MARK: Notification
                NavigationStack {
                    NotificationView(friendViewModel: FriendRequestViewModel())
                        .onTapGesture {
                            self.selectedIndex = 4
                        }
                }
                .tabItem {
                    VStack {
                        if friendViewModel.friends.count == 0 {
                            Image(systemName: "bell")
                        } else {
                            Image(systemName: "bell.badge")
                        }
                        Text("Notifications")
                    }
                }.tag(4)
                
                NavigationStack{
                    ProfileView(user: user!)
                        .onTapGesture {
                            self.selectedIndex = 5
                        }
                }
                .padding(.bottom)
                .tabItem {
                    VStack {
                        Image(systemName: "person")
                        Text("Account")
                    }
                }.tag(5)
            }
            .padding(.top, 2)
            .padding(.bottom, 4)
        }
        .accentColor(.themeGreen)
        .navigationTitle("\(AppConstants.appNameUpperCase)")
        .navigationBarTitleDisplayMode(.inline)
    }
}


struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            MainTabView(friendViewModel: FriendRequestViewModel())
            
        }
    }
}