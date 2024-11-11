//
//  TripAcceptedView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 4/17/23.
//

import SwiftUI

struct TripAcceptedView: View {
    @EnvironmentObject var viewModel: HomeViewModel
    
    var body: some View {
        VStack {
            Capsule()
                .foregroundColor(Color(.systemGray5))
                .frame(width: 48, height: 6)
                .padding(.top, 8)
            
            if let trip = viewModel.trip {
                //pick up info view
            VStack {
                HStack {
                    Text("Driver is headed to \(trip.pickupLocationName) to pickup 610 Crushed Concrete returing to \(trip.dropoffLocationName)")
                        .font(.body)
                        .frame(height: 44)
                        .lineLimit(2)
                    .padding(.trailing)
                    
                    Spacer()
                    
                    VStack {
                        Text("\(trip.travelTimeToPassenger)")
                            .bold()
                        
                        Text("min")
                            .bold()
                    }
                    .frame(width: 56, height: 56)
                    .foregroundColor(.white)
                    .background(Color(.systemBlue))
                    .cornerRadius(10)
                }
                .padding()
                
                Divider()
            }
                //Driver info view
                VStack{
                    HStack {
                        Image("male")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(trip.driverName)
                                .fontWeight(.bold)
                            
                            HStack {
                                Image(systemName: "star.fill")
                                    .foregroundColor(Color(.systemYellow))
                                    .imageScale(.small)
                                
                                Text("4.8")
                                    .font(.footnote)
                                    .foregroundColor(.gray)
                            }
                        }
                        
                        Spacer()
                        
                        //Driver Vehicle Info
                        VStack(alignment: .center){
                            Image("triaxle")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 120, height: 64)
                            
                            HStack{
                                Text("Mack")
                                    .font(.system(size: 14, weight: .semibold))
                                    .foregroundColor(.gray)
                                
                                Text("5G4K08")
                                    .font(.system(size: 14, weight: .semibold))
                            }
                            .frame(width: 160)
                            .padding(.bottom)
                        }
                        
                    }
                    
                    Divider()
                }
                .padding()
            }
            
            Button {
                print("DEBUG: Cancel Trip")
            } label: {
                Text("CANCEL TRIP")
                    .frame(width: UIScreen.main.bounds.width - 32, height:  50)
                    .background(.red)
                    .cornerRadius(10)
                    .foregroundColor(.white)
            }
            
        }
        .padding(.bottom, 50)
        .background(Color.backgroundColor)
        .cornerRadius(16)
        .shadow(
            //color: Color.theme.secondaryBackgroundColor,
            //color: .white,
            radius: 20)
    }
}

struct TripAcceptedView_Previews: PreviewProvider {
    static var previews: some View {
        TripAcceptedView()
            .environmentObject(HomeViewModel())
    }
}
