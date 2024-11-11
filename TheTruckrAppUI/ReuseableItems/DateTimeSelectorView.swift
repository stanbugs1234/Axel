//
//  DateTimeSelectorView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 6/10/23.
//

import SwiftUI

struct DateTimeSelectorView: View {
    @State private var scheduledTripDate = Date.now
    
    var body: some View {
        VStack{
            Text("What day is the trip?")
                .font(.title)
                .fontWeight(.semibold)
                .padding(.top)
            
            
            DatePicker("Please Enter a Date", selection: $scheduledTripDate, in: Date()...)
                .datePickerStyle(.graphical)
                .labelsHidden()
        }
    }
}

struct DateTimeSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        DateTimeSelectorView()
    }
}
