//
//  UpdatedHomeView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 12/13/24.
//

import SwiftUI

struct UpdatedHomeView: View {
    @State private var searchText = ""
    @State private var showAddressPicker = false
    @State private var showDeliveryType = false
    @EnvironmentObject var viewModel: HomeViewModel
    @EnvironmentObject var updatedHomeViewModel : UpdatedHomeViewModel
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            HStack {
                //MARK: Delivery Location
                VStack(alignment: .leading) {
                    Text("Deliver now")
                        .font(.footnote)
                        .padding(.vertical, -2)
                    
                    //MARK: User Current Address
                    NavigationLink {
                        DeliverNowAddressPicker()
                    } label: {
                        HStack {
                            Text(viewModel.userAddress?.description ?? "Current Location")
                                .multilineTextAlignment(.leading)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                            
                            Image(systemName:"chevron.compact.down")
                                .resizable()
                                .frame(width: ButtonSize.xSmall.iconSize, height: ButtonSize.xxSmall.iconSize)
                                .padding(.leading, 3)
                        }
                        
                    }
                    .foregroundStyle(.primary)
                }
                
                Spacer()
                
                //MARK: Delivery
                Button {
                    showDeliveryType.toggle()
                } label: {
                    HStack {
                        Text(updatedHomeViewModel.deliveryOption.title)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        
                        Image(systemName:"chevron.compact.down")
                            .resizable()
                            .frame(width: ButtonSize.xSmall.iconSize, height: ButtonSize.xxSmall.iconSize)
                            .padding(.leading, 3)
                    }
                }
                .buttonStyle(PlainButtonStyle())
                
                Spacer()
                
                //MARK: Shopping Cart
                NavigationLink {
                    EmptyShoppingCartView()
                } label: {
                    Image(systemName: "cart")
                        .resizable()
                        .frame(width: ButtonSize.small.iconSize, height: ButtonSize.small.iconSize)
                        .padding(.trailing, 10)
                        .fontWeight(.bold)
                        .foregroundStyle(.opposite)
                }
                
            }
            .padding(.horizontal)
            
            //MARK: Search Bar
            HStack {
                NavigationLink {
                    SearchView()
                } label: {
                    ZStack {
                        SearchBarView(text: $searchText,placementString: "Search \(AppConstants.appName)")
                            .clipShape(.rect(cornerRadius: 25))
                            .padding(.horizontal)
                            .padding(.vertical, 5)
                            .disabled(true)
                    }
                }
            }
            
            //MARK: Category View
            HomeCategoryRowView()
                .padding(.horizontal)
            
            //MARK: Suggestions
            SuggestionView()
                .padding(.top, 8)
            
            //MARK: Featured View
            FeaturedView()
                .padding(.vertical)
                .padding(.bottom, 20)
            
            Divider()
        }
        .navigationTitle(AppConstants.appName)
        .navigationBarTitleDisplayMode(.inline)
        .onReceive(LocationManager.shared.$userLocation) { location in
            if let location = location {
                viewModel.userLocation = location
            }
        }
        .sheet(isPresented: $showDeliveryType) {
            DeliveryOptionsView()
                .presentationDetents([.height(300), .medium, .large])
                .presentationDragIndicator(.automatic)
        }
    }
}

#Preview {
    NavigationStack {
        UpdatedHomeView()
            .preferredColorScheme(.dark)
            .environmentObject(HomeViewModel())
            .environmentObject(UpdatedHomeViewModel())
    }
}
