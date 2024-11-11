//
//  ProfileView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 4/27/23.
//

import SwiftUI
import Kingfisher

struct ProfileView: View {
    @ObservedObject var friendViewModel: FriendRequestViewModel
    @State private var selectedFilter: MessageFilterViewModel = .messages
    @ObservedObject var viewModel: ProfileViewModel
    @Environment(\.presentationMode)  var mode
    @Namespace var animation
    @State private var addFriendButtonTitle = "Add Friend"
    let user: User
    
    init(user:User) {
        self.viewModel = ProfileViewModel(user: user)
        self.user = user
        self.friendViewModel = FriendRequestViewModel()
    }
    
    var body: some View {
        VStack(alignment: .leading){
            
            headerView
            
            actionButtons
            
            userInfoDetails
            
            messageFilterBar
            
            messageView
            
            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
        .labelsHidden()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ProfileView( user: dev2.mockUser)
        }
    }
}

extension ProfileView {
    //MARK: Header View
    var headerView: some View {
        return ZStack(alignment: .bottomLeading){
            Color(.black)
                .ignoresSafeArea()
            
            VStack {
                CircularProfileImageView(user: user, size: .xxLarge)
                        .offset(x: 24, y: 37)
                
                Spacer()
            }
            
            Spacer()
        }
        .frame(height: 96)
    }
    
    //MARK: Action Buttons
    var actionButtons: some View{
        HStack(spacing: 12) {
            Spacer()
            NavigationLink {
                NotificationView(friendViewModel: FriendRequestViewModel())
            } label: {
                if friendViewModel.friends.count != 0 {
                    Image(systemName: "bell.badge")
                        .font(.title3)
                        .padding(6)
                        .overlay(Circle().stroke(Color.gray, lineWidth: 0.75))
                        .foregroundColor(.themeGreen)
                } else {
                    Image(systemName: "bell")
                        .font(.title3)
                        .padding(6)
                        .overlay(Circle().stroke(Color.gray, lineWidth: 0.75))
                        .foregroundColor(.themeGreen)
                }
            }
            
            //MARK: Add Friend &/ Edit Profile Button
            Button {
                if viewModel.actionButtonTitle == "Add Friend" {friendViewModel.sendFriendRequest(
                    userFullName: UserService.shared.currentUser!.fullname,
                    profileImageUrl: UserService.shared.currentUser!.profileImageUrl!,
                    acceptorUid: user.id ?? "")
                }
                else {
                    NavigationLink {
                        UserProfileSelectorView(user: user)
                    } label: {
                        Text(viewModel.actionButtonTitle)
                            .font(.subheadline).bold()
                            .frame(width: 120, height: 32)
                            .overlay(RoundedRectangle(cornerRadius: 20).stroke( Color.gray, lineWidth: 0.75))
                            .foregroundColor(.themeGreen)
                    }
                }
            } label: {
                Text(viewModel.actionButtonTitle)
                    .font(.subheadline).bold()
                    .frame(width: 120, height: 32)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke( Color.gray, lineWidth: 0.75))
                    .foregroundColor(.themeGreen)
            }
        }
        .padding(.trailing)
        .padding(.top, 40)
    }
    
    var userInfoDetails: some View {
        VStack(alignment: .leading, spacing: 4) {
            //MARK: User Full Name
            HStack {
                Text(viewModel.user.fullname)
                    .font(.title2)
                    .bold()
                
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(Color(.systemBlue))
            }
            .foregroundColor(.themeGreen)
            
            //MARK: User Email
            Text(viewModel.user.email)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .padding(.top, 3)
            
            HStack {
                Image(systemName: "mappin.and.ellipse")
                
                Text("Metairie, Louisiana")
            }
            .padding(.top, 5)
            .font(.caption)
            .foregroundColor(.secondary)
            
            //MARK: Message User State View
            messageUserStatsView
                .padding(.vertical)
        }
        .padding(.horizontal)
    }
    
    //MARK: Message Filter Bar
    var messageFilterBar: some View {
        HStack {
            ForEach(MessageFilterViewModel.allCases, id: \.rawValue) {item in
                VStack {
                    Text(item.title)
                        .font(.subheadline)
                        .fontWeight(selectedFilter == item ? .semibold : .regular)
                        .foregroundColor(selectedFilter == item ? .themeGreen : .gray)
                    
                    if selectedFilter == item {
                        Capsule()
                            .foregroundColor(.themeGreen)
                            .frame(height: 3)
                            .matchedGeometryEffect(id: "filter", in: animation)
                    } else {
                        Capsule()
                            .foregroundColor(Color(.clear))
                            .frame(height: 3)
                    }
                }
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        self.selectedFilter = item
                    }
                }
            }
        }
        .overlay(Divider().offset(x:9, y: 16))
    }
    
    //MARK: Message View
    var messageView: some View {
        ScrollView {
            LazyVStack {
                ForEach(viewModel.posts(forFilter: self.selectedFilter)) { post in
                    MessageRowView(post: post, user: post.user!)
                        .padding()
                }
            }
        }
    }
    
    //MARK: Message User States
    var messageUserStatsView: some View {
        HStack(spacing: 24) {
            HStack(spacing: 4) {
                Text("87")
                    .font(.subheadline)
                    .bold()
                
                Text("Friends")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            HStack(spacing: 4) {
                Text("1.9M")
                    .font(.subheadline)
                    .bold()
                
                Text("Follows")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            HStack(spacing: 4) {
                UserRatingStatView(user: user)
                
                Text("Rating")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
    }
}
