//
//  TripDateSelectorView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 6/10/23.
//

import SwiftUI

struct TripDateSelectorView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.presentationMode) var presentationMode
    @State private var enteredDateTimeText = Date()
    @ObservedObject var viewModel: TripViewModel
    
    var body: some View {
        NavigationView {
            

        VStack {
            HStack {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Cancel")
                        .foregroundColor(.backgroundColor)
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                }
                
                Spacer()
                
                Text("Select Date & Time")
                    .fontWeight(.semibold)
                    .foregroundColor(.backgroundColor)
                //                    .padding(.horizontal)
                    .padding(.vertical, 8)
                    .padding(.trailing)
                
                Spacer()
                
            }

            VStack{
                Text("What day is the trip?")
                    .font(.title)
                    .foregroundColor(.backgroundColor)
                    .fontWeight(.semibold)
                    .padding(.top)
                
                
                DatePicker("Please Enter a Date", selection: $enteredDateTimeText, in: Date()...)
                    .datePickerStyle(.graphical)
                    .labelsHidden()
            }
            
            Spacer()
            
            Button {
                viewModel.tripDate = enteredDateTimeText
                presentationMode.wrappedValue.dismiss()
            } label: {
                ButtonView(size: .medium, buttonString: "Select")
                    .foregroundColor(.backgroundColor)
            }
            
            Spacer()
        }
    }
    }
}

struct TripDateSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        TripDateSelectorView(viewModel:TripViewModel())
    }
}

//extension TripDateSelectorView {
//    func setDateTimeForStartTripView() {
//        viewModel.$tripDate = enteredDateTimeText
//        presentationMode.wrappedValue.dismiss()
//    }
//}
