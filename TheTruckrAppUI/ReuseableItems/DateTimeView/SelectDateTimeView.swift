//
//  SelectDateTimeView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 6/22/23.
//

import SwiftUI


struct SelectDateTimeView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.presentationMode) var presentationMode
    @State private var enteredDateTimeText = Date()
    //ViewModel
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Cancel")
                        .foregroundColor(.black)
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                }
                
                Spacer()
                
                Text("Select Date & Time")
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                //                    .padding(.horizontal)
                    .padding(.vertical, 8)
                    .padding(.trailing)
                
                Spacer()
                
            }

            VStack{
                Text("What day is the trip?")
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(.top)
                
                
                DatePicker("Please Enter a Date", selection: $enteredDateTimeText, in: Date()...)
                    .datePickerStyle(.graphical)
                    .labelsHidden()
            }
            
            Spacer()
            
        }
    }
}

struct SelectDateTimeView_Previews: PreviewProvider {
    static var previews: some View {
        SelectDateTimeView()
    }
}
