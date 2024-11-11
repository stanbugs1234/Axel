//
//  Feed.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 4/26/23.
//

import SwiftUI

struct FeedView: View {
    @State private var showNewMessageView = false
    @ObservedObject var viewModel = FeedViewModel()
    @ObservedObject var friendViewModel: FriendRequestViewModel
    
    var body: some View {
            ZStack(alignment: .bottomTrailing) {
                ScrollView {
                    LazyVStack {
                        ForEach(viewModel.posts) { post in
                            MessageRowView(post: post, user: post.user!)
                        }
                        .padding(.bottom, 7)
                        .padding(.trailing)
                        .padding(.leading)
                    }
                }
                .padding(.top)
                .refreshable {
                    viewModel.fetchPosts()
                }
                
                Button {
                    showNewMessageView.toggle()
                } label: {
                    ZStack {
                        
                        Image(systemName: "square.and.pencil.circle.fill")
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(.themeGreen)
                            .frame(width: 45, height: 45)
                            .padding()
                    }
                }
                .foregroundColor(.themeGreen)
                .clipShape(Circle())
                .padding() 
                .fullScreenCover(isPresented: $showNewMessageView, onDismiss: viewModel.fetchPosts) {
                    NewMessageView()
                }
            }
            .navigationTitle("Posts")
//            .navigationBarTitleDisplayMode(.inline)
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            FeedView(friendViewModel: FriendRequestViewModel())
        }
    }
}
