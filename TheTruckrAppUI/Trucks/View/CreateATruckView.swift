//
//  CreateATruckView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 5/4/23.
//

import SwiftUI

struct CreateATruckView: View {
    @State var truckName = ""
    @State var truckYear = ""
    @State var truckMake = ""
    @State var truckModel = ""
    @State var truckSN = ""
    
    @State var truckInsPolicyNumber = ""
    @State var truckInsExpirationDate = ""
    
    var body: some View {
        
        NavigationView{
            VStack{
                Form {
                    Section {
                        TextField("Enter Truck Name", text: $truckName)
                        TextField("Enter Truck Make", text: $truckMake)
                        TextField("Enter Truck Model", text: $truckModel)
                        TextField("Enter Truck Type", text: $truckYear)
                        TextField("Enter Truck Serial Number", text: $truckSN)
                    } header: {
                        Text("Truck Info")
                    }
                    
                    Section {
                        TextField("Enter Truck Insurance Policy Number", text: $truckInsPolicyNumber)
                        TextField("Enter Date Policy Expires", text: $truckInsExpirationDate)
                    } header: {
                        Text("Insurance Info")
                    }
                    

                }
                .navigationTitle("Enter Truck Info")
                
                Button {
                    
                } label: {
                    Text("Save")
                        .bold()
                        .font(.title2)
                        .frame(width: 200, height: 50, alignment: .center)
                        .background(Color(.systemBlue))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
        }
    }
}

struct CreateATruckView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CreateATruckView()
        }
    }
}
