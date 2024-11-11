//
//  SettingsView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 4/14/23.
//

import SwiftUI
import Kingfisher

struct SettingsView: View {
     let user: User

//    init(user: User){
//        self.user = user
//    }
    
    var body: some View {
        Form {
            List {
                Section("User Information") {
                    //User Info Header
                    HStack {
                        NavigationLink {
                            AccountView(user: user)
                        } label: {
                            CircularProfileImageView(user: user, size: .large)
                            
                            VStack(alignment: .leading, spacing: 8){
                                Text(user.fullname)
                                    .font(.system(size: 16, weight: .semibold))
                                
                                Text(user.email)
                                    .font(.system(size: 14))
                                // .accentColor(Color.theme.primaryTextColor)
                                    .accentColor(.black)
                                    .opacity(0.77)
                            }
                            .padding(.leading)
                        }
                        
                        Spacer()
                        
                    }
                }
                
                Section("Favorites") {
                    //MARK: Favorites
                    ForEach(SavedLocatationViewModel.allCases) { viewModel in
                        NavigationLink {
                            SavedLocationSearchView(config: viewModel)
                        }   label: {
                            SavedLocationRowView(viewModel: viewModel, user: user)
                        }
                    }
                }
                
                //MARK: Notifications
                Section("Settings") {
                    NavigationLink {
                        NotificationView(friendViewModel: FriendRequestViewModel())
                    } label: {
                        SettingsRowView(imageName: "bell.circle.fill",
                                        title: "Notifications",
                                        tintColor: Color(.systemYellow))
                    }

                    //MARK: Payment Methods
                    NavigationLink {
                        Text("Payment Methods")
                    } label: {
                        SettingsRowView(imageName: "creditcard.circle.fill",
                                        title: "Payment Methods",
                                        tintColor: Color(.systemPurple))
                    }
                }
                
                //MARK: Enroll as a Driver
                Section("Account") {
                    if user.accountType == .dispatcher {
                        //MARK: Enroll as a Driver
                        //Need to set up the Enroll as a Driver page
                        NavigationLink {
                            RegisterAsDriverView()
                        } label: {
                            SettingsRowView(imageName:"dollarsign.circle.fill",
                                            title: "Enroll as a Driver",
                                            tintColor: Color(.systemGreen))
                        }
                    } else {
                        //MARK: Deactivate as a Driver
                        NavigationLink {
                            Text("Deactivate Driver Account")
                        } label: {
                            SettingsRowView (imageName: "location.slash.circle.fill",
                                             title: "Deactivate Driver Account",
                                             tintColor: Color(.systemTeal))
                        }
                    }
                    
                    //MARK: Sign Out
                    SettingsRowView(imageName: "arrow.left.circle.fill",
                                    title: "Sign Out",
                                    tintColor: Color(.systemRed))
                    .onTapGesture {
//                        viewModel.signout()
                        AuthService.shared.signOut()
                        
                    }
                }
            }
        }
        .navigationTitle("Settings")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SettingsView(user: dev2.mockUser)
        }
    }
}
