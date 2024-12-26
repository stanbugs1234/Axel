//
//  ActivityView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 12/14/24.
//

import SwiftUI

struct ActivityView: View {
    @EnvironmentObject var homeViewModel: HomeViewModel
    @State private var path = NavigationPath()
    @State private var showfilter = false
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Upcoming")
                    .font(.title2)
                    .fontWeight(.semibold)
            }
            
            NavigationLink {
                ReservationTimeSelectView(path: $path )
            } label: {
                HStack {
                    VStack(alignment: .leading) {
                        Text("You have no upcoming trips")
                            .fontWeight(.semibold)
                        
                        HStack {
                            Text("Reserve your truck")
                                .font(.caption)
                            Image(systemName: "arrow.right")
                                .resizable()
                                .frame(width: 10, height: 10)
                        }
                    }
                    .padding()
                    
                    Spacer()
                    VStack {
                        Image("CalendarImage")
                            .resizable()
                            .scaledToFill()
                            .frame(width: ButtonSize.large.iconSize, height: ButtonSize.large.iconSize)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                    
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.secondary, lineWidth: 1.5)
                        .frame(width: SizeConstants.cardWidth)
                    
                )
            }
            .padding(.top, 20)
            
            
            //MARK: Past
            //TODO: ViewModel to pull Past Activity
            HStack {
                Text("Past")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Spacer()
                
                Button {
                    showfilter.toggle()
                } label: {
                    Image(systemName: "slider.horizontal.3")
                }
                .sheet(isPresented: $showfilter) {
                    ActivityFilterView()
                        .presentationDetents([.height(300), .medium, .large])
                        .presentationDragIndicator(.automatic)
                }
            }
            .padding(.top, 25)
            
            Text("You don't have any recent activity")
                .padding(.top)
            
            Spacer()
        }
        .foregroundStyle(.primary)
        .padding()
        .navigationBarTitle("Activity")
    }
}

#Preview {
    NavigationStack {
        ActivityView()
            .preferredColorScheme(.dark)
            .environmentObject(HomeViewModel())
    }
}
