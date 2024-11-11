//
//  TruckView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 4/23/23.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

struct TruckView: View {
    @FirestoreQuery(
        collectionPath: "trucks"
    ) var trucks: [Truck]
    
    var body: some View {
        VStack {
            List(trucks, id: \.id) {truck in
                TruckRowView(truck: truck, user: UserService.shared.currentUser!)
            }

            VStack {
                NavigationLink {
                    CreateATruckView()
                } label: {
                    CreateNewButton(buttonText: "Add New Truck")
                }
            }
        }
        .foregroundColor(.themeGreen)
        .navigationTitle("Trucks")
    }
}

struct TruckView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            TruckView()
        }
    }
}
