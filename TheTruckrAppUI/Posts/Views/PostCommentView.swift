//
//  PostCommentView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 12/26/23.
//

import SwiftUI

struct PostCommentView: View {
    @ObservedObject var viewModel: PostCommentViewModel
    @EnvironmentObject var authViewModel: AuthViewModel
    @Environment(\.presentationMode) var presentationMode
    
    init(post: Post) {
        self.post = post
        self.viewModel = PostCommentViewModel(post: post)
    }
    
    let post: Post
    
    var body: some View {
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
                        MessageRowView(post: post, user: post.user!)
                    }
                    
                    //MARK: Comments for Post
                    LazyVStack {
                        ForEach(viewModel.postComments) { postComment in
                            CommentRowView(postComment: postComment, postCommentUser: postComment.user!)
                                .padding(.trailing)
                                .padding(.leading)
                        }
                    }
                }
                
                Spacer()
                
                //MARK: New Comment Section
                HStack(alignment: .bottom) {
                    NewCommentRowView(post: post)
                        .frame(height: 100, alignment: .bottom)
                }
            }
        }
        .padding(.trailing)
        .padding(.leading)
    }
}


struct PostCommentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PostCommentView(post: dev2.mockPost)
                .environmentObject(AuthViewModel())
        }
    }
}
