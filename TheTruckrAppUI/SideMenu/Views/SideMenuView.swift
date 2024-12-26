//
//  SideMenuView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 4/14/23.
//

import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift
import Kingfisher

struct SideMenuView: View {
    @State private var isAvailbleToWork = false
    private let user: User
    private var photo = Photo()

    init(user: User) {
        self.user = user
    }
    
    var body: some View {
        let abbreviatedName = initials(from: user.fullname)
//        NavigationView{
            VStack(alignment: .leading, spacing: 30) {
                NavigationLink {
                    ProfileView(user: user)
                } label: {
                    //header view
                    VStack(alignment: .leading, spacing: 32){
                        //user info
                        if user.profileImageUrl == "" {
                            ZStack {
                                Circle()
                                    .frame(width: 64, height: 64, alignment: .leading)
                                    .foregroundColor(.gray)
                                Text(abbreviatedName!)
                                    .font(.title)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                            }
                            } else {
                                    KFImage(URL(string: user.profileImageUrl!))
                                        .resizable()
                                        .frame(width: 64, height: 64)
                                        .scaledToFill()
                                        .clipShape(Circle())
                            }
                        }
                    .padding(.leading)
                    
                            VStack(alignment: .leading, spacing: 8){
                                Text(user.fullname)
                                    .font(.system(size: 16, weight: .semibold))
                                    
                                
                                Text(user.email)
                                    .font(.system(size: 14))
                                // .accentColor(Color.theme.primaryTextColor)
                                    .accentColor(.black)
                                    .opacity(0.77)
                            }
                            .foregroundColor(.themeGreen)
                        }
                    
                
                //Become a Driver

                VStack(alignment: .leading, spacing: 20) {
                    Text("Do more with your account")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    
                    if user.accountType == .dispatcher {
                        HStack{
                            Image(systemName: "dollarsign.square")
                                .font(.title2)
                                .imageScale(.medium)
                            
                            NavigationLink{
                                EnrollAsDriverView()
                            } label: {
                                Text("Enroll as a Driver")
                                    .font(.system(size: 16, weight: .semibold))
                                    .padding(6)
                            }
                            .foregroundColor(.themeGreen)
                        }
                        
                        HStack {
                            Image(systemName:
                                    "person")
                            .font(.title2)
                            .imageScale(.medium)
                            
                            Text("Drivers")
                                .font(.system(size: 16, weight: .semibold))
                                .padding(6)
                        }
                        .foregroundColor(.themeGreen)
                        
                    } else {
                        NavigationLink {
                            CameraView()
                        } label: {
                            HStack {
                                Image(systemName: "camera")
                                .font(.title2)
                                .imageScale(.medium)
                                
                                Text("Upload Ticket")
                                    .font(.system(size: 16, weight: .semibold))
                                    .padding(6)
                            }
                        }
                        .foregroundColor(.themeGreen)
                        
                        HStack{
                            Image(systemName: "steeringwheel")
                                .imageScale(.large)
                            
                            Text("Available to Work")
                                .font(.system(size: 16, weight: .semibold))
                                .padding(6)
                            
                            Toggle("Available to Work", isOn: $isAvailbleToWork)
                                .labelsHidden()
                        }
                        .foregroundColor(.themeGreen)
                    }
                    
                    Rectangle()
                        .frame(width: 296, height: 0.75)
                        .opacity(0.7)
                        .foregroundColor(Color(.separator))
                        .shadow(color: .black.opacity(0.7), radius:4 )
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
                
                //option list
                VStack(alignment: .leading, spacing: 18) {
                    ForEach(SideMenuOptionViewModel.allCases) { viewModel in
                        NavigationLink(value: viewModel) {
                            SideMenuOptionView(viewModel: viewModel)
                                .padding(.top, 13)
                        }
                    }
                }
                .navigationDestination(for: SideMenuOptionViewModel.self) { viewModel in
                    switch viewModel {
                    case .home:
                        UpdatedHomeView()
                    case .trips:
                        Text("Trips")
                    case .tickets:
                        TicketListView(user: user, photo: Photo())
                    case .drivers:
                        UserView()
                    case .trucks:
//                        TruckRowView(user: user)
                        Text("Truck View")
                    case .wallet:
                        Text("Wallet")
                    case .customers:
                        CustomerListView()
                    case.settings:
                        SettingsView(user: user)
                    case .messages:
                        FeedView()
                    }
                }
                .padding(5)
            }
            .background(Color(.systemBackground))
//        }
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            SideMenuView(user: dev2.mockUser)
        }
    }
}
