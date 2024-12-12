//
//  SharePostView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 12/29/23.
//

import SwiftUI

struct SharePostView: View {
    let post: Post
    let user: User?
    
    var body: some View {
        if let user = post.user {
            VStack {
                NewCommentRowView(post: post, user: user)
                    .frame(height: 80)
                
                Divider()
                
                ScrollView {
                    PostRowView(post: post, user: post.user!)
                        .padding()
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("Share Post")
        }
    }
}

//MARK: Preview
#Preview {
    NavigationStack {
        SharePostView(post: MockData.posts.first!, user: MockData.users.first!)
    }
}
