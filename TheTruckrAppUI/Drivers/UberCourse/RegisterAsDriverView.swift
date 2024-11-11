//
//  RegisterAsDriverView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 5/1/23.
//

import SwiftUI

struct RegisterAsDriverView: View {
    @State private var driversLicenseNumber = ""
    @State private var driversLicenseExpirationDate = ""
    @State private var medicalCardNumber = ""
    @State private var medicalCardExpirationDate = ""
    @State private var insuranceProvider = ""
    @State private var insurancePolicyNumber = ""
    @State private var insuranceRenewalDate = ""
    @State private var insurancePolicyCoverage = ""
    
    var body: some View {
        Form {
            Section{
                TextField("Driver's License Number", text: $driversLicenseNumber)
                TextField("Driver's License Expiration Date", text: $driversLicenseExpirationDate)
            } header: {
                Text("Enter Driver's License Information")
                    .foregroundColor(.themeGreen)
            }

            Section{
                TextField("Medical Id Number", text: $medicalCardNumber)
                TextField("Medical Id Expiration Date", text: $medicalCardExpirationDate)
            } header: {
                Text("Enter Medical Card Information")
                    .foregroundColor(.themeGreen)
            }
            
            Section {
                TextField("Insurance Provider", text: $insuranceProvider)
                TextField("Insurance Policy Number", text: $insurancePolicyNumber)
                TextField("Policay Renewal Date", text: $insuranceRenewalDate)
                
            } header: {
                Text("Policy Coverage")
                    .foregroundColor(.themeGreen)
            }
            HStack {
                Spacer()
                //Need to add a button to change the state of the acoount too Driver
                CreateNewButton(buttonText: "Register")
                Spacer()
            }

        }
        .navigationTitle("Register As A Driver")
    }
}

struct RegisterAsDriverView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            RegisterAsDriverView()
        }
    }
}
