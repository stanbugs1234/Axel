//
//  ScheduleTripView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 5/16/23.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

struct ScheduleTripView: View {
    @EnvironmentObject var viewModel: HomeViewModel
    
    @State private var scheduledTripDate = Date.now
    @State var tripIsTenHours = false
    @State var tripIsReoccuring = false
    @State var arriveEmpty = false
    @State var selectedUser = ""
    
    var body: some View {
        
//        var drivers = viewModel.fetchDrivers()
        
        VStack{
            
            //MARK: Date Time Selector View
           DateTimeSelectorView()

            //MARK: Wheel view
//            Picker("Assign Driver", selection: $selectedUser)
//            {
//                ForEach(drivers, id: \.self) { driver in
//                    Text(driver.driverFullName)
//                }
//            }
//            
            
            Text("What is the first location?")
                .font(.title)
                .fontWeight(.semibold)

            Toggle(isOn: $arriveEmpty) {
                Text("Driver Arrive Empty?")
                    .labelsHidden()
                    .padding()
            }
        
            Text("What is the next location?")
                .font(.title)
                .fontWeight(.semibold)
            
            //Toggle Switches
            
            Toggle(isOn: $tripIsReoccuring) {
                Text("Is Trip Reoccuring?")
                    .labelsHidden()
                    .padding()
            }
            
            Toggle(isOn: $tripIsTenHours) {
                Text("All Day (10 hours)")
                    .labelsHidden()
                    .padding()
            }
            
            Spacer()
            
            Button {
                
            } label: {
                ButtonView(size: .medium, buttonString: "Next")
            }
        }
    }
}

struct ScheduleTripView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ScheduleTripView()
        }
    }
}


