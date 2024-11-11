//
//  UserDetailView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 4/25/23.
//

import SwiftUI
import Kingfisher

struct UserDetailView: View {
    @ObservedObject var ratingViewModel: RatingViewModel
    
    let user: User
    
    init(user: User) {
        self.user = user
        self.ratingViewModel = RatingViewModel(user: user)
    }
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    NavigationLink(value: Route.profile(user)) {
                        CircularProfileImageView(user: user, size: .xxLarge)
                    }
                }
                .foregroundColor(.themeGreen)
                
                HStack(spacing: 5) {
//                    Text(user.fullname)
//                        .font(.headline)
//                        .fontWeight(.semibold)
//                        .foregroundColor(.themeGreen)
//                        .padding(.trailing)
                    
                    HStack {
                        Text(ratingViewModel.averageUserRating(uid: user.uid ?? ""))
                            .font(.footnote)
                        
                        Image(systemName: "star.fill")
                            .resizable()
                            .frame(width: 10, height: 10)
                            .scaledToFit()
                            .foregroundColor(.yellow)
                    }
                }
                .padding(.bottom, 2)
                
                HStack {
                    Text(user.email)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
            .padding()
            
            Spacer()
            
            //MARK: Option List
            VStack {
                List(UserDetailViewModel.allCases) { viewModel in
                    NavigationLink(value: viewModel) {
                        UserDetailOptionView(viewModel: viewModel)
                            .padding(.top, 13)
                    }
                }
            }
            .foregroundColor(.themeGreen)
        }
        .navigationTitle("\(user.fullname) Details")
        .navigationBarTitleDisplayMode(.inline)
        .navigationDestination(for: Route.self, destination: { route in
            switch route {
            case .profile(let user):
                ProfileView(user: user)
            case.chatView(let user):
                ChatView(user: user)
            }
        })
//        .navigationDestination(for: User.self, destination: { user in
//            ProfileView(user: user)
//        })
        .navigationDestination(for: UserDetailViewModel.self) { viewModel in
            switch viewModel {
//            case .home:
//                MainHomeView()
            case .trips:
                Text("Trips")
            case .tickets:
                Text("Tickets")
            case .invoices:
                DriverRatingView(user: user)
            case .scheduleTrip:
                ScheduleTripView()
            case .messages:
                ChatView(user: user)
            case .trucks:
                Text("Trucks")
            case .assignTruck:
                Text("Assign Driver to Truck")
            case .profile:
                ProfileView(user: user)
            case .info:
                Text("User Info")
            }
        }
    }
}


struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            UserDetailView(user: dev2.mockUser)
        }
    }
}
