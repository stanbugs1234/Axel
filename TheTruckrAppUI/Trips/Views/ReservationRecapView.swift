//
//  ReservationRecapView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 6/11/24.
//

import SwiftUI

struct ReservationRecapView: View {
    @ObservedObject var tripViewModel: TripsViewModel
    
    var body: some View {
        VStack {
            HStack {
                Text("Pickup Date: ")
                    .font(.headline)
                    .fontWeight(.semibold)
                
                Spacer()
                
                Text("\(tripViewModel.dateSelected.formatted(date: .abbreviated, time: .shortened))")
                    .font(.headline)
                    .fontWeight(.semibold)
            }
            
            if tripViewModel.selectedUberLocation == nil {
                
            } else {
                HStack {
                    Text("Location: ")
                        .font(.headline)
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    Text("\(tripViewModel.dateSelected.formatted(date: .abbreviated, time: .shortened))")
                        .font(.headline)
                        .fontWeight(.semibold)
                }
            }
        }
        .padding(.bottom, 0)
    }
}

#Preview {
    ReservationRecapView(tripViewModel: TripsViewModel())
}
