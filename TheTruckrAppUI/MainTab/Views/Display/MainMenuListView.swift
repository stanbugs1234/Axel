//
//  MainMenuListView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 11/13/24.
//

import SwiftUI

struct MainMenuListView: View {
    @State var photo = Photo()
    
    var body: some View {
        VStack {
            //MARK: Main Menu Text
            Text("Main Menu")
                .font(.headline)
                .fontWeight(.semibold)
                .padding(.top)
            
            //MARK: Option List
            ScrollView(showsIndicators: false) {
                ForEach(MainHomeTabViewModel.allCases) { viewModel in
                    NavigationLink(value: viewModel) {
                        MainListButtonView(viewModel: viewModel, size: .small)
                    }
                }
            }
            .navigationDestination(for: MainHomeTabViewModel.self) { viewModel in
                switch viewModel {
                case .scheduleTrucks:
                    StartTripView()
                case .yourTips:
                    TripListView()
                case .invoices:
                    InvoiceListView()
                case .map:
                    HomeView()
                case .drivers:
                    ExploreView()
                case .trucks:
                    OrderListView(viewModel: OrderViewModel())
                case .tickets:
                    TicketListView(user: UserService.shared.currentUser!, photo: photo)
                case .jobs:
                    JobListView()
                case .orders:
                    OrderListView(viewModel: OrderViewModel())
                case .contacts:
                    ContactListView()
                case .customers:
                    CustomerListView()
                case .vendors:
                    VendorListView()
                case .products:
                    ProductListView()
                case .camera:
                    CameraView()
                }
            }
        }
    }
}

#Preview {
    MainMenuListView()
}
