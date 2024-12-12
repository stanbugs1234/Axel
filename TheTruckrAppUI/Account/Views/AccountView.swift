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
                CurrentUserProfileHeaderView(viewModel: viewModel, user: user)
                VStack {
                    HStack {
                        Text(user.fullname)
                            .font(.title2)
                            .fontWeight(.semibold)
                        
                        //MARK: Rating

                        UserRatingStatView(user: user)
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
                        EditProfileView(viewModel: viewModel,user: user)
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
                    .padding(.bottom)
                    .padding(.top)
                    
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

#Preview {
    NavigationStack {
        AccountView( user: MockData.users.first!)
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
