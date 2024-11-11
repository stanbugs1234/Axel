//
//  TruckRowView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 5/2/23.
//

import SwiftUI
import FirebaseFirestoreSwift
import FirebaseFirestore

struct TruckRowView: View {
    @FirestoreQuery(
        collectionPath: "trucks"
    ) var trucks: [Truck]
    
    let truck: Truck
    let user: User
    
    var body: some View {
        VStack {
            HStack {
                CircularProfileImageView(user: user, size: .xSmall)
                
                Text(user.fullname)
                
                Spacer()
                
                ButtonImageFactored(size: .xSmall, image: .driver, text: "")
            }
            
            HStack {
                ButtonImageFactored(size: .xSmall, image: .truck, text: "Truck: ")
                
                Text(truck.truckName ?? "")
                
                Spacer()
                
                ButtonImageFactored(size: .xSmall, image: .trips, text: "Trips: ")
                
                Text("6")
                
            }
            .padding(.leading, 6)
            
            HStack {
                ButtonImageFactored(size: .xSmall, image: .truckFilled, text: "Active")
                
                Spacer()
                
            }
            .padding(.leading, 4)
            
            Divider()
        }
        .font(.subheadline)
        .padding(.horizontal)
        .padding(.vertical)
    }
}

struct TruckRowView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            TruckRowView(truck: dev2.mockTruck, user: dev2.mockUser)
        }
    }
}
