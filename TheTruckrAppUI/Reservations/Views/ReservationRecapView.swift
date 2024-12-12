//
//  ReservationRecapView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 6/11/24.
//

import SwiftUI

struct ReservationRecapView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var path: NavigationPath
    @ObservedObject var viewModel: ReservationViewModel
    
    var body: some View {
        VStack {
            //MARK: Cancel Button
            HStack {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Cancel")
                        .fontWeight(.semibold)
                        .foregroundColor(.themeGreen)
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                }
                
                Spacer()
            }
            
            VStack {
                //MARK: Title
                Text("Confirm reservation for")
                    .fontWeight(.semibold)
                    .font(.title3)
                    .padding(.bottom, 5)
                
                //MARK: Time short hand
                Text(viewModel.dateSelected
                    .formatted(date: .abbreviated,
                               time: .shortened))
                .font(.title3)
                .padding(.bottom, 5)
            }
            .padding(.top)
            
            //MARK: Number of Trucks
            HStack {
                Text("Number of Trucks :")
                    .fontWeight(.semibold)
                    .font(.title3)
                    .padding(.bottom, 15)
                
                Text("\(viewModel.numberOfTrucks)")
                    .font(.title3)
                    .padding(.bottom, 15)
            }
            .padding(.top)
            
            //MARK: Kind of Truck
            HStack {
                Text("Truck Kind: ")
                    .fontWeight(.semibold)
                    .font(.title3)
                    .padding(.bottom, 15)
                
                Text("\(viewModel.kindOfTruck.title)")
                    .font(.title3)
                    .padding(.bottom, 15)
            }
            .padding(.top)
            
            //MARK: Trips
            VStack {
                Text("Location")
                    .fontWeight(.semibold)
                    .font(.title3)
                
                if viewModel.selectedUberLocation == nil {
                    Text("No Location")
                } else {
                    VStack {
                        Text("\(String(describing: viewModel.selectedUberLocation!.title))")
                            .fontWeight(.semibold)
                        Text("\(String(describing: viewModel.selectedUberLocation!.subtitle))")
                            .multilineTextAlignment(.center)
                        
                    }
                }
            }
            
            Spacer()
            
            //MARK: Confirm Charge
            HStack {
                Text("Credit Card Charge :")
                    .fontWeight(.semibold)
                    .font(.title2)
                    .padding(.bottom, 15)
                
                Text(viewModel.calculateCharge().toCurrency())
                    .font(.title2)
                    .padding(.bottom, 15)
            }
            
            Spacer()
            
            //MARK: Info
            VStack {
                ReservationInfoRowView(
                    image: "creditcard.fill",
                    title: "Edits/Cancellations can be made up to 2 hours prior to Reservation")
                ReservationInfoRowView(
                    image: "person.line.dotted.person.fill",
                    title: "\(AppConstants.appName) is not responsible for full payment. Payment is between driver and You")
                ReservationInfoRowView(
                    image:"dollarsign.circle.fill",
                    title: "Upon Confirmation, Drivers will be contact you for payment. Above charge is a \(AppConstants.appName) finder fee.")
            }
            .padding()
            
            Spacer()
            
            HStack {
                Button {
                    path.removeLast(path.count)
                    path = NavigationPath()
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    ButtonView(size: .medium,
                               buttonString: "Confirm")
                }
                .padding(.bottom, 20)
            }
            .padding()
        }
    }
}

//MARK: Preview
#Preview {
    NavigationStack {
        ReservationRecapView(path: Binding.constant(NavigationPath.init()), viewModel: ReservationViewModel())
    }
}
