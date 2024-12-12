//
//  NewCommentView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 12/25/23.
//

import SwiftUI
import Kingfisher

struct NewCommentView: View {
    @State private var caption = ""
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel = UploadPostViewModel()
    
    let post: Post
    
    var body: some View {
        if let user = UserService.shared.currentUser {
            let abbreviatedName = initials(from: user.fullname)
            VStack {
                HStack {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("Cancel")
                            .foregroundColor(.themeGreen)
                            .padding(.horizontal)
                            .padding(.vertical, 8)
                    }
                    
                    Spacer()
                    
//                    Text("Comment")
//                        .fontWeight(.semibold)
//                        .foregroundColor(.themeGreen)
//                        .padding(.horizontal)
//                        .padding(.vertical, 8)
//                    
                    Spacer()
                    
                    Button {
                        viewModel.uploadComment(withCaption: caption, postId: post.id!, userFullName: user.fullname, userURL: user.profileImageUrl ?? "")
                    } label: {
                        Text("Comment")
                            .bold()
                            .padding(.horizontal)
                            .padding(.vertical, 8)
                            .background(Color.backgroundColor)
                            .foregroundColor(.themeGreen)
                            .clipShape(Capsule())
                    }
                }
                .padding()
                
                //MARK: Post to Comment On
                HStack {
                    PostRowView(post: post, user: post.user!)
                        .padding(.bottom)
                }
                
                //MARK: Post Comments

                
                
                //MARK: Comment & User Profile Image
                HStack(alignment: .top) {
                    CircularProfileImageView(user: user, size: .medium)
                    
                    TextArea( "Enter A Comment", text: $caption)
                }
            }
            .padding()
            .onReceive(viewModel.$didUploadComment) { success in
                if success {
                    presentationMode.wrappedValue.dismiss()
                }
            }
        }
    }
}

struct NewCommentView_Previews: PreviewProvider {
    static var previews: some View{
        NavigationView{
            NewCommentView(post: dev2.mockPost)
        }
    }
}
