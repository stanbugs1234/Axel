//
//  UpdatedHomeView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 4/29/23.
//

import SwiftUI

struct MainHomeView: View {
    @State private var isActive = false
    @State private var showMenu = false
    @State private var path = NavigationPath()
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 100))
    ]
    
    @StateObject var mainHomeViewModel = GreetingViewModel()
    
    @State var photo = Photo()
    @State private var searchText = ""
    
    var body: some View {
        if let user = UserService.shared.currentUser {
            NavigationStack(path: $path) {
                Group {
                    //MARK: Search Bar
                    VStack(alignment: .leading) {
                        //TODO: See If I like the Search Bar removed.  Remvoing because it wasn't tied to anything and taking up space as of 6-12-24
                        //                    SearchBarView(text: $searchText)
                        //                        .padding()
                        
                        ScrollView(showsIndicators: false) {
                            VStack(alignment: .center) {
                                //MARK: Greeting
                                GreetingView(user: user,
                                             viewModel: mainHomeViewModel)
                                .padding(.top, 30)
                                
                                //MARK: Horizontal Scroll
                                HStack {
                                    Text("What do you want to do today")
                                        .padding(.leading, 80)
                                    Spacer()
                                }
                                
                                //                                ScrollView(.horizontal, showsIndicators: true) {
                                //                                    HStack {
                                //                                        ForEach(MainHomeNewsRowViewModel.allCases) { viewModel in
                                //                                            NavigationLink(value: viewModel) {
                                //                                                MainHomeNewsRowView(viewModel: viewModel, size: .xSmall)
                                //                                                    .padding(.vertical)
                                //                                                    .padding(.leading)
                                //                                                    .padding(.trailing)
                                //                                            }
                                //                                            .navigationDestination(for: MainHomeNewsRowViewModel.self) { viewModel in
                                //                                                switch viewModel {
                                //                                                case .trucks :
                                //                                                    TruckView()
                                //                                                case .invoice:
                                //                                                    ReservationTimeSelectView(path: $path)
                                //                                                case .schedule:
                                //                                                    ReservationTimeSelectView(path: $path)
                                //                                                }
                                //                                            }
                                //                                        }
                                //                                    }
                                //                                }
                                //
                                //                                Divider()
                                //
                                //                                //MARK: Main Grid View
                                //                                MainMenuListView()
                                //                            }
                                //                        }
                                //                        .padding(.bottom)
                                //                        .toolbar {
                                //                            ToolbarItem(placement: .navigationBarLeading) {
                                //                                NavigationLink(value: Route.profile(user)) {
                                //                                    CircularProfileImageView(user: user, size: .small)
                                //                                }
                                //                            }
                                //                        }
                                //                    }
                                //                    .navigationDestination(for: Route.self, destination: { route in
                                //                        switch route {
                                //                        case .profile(let user):
                                //                            AccountView(user: user)
                                //                        case.chatView(let user):
                                //                            ChatView(user: user)
                                //                        }
                                //                    })
                                //                    .navigationTitle("\(AppConstants.appNameUpperCase)")
                                //                    .navigationBarTitleDisplayMode(.inline)
                                //                }
                                //            }
                            }
                        }
                    }
                }
            }
        }
    }
}

                    struct MainHomeView_Previews: PreviewProvider {
                        static var previews: some View {
                            NavigationStack{
                                MainHomeView()
                                    .environmentObject(HomeViewModel())
                                    .preferredColorScheme(.dark)
                                
                            }
                        }
                    //MARK: Grid View - Main Button View
                    //extension MainHomeView {
                    //    var gridView: some View {
                    //        VStack {
                    //            Text("Main Menu")
                    //                .font(.headline)
                    //                .fontWeight(.semibold)
                    //                .padding(.top)
                    //
                    //            //option list
                    //            ScrollView(showsIndicators: false) {
                    //                LazyVGrid(columns: adaptiveColumns) {
                    //                    ForEach(MainHomeTabViewModel.allCases) { viewModel in
                    //                        NavigationLink(value: viewModel) {
                    //                            MainButtons(viewModel: viewModel, size: .xSmall)
                    //                                .padding()
                    //                                .padding(.top, 3)
                    //                        }
                    //                    }
                    //                }
                    //            }
                    //            .navigationDestination(for: MainHomeTabViewModel.self) { viewModel in
                    //                switch viewModel {
                    //                case .scheduleTrucks:
                    //                    StartTripView()
                    //                case .yourTips:
                    //                    TripListView()
                    //                case .invoices:
                    //                    InvoiceListView()
                    //                case .map:
                    //                    HomeView()
                    //                case .drivers:
                    //                    ExploreView()
                    //                case .trucks:
                    //                    OrderListView(viewModel: OrderViewModel())
                    //                case .tickets:
                    //                    TicketListView(user: UserService.shared.currentUser!, photo: photo)
                    //                case .jobs:
                    //                    JobListView()
                    //                case .orders:
                    //                    OrderListView(viewModel: OrderViewModel())
                    //                case .contacts:
                    //                    ContactListView()
                    //                case .customers:
                    //                    CustomerListView()
                    //                case .vendors:
                    //                    VendorListView()
                    //                case .products:
                    //                    ProductListView()
                    //                case .camera:
                    //                    CameraView()
                    //                }
                    //            }
                    //        }
                    //    }
                    //}
                    //
                }

