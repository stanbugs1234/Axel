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
    
    var body: some View {
        if let user = UserService.shared.currentUser {
            ZStack(alignment: .bottomTrailing) {
                ScrollView {
                    VStack {
                        ForEach(viewModel.posts) { post in
                            PostRowView(post: post, user: user)
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
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

//MARK: Preview
#Preview {
    NavigationStack {
        FeedView()
    }
}
