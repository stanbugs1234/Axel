//
//  TripListRowView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 11/6/23.
//

import SwiftUI

struct TripListRowView: View {
    let trip: Trip
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Spacer()
                
                Text("3/11/24")
                    .font(.footnote)
            }
            .padding(.bottom, 3)

            HStack {
                Text("Pick Up: ")
                    .fontWeight(.semibold)
                
                Text(trip.pickupLocationName)
                
                Spacer()
                
                Text(trip.distanceToPassenger.distanceInMilesString())
                    .font(.footnote)
                Text("Mi")
                    .font(.footnote)
            }
            
            HStack {
                Text("Drop Off: ")
                    .fontWeight(.semibold)
                
                Text(trip.dropoffLocationName)
                
                Spacer()
                
                Text(trip.travelTimeToPassenger.description)
                    .font(.footnote)
                Text("Min")
                    .font(.footnote)
            }
            
//            HStack {
//                Text("Distance Travled: ")
//                Text(trip.distanceToPassenger.distanceInMilesString())
//                Text("Mi")
//            }
//            
//            HStack {
//                Text("Time: ")
//                Text(trip.travelTimeToPassenger.description)
//                Text("Min")
//            }
            
            HStack {
                Text("Trip Cost: ")
                    .fontWeight(.semibold)
                
                Text(trip.tripCost.toCurrency())
            }
        }
        .padding()
        .foregroundColor(.themeGreen)
        .background(Color.backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
        .shadow(color: .primary.opacity(0.3), radius: 10, x: 0, y: 5)
    }
}

struct TripListRowView_Previews: PreviewProvider {
    static var previews: some View {
        TripListRowView(trip: dev2.mockTrip)
    }
}
