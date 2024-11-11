//
//  NewCommentRowView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 12/29/23.
//

import SwiftUI
import Kingfisher

struct NewCommentRowView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var caption = ""
    @EnvironmentObject var authViewModel: AuthViewModel
    @ObservedObject var viewModel = UploadPostViewModel()
    
    let post: Post
    
    var body: some View {
        //MARK: Comment & User Profile Image
        if let user = UserService.shared.currentUser {
            let abbreviatedName = initials(from: user.fullname)
            HStack(alignment: .top) {
                CircularProfileImageView(user: user, size: .small)
                    
                    //MARK: Comment Text Area
                    TextArea( "Enter A Comment as \(user.fullname)", text: $caption)
                        .multilineTextAlignment(.leading)
                    
                    //MARK: Send Comment
                    Button {
                        viewModel.uploadComment(withCaption: caption, postId: post.id!, userFullName: user.fullname, userURL: user.profileImageUrl ?? "")
                    } label: {
                        Image(systemName: "arrowshape.turn.up.right.circle.fill")
                            .resizable()
                            .frame(width: 35, height: 35)
                    }
                    .foregroundColor(.themeGreen)
                
            }
            .padding(.top, 4)
            .onReceive(viewModel.$didUploadComment) { success in
                if success {
                    presentationMode.wrappedValue.dismiss()
                }
            }
//            .onDisappear(perform: PostViewModel.)
        }
    }
}

struct NewCommentRowView_Previews: PreviewProvider {
    static var previews: some View{
        NavigationView{
            NewCommentRowView(post: dev2.mockPost)
                .environmentObject(AuthViewModel())
        }
    }
}
