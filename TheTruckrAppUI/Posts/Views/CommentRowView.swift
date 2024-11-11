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
    
    let postCommentUser: User

    init(postComment: PostComment, postCommentUser: User) {
        self.postCommentUser = postCommentUser
        self.viewModel = CommentRowViewModel(postComment: postComment)
        
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                //MARK: Profile Image &/ Appreciated Name Circle
                NavigationLink {
//                    ProfileView(user: viewModel.postCommentUser!)
                } label: {
                    CircularProfileImageView(user: viewModel.postCommentUser, size: .medium)
                }
                
                //User Info & Message Caption
                
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
                        //MARK: Time Difference
                        Text("25m")
                        
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
                    .font(.subheadline)
                    .padding(.bottom, 1)
                }
                .padding(.leading)
            }
            
            Divider()
        }
    }
}

struct CommentRowView_Previews: PreviewProvider {
    static var previews: some View {
        CommentRowView(postComment: dev2.mockPostComment, postCommentUser: dev2.mockUser)
    }
}
