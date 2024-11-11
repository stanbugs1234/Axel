//
//  TripLoadingView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 4/17/23.
//

import SwiftUI

struct TripLoadingView: View {
    var body: some View {
        VStack {
            Capsule()
                .foregroundColor(Color(.systemGray5))
                .frame(width: 48, height: 6)
                .padding(.top, 8)
            HStack {
                VStack(alignment: .leading, spacing: 12) {
                    Text("Contacting driver ..")
                        .font(.headline)
                    
                    //Might add text for your trip to location
                    //Text("Arring at 1:30 PM")
                        //.font(.subheadline)
                        //.fontWeight(.semibold)
                        //.foregroundColor(Color(.systemBlue))
                }
                .padding()
                
                Spacer()
                
                Spinner(lineWidth: 6, height: 64, width: 64)
                    .padding()
            }
            .padding(.bottom, 70)
        }
        .padding(.bottom, 25)
        .background(Color.backgroundColor)
        .cornerRadius(16)
        .shadow(
            //color: Color.theme.secondaryBackgroundColor,
            //color: .white,
            radius: 20)
    
    }
}

struct TripLoadingView_Previews: PreviewProvider {
    static var previews: some View {
        TripLoadingView()
    }
}
