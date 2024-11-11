//
//  TruckStatusRowView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 2/14/24.
//

import SwiftUI

struct TruckStatusRowView: View {
    let truck: Truck
    
    var body: some View {
        VStack {
            //MARK: Truck Header
            HStack{
                ButtonImageFactored(size: .small, image: .truck, text: " ")
                
                Text("Truck Details")
            }
            .font(.title2)
            .fontWeight(.bold)
            
            Divider()
            
            //MARK: Truck Make & Model
            HStack {
                Text("Make:")
                
                Text(truck.truckMake)
                
                Spacer()
                
                Text("Model:")
                Text(truck.truckModel)
            }
            
            //MARK: Truck Capacity
            HStack {
                Text("S/N : ")
                
                Text(truck.truckSerialNumber)
                
                Spacer()
                
                Text(truck.truckMadeYear.dateDisplayFormat)
            }
            
            HStack {
                Text("Truck Type : ")
                Text(truck.truckType)
                
                Spacer()
                
                Text("Purchase Date")
                Text(truck.truckPurchaseDate.dateDisplayFormat)
                
            }
            
            HStack {
                Text("Policy Current: ")
                Text(truck.isTruckInsurancePolicyCurrent.description)
                
                Spacer()
                

                
            }
            
            HStack {
                Text("Ins. Exp Date: ")
                Text(truck.truckInsuranceDateExpiring.dateDisplayFormat)
                
                Spacer()
            }
        }
        .foregroundColor(.themeGreen)
        .font(.footnote)
    }
}

struct TruckStatusRowView_Previews: PreviewProvider {
    static var previews: some View {
        TruckStatusRowView(truck: dev2.mockTruck)
    }
}
