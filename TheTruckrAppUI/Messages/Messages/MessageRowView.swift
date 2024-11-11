//
//  MessageRowView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 4/26/23.
//

import SwiftUI
import Kingfisher
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

struct MessageRowView: View {
    @ObservedObject var viewModel: MessageRowViewModel
    @ObservedObject var ratingViewModel: RatingViewModel
    @State private var showNewCommentView = false
    @State private var showPostCommentsView = false
    
    let user: User
    
    init(post: Post, user: User) {
        self.viewModel = MessageRowViewModel(post: post)
        self.ratingViewModel = RatingViewModel(user: user)
        self.user = user
    }
    
    var body: some View {
        if let user = viewModel.post.user {
            VStack(alignment: .leading) {
                HStack{
                    //MARK: Profile Image &/ Appreciated Name Circle
                    NavigationLink {
                        ProfileView(user: user)
                    } label: {
                        CircularProfileImageView(user: user, size: .medium)
                    }
                    
                    //User Info & Message Caption
                    
                    //MARK: User Info
                    if let user = viewModel.post.user {
                        HStack {
                            VStack(alignment: .leading, spacing: 2) {
                                HStack{
                                    //MARK: User Full Name
                                    Text(user.fullname)
                                        .font(.subheadline).bold()
                                        .padding(.bottom, 4)
                                        .padding(.trailing, 5)
                                        .foregroundColor(.themeGreen)
                                    
                                    //MARK: User Rating
                                    Text(ratingViewModel.averageUserRating(uid: user.uid!))
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                    
                                    Image(systemName: "star.fill")
                                        .resizable()
                                        .frame(width: 8, height: 8)
                                        .scaledToFill()
                                        .foregroundColor(.yellow)
                                }
                                .padding(.top, 8)
                                
                                //MARK: User Email
                                Text("@\(user.email)")
                                    .foregroundColor(.gray)
                                    .font(.caption)
                            }
                            .padding(10)
                            
                            Spacer()
                            
                            Spacer()
                            
                            //MARK: Timestamp
                            Text(viewModel.post.timestamp.dateValue().formatted(date: .numeric, time: .shortened))
                                .foregroundColor(.secondary)
                                .font(.caption)
                        }
                        
                        Spacer()
                    }
                }
                
                //MARK: Comments
                HStack {
                    Text("\(viewModel.post.likes)")
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .padding(.trailing, -6)
                    
                    Image(systemName: viewModel.post.didLike ?? false ? "heart.fill" : "heart")
                        .font(.subheadline)
                        .foregroundColor(viewModel.post.didLike ?? false ? .red : .gray)
                    
                    Spacer()
                    
                    Button {
                        showPostCommentsView.toggle()
                        
                    } label: {
                        Text("\(viewModel.postCommmentCount)")
                            .font(.caption)
                            .foregroundColor(.secondary)
                        
                        Text("Comments")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    
                    //MARK: Share Button
                    Button {
                        viewModel.sharePost()
                    } label: {
                        Text("2 Shares")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
                .padding(.top, 3)
                
                //MARK: Message Caption
                HStack {
                    Text(viewModel.post.caption)
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                }
                .padding(.top, 10)
                .padding(.bottom)
                
                //MARK: Action Buttons
                
                //MARK: Comment View
                HStack{
                    Button {
                        showPostCommentsView.toggle()
                    } label: {
                        Image(systemName: "bubble.left")
                            .font(.subheadline)
                        Text("Comment")
                            .font(.footnote)
                    }
                    
                    Spacer()
                    
                    Button {
                        viewModel.post.didLike ?? false ?
                        viewModel.unlikePost() :
                        viewModel.likePost()
                        
                    } label: {
                        Image(systemName: viewModel.post.didLike ?? false ? "heart.fill" : "heart")
                            .font(.subheadline)
                            .foregroundColor(viewModel.post.didLike ?? false ? .red : .gray)
                        Text("Like")
                            .font(.caption)
                    }
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        SharePostView(post: viewModel.post)
                    }, label: {
                        Image(systemName: "arrowshape.turn.up.right")
                            .font(.subheadline)
                        Text("Share")
                            .font(.footnote)
                    })
                }
                .foregroundColor(.gray)
                .padding(.bottom, 1)
                
                Divider()
            }
            
            .fullScreenCover(isPresented: $showNewCommentView /*onDismiss: viewModel.fetchPosts*/) {
                NewCommentView(post: viewModel.post)
            }
            
            .fullScreenCover(isPresented: $showPostCommentsView /*onDismiss: viewModel.fetchPosts*/) {
                PostCommentView(post: viewModel.post)
            }
        }
    }
}

struct MessageRowView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            MessageRowView(post: dev2.mockPost, user: dev2.mockUser)
        }
    }
}
