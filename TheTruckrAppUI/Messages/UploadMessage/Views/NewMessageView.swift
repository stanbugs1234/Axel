//
//  NewMessageView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 5/30/23.
//

import SwiftUI
import Kingfisher

struct NewMessageView: View {
    
    @State private var caption = ""
    @EnvironmentObject var authViewModel: AuthViewModel
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel = UploadPostViewModel()
    
    var body: some View {
        
        if let user = UserService.shared.currentUser {
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
                    
                    Text("New Post")
                        .fontWeight(.semibold)
                        .foregroundColor(.themeGreen)
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                    
                    Spacer()
                    
                    Button {
                        viewModel.uploadPost(withCaption: caption)
                    } label: {
                        Text("Post")
                            .bold()
                            .padding(.horizontal)
                            .padding(.vertical, 8)
                            .background(Color.backgroundColor)
                            .foregroundColor(.themeGreen)
                            .clipShape(Capsule())
                    }
                }
                .padding()
                
                HStack(alignment: .top) {
                    KFImage(URL(string: user.profileImageUrl!))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 64, height: 64)
                        .clipShape(Circle())
                    
                    TextArea( "Enter Text For A New Post", text: $caption)
                }
                .padding()
            }
            .onReceive(viewModel.$didUploadPost) { success in
                if success {
                    presentationMode.wrappedValue.dismiss()
                    
                }
            }
        }
    }
}

struct NewMessageView_Previews: PreviewProvider {
    static var previews: some View {
        NewMessageView()
            .environmentObject(AuthViewModel())
    }
}
