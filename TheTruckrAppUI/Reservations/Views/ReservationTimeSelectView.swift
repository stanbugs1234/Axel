//
//  UberReserveRideView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 11/22/23.
//

import SwiftUI

struct ReservationTimeSelectView: View {
    @State private var dateSelected = Date()
    @Binding var path: NavigationPath
    @StateObject var viewModel = ReservationViewModel()
    
    var body: some View {
        VStack {
            VStack{
                //MARK: Title
                Text("Reservations")
                    .fontWeight(.semibold)
                    .font(.title2)
                    .padding(.bottom, 15)
                
                //MARK: Time short hand
                Text(viewModel.dateSelected.formatted(date: .abbreviated, time: .shortened))
                    .font(.title2)
                    .padding(.bottom, 5)
            }
            .padding(.bottom, 15)
            .padding(.top, 15)
            
            //MARK: Date Picker
            DatePicker("Please Enter a Date", selection: $viewModel.dateSelected, in: Date()...)
                .datePickerStyle(.wheel)
                .labelsHidden()
                .padding(.bottom, 45)
            
            
            
            //MARK: Info Regarding Reserving a Trip
            VStack {
                ReservationInfoRowView(
                    image: "calendar.badge.clock",
                    title: "Choose your exact pickup time up to 90 days in advance")
                
                ReservationInfoRowView(
                    image: "person.badge.clock.fill",
                    title: "Extra wait time included to meet your ride")
                
                ReservationInfoRowView(
                    image: "point.bottomleft.forward.to.arrow.triangle.scurvepath.fill",
                    title: "Able to track you load from pickup to final destination")
                
                Spacer()
                
                HStack {
                    NavigationLink {
                        ReservationNumberOfTrucksView(viewModel: viewModel, path: $path)
                    } label: {
                        ButtonView(size: .medium, buttonString: "Next")
                    }
                }
                .padding(.bottom, 20)
            }
        }
        .padding()
        .font(.subheadline)
    }
}

#Preview {
    NavigationStack {
        ReservationTimeSelectView(path: Binding.constant(NavigationPath.init()))
    }
}
