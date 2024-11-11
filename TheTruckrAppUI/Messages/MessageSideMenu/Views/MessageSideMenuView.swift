//
//  MessageSideMenuView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 5/15/23.
//

import SwiftUI
import Kingfisher

struct MessageSideMenuView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        if let user = UserService.shared.currentUser {
            let abbreviatedName = initials(from: user.fullname)
            
            VStack(alignment: .leading, spacing: 4) {
                VStack(alignment: .leading) {
                    NavigationLink {
                        ProfileView(user: user)
                    } label: {
                        if user.profileImageUrl == "" {
                            ZStack {
                                Circle()
                                    .frame(width: 125, height: 125, alignment: .leading)
                                    .foregroundColor(.gray)
                                Text(abbreviatedName!)
                                    .font(.title)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                            }
                        } else {
                            KFImage(URL(string: user.profileImageUrl!))
                                .resizable()
                                .frame(width: 125, height: 125)
                                .scaledToFill()
                                .clipShape(Circle())
                        }
                    }
                    .padding(.leading)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(user.fullname)
                            .font(.headline)
                        
                        Text(user.email)
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    
                    MessageUserStatsView()
                        .padding(.vertical)
                    
                }
                .padding(.leading )
                
                ForEach(MessageSideMenuViewModel.allCases) { viewModel in
                    NavigationLink(value: viewModel) {
                        MessageSideMenuOptionRowView(viewModel: viewModel)
                            .padding(.top, 13)
                    }
                }
                .navigationDestination(for: MessageSideMenuViewModel.self) {
                    viewModel in
                    switch viewModel {
                    case .profile:
                        ProfileView(user: user)
                    case .lists:
                        Text("Lists")
                    case .bookmarks:
                        Text("Bookmarks")
                    case .settings:
                        SettingsView(user: user)
                    case .logout:
                        Text( "Log Out")
                    }
                    Spacer()
                }
            }
            
        }
    }
}
struct MessageSideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MessageSideMenuView()
                .environmentObject(AuthViewModel())
        }
    }
}

