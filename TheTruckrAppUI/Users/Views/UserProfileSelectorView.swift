//
//  UserProfileSelectorView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 5/30/23.
//

import SwiftUI
import Firebase

struct UserProfileSelectorView: View {
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    @EnvironmentObject var viewModel: AuthViewModel
    
    let user: User
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Button {
                        showImagePicker.toggle()
                    } label: {
                        if let profileImage = profileImage {
                            profileImage
                                .resizable()
                                .modifier(ProfileImageModifier())
                                .clipShape(Circle())
                                .padding(.top, 10)
                        } else {
                            HStack {
                                Image(systemName:"person.crop.rectangle.badge.plus")
                                    .renderingMode(.template)
                                    .resizable()
                                    .modifier(ProfileImageModifier())
                                    .padding(.top, 10)
                                    .padding(.horizontal)
                                
                                Text ("Change Profile Photo")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                            }
                        }
                    }
                    .foregroundColor(.themeGreen)
                }
            }
            
            VStack {
                Button {
                    print("Make URL STRING NIL")
                } label: {
                    HStack {
                        Image(systemName: "person.slash.fill")
                            .renderingMode(.template)
                            .resizable()
                            .modifier(ProfileImageModifier())
                            .padding(.top, 10)
                            .padding(.horizontal)
                        Text ("Remove Profile Picture")
                            .font(.headline)
                            .fontWeight(.semibold)
                    }
                }
                
                Button {
                    showImagePicker.toggle()
                } label: {
                    Image(user.profileImageUrl!)
                        .resizable()
                        .renderingMode(.template)
                        .modifier(ProfileImageModifier())
                        .padding(.top, 10)
                    
                }
            }
        }
        .foregroundColor(.themeGreen)
        .sheet(isPresented: $showImagePicker,
               onDismiss: loadImage) {
            ImagePicker(selectedImage: $selectedImage)
            
            VStack {
                if selectedImage != nil {
                    NavigationLink(destination: {
                        AccountView(user: user)
                    }, label: {
                        ButtonView(size: .medium, buttonString: "Continue")
                            .padding(.top, 25)
                    })
                }
            }
        }
               .padding()
    }
}

private struct ProfileImageModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 100, height: 100)
            .scaledToFill()
            .foregroundColor(.themeGreen)
        
    }
}


struct UserProfileSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileSelectorView(user: dev2.mockUser)
            .environmentObject(AuthViewModel())
    }
}


extension UserProfileSelectorView {
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        profileImage = Image(uiImage: selectedImage)
        viewModel.uploadProfileImage(selectedImage)
    }
}
