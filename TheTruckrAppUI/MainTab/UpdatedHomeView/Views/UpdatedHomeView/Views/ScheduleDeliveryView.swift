//
//  ScheduleDeliveryView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 12/18/24.
//

import SwiftUI

struct ScheduleDeliveryView: View {
    var body: some View {
        let tomorrow = Date().addingTimeInterval(86400)
        let twoDaysFromNow = tomorrow.addingTimeInterval(86400)
        let threeDaysFromNow = twoDaysFromNow.addingTimeInterval(86400)
        
        VStack {
            HStack {
                VStack(alignment:.leading) {
                    Text("Tomorrow")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .padding(.bottom, 3)
                    
                    Text(tomorrow.monthAndDayFormat)
                        .font(.subheadline)
                }
                .padding()
                .border(Color.opposite, width: 7)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                
                VStack(alignment:.leading) {
                    Text(twoDaysFromNow.dayDisplayFormat)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .padding(.bottom, 3)
                    
                    Text(twoDaysFromNow.monthAndDayFormat)
                        .font(.subheadline)
                }
                
                Spacer()
                
                VStack(alignment:.leading) {
                    Text(threeDaysFromNow.dayDisplayFormat)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .padding(.bottom, 3)
                    
                    Text(threeDaysFromNow.monthAndDayFormat)
                        .font(.subheadline)
                }
            }
            
            .padding(.horizontal)
          
        }
        .navigationTitle(Text("Schedule Delivery"))
    }
}

#Preview {
    NavigationStack {
        ScheduleDeliveryView()
            .preferredColorScheme(.dark)
    }
}
