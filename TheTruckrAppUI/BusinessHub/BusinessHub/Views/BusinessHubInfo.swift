//
//  BusinessHubInfo.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 12/20/24.
//

import SwiftUI

struct BusinessHubInfo: View {
    @State private var showBusinessEmailPage = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            //MARK: Image
            //TODO: Need to Find a Better Picture
            HStack {
                Spacer()
                Image(systemName: "cart.fill")
                    .resizable()
                    .frame(width: 155, height: 125)
                Spacer()
            }
            
            VStack {
                Text("Unlock ordering and delivery perks with \(AppConstants.appNameUpperCase) for Business")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text("Enjoy the benefits of \(AppConstants.appName), reimaged for business.  Get started to see if your organization offers travel and/or delievery benefits through \(AppConstants.appName) for Business, or create a new account.")
                    .font(.subheadline)
                    .multilineTextAlignment(.leading)
                    .padding(.top, 18)
            }
            .padding(.horizontal,3)
            .padding(.bottom, 10)
            
            HStack {
                Image(systemName: "suitcase.fill")
                    .resizable()
                    .frame(width: 25, height: 25)
                
                
                VStack(alignment: .leading) {
                    Text("Exclusing ride option")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .padding(.bottom, 4)
                    
                    Text("Designed for business with, \(AppConstants.appName) Business Confort inclues features built to help minimize wait times and maximize productivity such as priority pickup, top-rated drivers, GPS tracking, and more. ")
                        .font(.footnote)
                }
                .padding(.horizontal, 18)
                .padding(.vertical, 5)
            }
            
                Divider()
                
            HStack {
                Image(systemName: "document.fill")
                    .resizable()
                    .frame(width: 25, height: 25)
                
                
                VStack(alignment: .leading) {
                    Text("Seamless expensing")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .padding(.bottom, 4)
                    
                    Text("Save valuable time with automatic receipt uploads through expense integrations. Submitting an expense.")
                        .font(.footnote)
                }
                .padding(.horizontal, 18)
                .padding(.vertical, 15)
            }
            Button {
                showBusinessEmailPage = true
            } label: {
                Text("Get Started")
                    .frame(width: SizeConstants.cardWidth-20,
                           height: 30,
                           alignment: .center)
            }
            .buttonStyle(BorderedProminentButtonStyle())
            .tint(.secondary)
            
            Button {
                
            } label: {
                Text("I have Pin Code")
                    .frame(width: SizeConstants.cardWidth - 20,
                           height: 30,
                           alignment: .center)
            }
            .buttonStyle(PlainButtonStyle())
            
        }
        .padding()
        .navigationTitle(Text("Business Hub"))
        .sheet(isPresented: $showBusinessEmailPage, content: { BusinessHubEmailView() })
    }
}

#Preview {
    NavigationStack {
        BusinessHubInfo()
            .preferredColorScheme(.dark)
    }
}
