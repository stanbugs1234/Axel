//
//  CommentRowView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 12/25/23.
//

import SwiftUI
import Kingfisher


struct CommentRowView: View {
    @ObservedObject var viewModel: CommentRowViewModel
    @State private var showCommentView = false
    @State private var showPostCommentsView = false
    
    let postCommentUser: User?

    init(postComment: PostComment, postCommentUser: User) {
        self.viewModel = CommentRowViewModel(postComment: postComment)
        self.postCommentUser = postCommentUser
    }
    
    var body: some View {
        if let postCommentUser = viewModel.postCommentUser {
            VStack(alignment: .leading) {
                HStack{
                    //MARK: Profile Image &/ Appreciated Name Circle
                    NavigationLink {
                        ProfileView(user: postCommentUser)
                    } label: {
                        CircularProfileImageView(user: viewModel.postCommentUser, size: .medium)
                    }
                    
                    //MARK: User Info & Message Caption
                    
                    VStack {
                        //MARK: User Full Name
                        HStack {
                            Text(viewModel.postComment.userFullName)
                                .font(.subheadline).bold()
                                .padding(.bottom, 2)
                                .foregroundColor(.themeGreen)
                            
                            Spacer()
                        }
                        
                        //MARK: Message Caption
                        HStack {
                            Text(viewModel.postComment.caption)
                                .font(.subheadline)
                                .multilineTextAlignment(.leading)
                                .padding(.bottom, 2)
                            
                            Spacer()
                        }
                        
                        //MARK: Comment View
                        HStack{
                            //MARK: Time Difference since post
                            Text(viewModel.calculateTimebetweenTodaysDateAndPostDate(postComment: viewModel.postComment))
                            
                            Button {
                                //                                viewModel.post.didLike ?? false ?
                                //                                viewModel.unlikePost() :
                                //                                viewModel.likePost()
                                
                            } label: {
                                Text("\(viewModel.postComment.likes)")
                            }
                            
                            Text("Likes")
                            
                            Button {
                                showPostCommentsView.toggle()
                                
                            } label: {
                                Text("Reply")
                            }
                            
                            Spacer()
                        }
                        .foregroundColor(.gray)
                        .font(.caption)
                        .padding(.bottom, 1)
                    }
                    .padding(.leading)
                }
                Divider()
            }
        }
    }
}

//MARK: Preview
#Preview {
    NavigationStack {
        CommentRowView(postComment: MockData.mockPostComment.first!, postCommentUser: MockData.users.first!)
    }
}

