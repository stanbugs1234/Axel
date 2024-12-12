//
//  ReservationKindOfTruckView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 12/8/24.
//

import SwiftUI

struct ReservationKindOfTruckView: View {
    @ObservedObject var viewModel: ReservationViewModel
    
    var body: some View {
        //MARK: Number Picker
        Picker("Kind of Truck", selection: $viewModel.kindOfTruck) {
            ForEach(TruckKind.allCases, id :\.self) { type in
                Text("\(type.title)")
            }
        }
        .pickerStyle(.segmented)
        .padding()
        .padding(.bottom)
    }
}

#Preview {
    ReservationKindOfTruckView(viewModel: ReservationViewModel())
}
