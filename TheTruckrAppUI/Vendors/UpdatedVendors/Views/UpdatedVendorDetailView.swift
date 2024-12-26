//
//  UpdatedVendorDetailView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 12/19/24.
//

import SwiftUI
import Kingfisher

struct UpdatedVendorDetailView: View {
    @EnvironmentObject var updatedViewModel: UpdatedHomeViewModel
    @ObservedObject var vendorViewModel: VendorRowViewModel
    @State var showOptionView = false
    
    let vendor: Vendor
    
    init(vendor: Vendor) {
        self.vendorViewModel = VendorRowViewModel(vendor: vendor)
        self.vendor = vendor
    }
    
    var body: some View {
        ScrollView {
            //MARK: Company Image
            ZStack {
                HStack {
                    KFImage(URL(string: vendor.vendorProfileImageUrl ?? ""))
                        .resizable()
                        .frame(width: SizeConstants.cardWidth + 20,
                               height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                
                //MARK: ZStack Buttons
                HStack {
                   
                    Spacer()
                    
                    //MARK: Like Button
                    Button {
                        vendorViewModel.vendor.didLike ?? false ?
                        vendorViewModel.unlikeVendor() :
                        vendorViewModel.likeVendor()
                    } label: {
                        Image(systemName: vendorViewModel.vendor.didLike ?? false ? "heart.circle.fill" : "heart.circle")
                            .resizable()
                            .fontWeight(.bold)
                            .frame(width: 35,
                                   height: 35)
                            .font(.subheadline)
                            .foregroundColor(vendorViewModel.vendor.didLike ?? false ? .red : .gray)
                    }
                    
                    Button {
                        showOptionView.toggle()
                    } label: {
                        Image(systemName: "ellipsis.circle.fill")
                            .resizable()
                            .fontWeight(.bold)
                            .frame(width: 35,
                                   height: 35)
                            .foregroundStyle(Color.gray)
                    }
                }
                .padding(.bottom, 140)
                .padding(.horizontal, 25)
            }
            
            //MARK: Vendor Name
            Text(vendor.vendorFullName)
                .font(.title2)
                .fontWeight(.semibold)
            
            //MARK: Vendor Rating
            HStack {
                Text("4.4")
                
                Image(systemName: "star")
                    .resizable()
                    .frame(width: 15,
                           height: 15)
                
                Text("(9000+ratings)")
            }
            .padding(.top, -8)
            .font(.subheadline)
            
            //MARK: Vendor Address
            Text(vendor.vendorAddressName)
                .font(.subheadline)
                .fontWeight(.semibold)
                .padding(.top, 3)
            
            //MARK: Delivery/Pick Up Buttons
            UpdatedVendorActionButtonsView()
                .padding(.vertical, 5)
                .padding(.horizontal)
            
            //MARK: Fee & Delivery Time
            HStack {
                VStack {
                    Text("$0 Delivery Fee")
                    
                    Text("Pricing and Fees")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
                .font(.subheadline)
                .padding(.horizontal)
                
                VStack {
                    Rectangle()
                        .frame(width: 2, height: 40)
                        .foregroundStyle(.secondary)
                }
                .padding(.horizontal)
                
                VStack {
                    Text("25 min")
    
                    Text("Earliest arrival")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
                .font(.subheadline)
                .padding(.horizontal)
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 30)
            .font(.subheadline)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.secondary, lineWidth: 0.5)
                    .frame(width: SizeConstants.cardWidth)
            )
            //MARK: Offer
            
            //MARK: Featured Services
            VendorServicesRowView(vendor: vendor)
                .padding(.top, 15)
        }
        .sheet(isPresented: $showOptionView) {
            NavigationStack {
                UpdatedVendorOptionMenuView(vendor: vendor)
                    .presentationDetents([.height(300), .medium, .large])
                    .presentationDragIndicator(.automatic)
            }
        }
        //        .navigationTitle(Text("Updated Vendor Detail"))
    }
}

#Preview {
    NavigationStack {
        UpdatedVendorDetailView(vendor: MockData.vendors[0])
            .preferredColorScheme(.dark)
            .environmentObject(UpdatedHomeViewModel())
    }
}
