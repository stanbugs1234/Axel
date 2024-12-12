//
//  PostCommentView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 12/26/23.
//

import SwiftUI

struct PostCommentView: View {
    @ObservedObject var viewModel: PostCommentViewModel
    @Environment(\.presentationMode) var presentationMode
    
    init(post: Post) {
        self.post = post
        self.viewModel = PostCommentViewModel(post: post)
        self.user = UserService.shared.currentUser
    }
    
    let post: Post
    let user: User?
    
    var body: some View {
        if let user = viewModel.post.user {
            ZStack {
                VStack{
                    HStack{
                        Button {
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            Text("Cancel")
                                .foregroundColor(.themeGreen)
                                .padding(.horizontal)
                                .padding(.vertical, 8)
                        }
                        
                        Spacer()
                    }
                    .padding(.top)
                    
                    ScrollView {
                        //MARK: MessageRowView - Actual Post
                        HStack {
                            PostRowView(post: post, user: post.user!)
                        }
                        
                        //MARK: Comments for Post
                        LazyVStack {
                            ForEach(viewModel.postComments) { postComment in
                                CommentRowView(postComment: postComment, postCommentUser: user)
                                    .padding(.trailing)
                                    .padding(.leading)
                            }
                        }
                    }
                    
                    
                    Spacer()
                    
                    //MARK: New Comment Section
                    HStack(alignment: .bottom) {
                        NewCommentRowView(post: post, user: user)
                            .frame(height: 100, alignment: .bottom)
                    }
                    
                }
            }
            .padding(.trailing)
            .padding(.leading)
        }
    }
}


//MARK: Preview
#Preview {
    NavigationStack {
        PostCommentView(post: MockData.posts[0])
    }
}
