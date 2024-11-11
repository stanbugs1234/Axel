//
//  MainCompleteHomeView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 5/23/23.
//

import SwiftUI
import Kingfisher

struct MainCompleteHomeView: View {
    @State private var showMenu = false
    @EnvironmentObject var authViewModel: AuthViewModel
    @EnvironmentObject var homeViewModel: HomeViewModel
    
    var body: some View {
        //No User Loged in
                //Have a logged in User
                NavigationView{
                    ZStack(alignment: .topLeading) {
                        MainTabView(friendViewModel: FriendRequestViewModel())
                        ZStack(alignment: .topLeading) {
                            if showMenu {
                                ZStack{
                                    Color(.black)
                                        .opacity(showMenu ? 0.25 : 0.0)
                                }.onTapGesture {
                                    withAnimation(.easeInOut) {
                                        showMenu = false
                                    }
                                }
                                
                                //:MARK: SideMenuView
                                SideMenuView(user: UserService.shared.currentUser!)
                                    .frame(width: 300)
                                    .offset(x: showMenu ? 0 : -300, y: 0)
                                    .background(showMenu ? Color.white : Color.clear)
                            }
                        }
                    }
                }
                .navigationTitle("HAULR")
                .navigationBarTitleDisplayMode(.inline)
                
                .onAppear {
                    showMenu = false
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            withAnimation(.easeInOut) {
                                showMenu.toggle()
                            }
                        } label: {
                            CircularProfileImageView(user: UserService.shared.currentUser, size: .small)
                        }
                    }
                }
    }
}

struct MainCompleteHomeView_Previews: PreviewProvider {
    static var previews: some View {
        MainCompleteHomeView()
            .environmentObject(AuthViewModel())
            .environmentObject(HomeViewModel())
    }
}
