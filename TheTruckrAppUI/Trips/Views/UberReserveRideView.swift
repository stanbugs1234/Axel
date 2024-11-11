//
//  UberReserveRideView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 11/22/23.
//

import SwiftUI

struct UberReserveRideView: View {
    @State private var dateSelected = Date()
    @StateObject var viewModel = TripsViewModel()
    
    var body: some View {
        VStack {
            VStack{
                //MARK: Title
                Text("Reservations")
                    .font(.title2)
                    .padding(.bottom, 15)
                
                //MARK: Time short hand
                Text(viewModel.dateSelected.formatted(date: .abbreviated, time: .shortened))
                    .font(.title2)
                    .padding(.bottom, 5)
            }
            .padding(.bottom,15)
            
            //MARK: Date Picker
            DatePicker("Please Enter a Date", selection: $viewModel.dateSelected, in: Date()...)
                .datePickerStyle(.wheel)
                .labelsHidden()
                .padding(.bottom, 45)
            
            //MARK: Info Regarding Reserving a Trip
            VStack {
                HStack {
                    Image(systemName: "calendar.badge.clock")
                        .resizable()
                        .frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    
                    Text("Choose your exact pickup time up to 90 days in advance")
                        .padding(.leading)
                    
                    Spacer()
                    
                }
                .padding(.bottom, 35)
                
                HStack {
                    Image(systemName: "person.badge.clock.fill")
                        .resizable()
                        .frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    
                    Text("Extra wait time included to meet your ride")
                        .padding(.leading)
                    
                    Spacer()
                }
                .padding(.bottom, 35)
                
                HStack {
                    Image(systemName: "location.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    
                    Text("Able to track you load from pickup to final destination")
                        .padding(.leading)
                    Spacer()
                }
                .padding(.bottom, 35)
                
                Spacer()
                
                HStack {
                    NavigationLink {
                        UberReserveRideView2(locationViewModel: LocationSearchViewModel(), tripViewModel: viewModel, config: SavedLocatationViewModel.home )
                    } label: {
                        ButtonView(size: .medium, buttonString: "Next")
                    }
                }
            }
        }
        .padding()
        .font(.subheadline)
    }
}

#Preview {
    NavigationView {
        UberReserveRideView()
    }
}
