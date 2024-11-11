//
//  AccountView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 5/20/23.
//

import SwiftUI
import Kingfisher
import PhotosUI

struct AccountView: View {
    @StateObject var viewModel = AccountViewModel()
    @ObservedObject var ratingViewModel: RatingViewModel
    @State private var showImagePicker = false
    @State private var showEditAccountInfoView = false
    
    let user: User
    
    init(user: User) {
        self.user = user
        self.ratingViewModel = RatingViewModel(user: user)
    }
    
    var body: some View {
        VStack {
            //MARK: Circular Image/Initials
            PhotosPicker(selection: $viewModel.selectedItem) {
                CircularProfileImageView(user: user, size: .xxxLarge)
                    .padding(.bottom, 2)
            }
            VStack {
                HStack {
                    Text(user.fullname)
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    //MARK: Rating
                    //TODO: See if this worked
                    UserRatingStatView(user: user)
//                    Text(ratingViewModel.averageUserRating(uid: user.uid!))
//                        .font(.caption)
//                    
//                    Image(systemName: "star.fill")
//                        .renderingMode(.template)
//                        .resizable()
//                        .scaledToFill()
//                        .frame(width: 10, height: 10)
//                        .foregroundColor(.yellow)
                }
                
                Text(user.email)
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(.secondary)
  
                HStack {
                    Text("Account Type: ")
                        .fontWeight(.semibold)
                    
                    user.accountType == .driver ? Text("Driver") : Text("Dispatcher")
                }
                .padding(.top, 1)
                .font(.subheadline)
            }
            
            HStack {
                Spacer()
                Button {
                    showEditAccountInfoView.toggle()
                } label: {
                    ButtonView(size: .medium, buttonString: "Edit Profile")
                }
                .fullScreenCover(isPresented: $showEditAccountInfoView) {
                    EditProfileView(user: user)
                }
                
                Spacer()
            }
            .padding()
            
            HStack {
                optionListAccountView
            }
            
            HStack {
                Spacer()
                
                Button {
                    AuthService.shared.signOut()
                } label: {
                    ButtonView(size: .medium, buttonString: "Log Out")
                }
                
                Spacer()
            }
        }
        
        .padding(.top)
        .navigationDestination(for: AccountOptionsViewModel.self) { viewModel in
            switch viewModel {
            case .profile:
                Text("Profile")
            case .helpAndSupport:
                Text("Help and Support")
            case .about:
                Text("about")
            case .logout:
                Text("LOG OUT")
            }
        }
        .navigationDestination(for: Route.self, destination: { route in
            switch route {
            case .profile(let user):
                AccountView(user: user)
            case.chatView(let user):
                ChatView(user: user)
            }
        })
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            AccountView(user: dev2.mockUser)
                .environmentObject((MainTabHomeViewModel()))
        }
    }
}

extension AccountView {
    var optionListAccountView: some View {
        List{
            ForEach(AccountOptionsViewModel.allCases) {
                viewModel in
                NavigationLink(value: viewModel) {
                    AccountOptionView(viewModel: viewModel)
                }
            }
        }
    }
}
