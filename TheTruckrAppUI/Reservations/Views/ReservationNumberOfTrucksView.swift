//
//  UberReservationNumberOfTrucksView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 11/26/24.
//

import SwiftUI

struct ReservationNumberOfTrucksView: View {
    @ObservedObject var viewModel: ReservationViewModel
    @Binding var path: NavigationPath
    
    var body: some View {
        VStack {
            //MARK: Title
            Text("Number of Trucks for")
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.bottom, 15)
            
            //MARK: Time short hand
            Text(viewModel.dateSelected.formatted(date: .abbreviated, time: .shortened))
                .font(.title2)
                .padding(.bottom, 5)
            
            //MARK: Number Picker
            VStack {
                Text("Number of Trucks")
                
                Picker("Number of Trucks", selection: $viewModel.numberOfTrucks) {
                    ForEach(0..<21) { numberOfTrucks in
                        Text("\(numberOfTrucks)")
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .padding(.bottom, 45)
            }
            
            Spacer()
            
            //MARK: Kind of Truck
            
            VStack {
                Text("Select Truck Kind")
                ReservationKindOfTruckView(viewModel: viewModel)
            }
            
            //MARK: Number of Trucks Info
            VStack{
                ReservationInfoRowView(
                    image: "truck.box.badge.clock.fill",
                    title: "Reserve up to 20 trucks at a time")
                
                ReservationInfoRowView(
                    image: "exclamationmark.bubble.circle.fill",
                    title: "Notified when your reservation is filled")
                ReservationInfoRowView(
                    image: "person.crop.circle.fill.badge.checkmark",
                    title: "Always have the correct number of trucks for your needs")
            }
            .padding()
            .font(.subheadline)
            
            //MARK: Button
            HStack {
                if viewModel.numberOfTrucks == 0 {
                    ButtonView(size: .medium,
                               buttonString: "Need Trucks")
                        .disabled(true)
                } else {
                    NavigationLink {
                        ReservationSelectLocationView(locationViewModel: LocationSearchViewModel(),
                                                      viewModel: viewModel,
                                                      config: SavedLocatationViewModel.home,
                                                      path: $path )
                    } label: {
                            ButtonView(size: .medium,
                                       buttonString: "Next")
                                .disabled(true)
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    NavigationStack {
        ReservationNumberOfTrucksView(viewModel: ReservationViewModel(), path: Binding.constant(NavigationPath.init()))
    }
}
