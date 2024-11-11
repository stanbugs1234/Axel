//
//  CreateNewCustomerView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 5/5/23.
//

import SwiftUI
import FirebaseFirestore
import Firebase

struct CreateNewCustomerView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel = UploadCustomerViewModel()
    @ObservedObject var customerViewModel = CustomerViewModel()
    @EnvironmentObject var authViewModel: AuthViewModel

    
    @State private var customerFullName = ""
    @State private var customerAddress = ""
    
    
    var body: some View {
        let user = UserService.shared.currentUser
        VStack{
            HStack {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Cancel")
                        .foregroundColor(.primary)
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                }
                
                Spacer()
                
                Text("New Customer")
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                //                    .padding(.horizontal)
                    .padding(.vertical, 8)
                
                Spacer()
                
                Button { viewModel.uploadCustomer(customerAddress: customerAddress, customerFullName: customerFullName)} label: {
                    Text("Save")
                        .bold()

                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .background(Color.backgroundColor)
                        .foregroundColor(.themeGreen)
                        .clipShape(Capsule())
                }
            }
            .padding()
            
            HStack {
                VStack {
                    HStack {
                        Text("Name: ")
                            .fontWeight(.semibold)
                            .padding()
                        
                        TextField("Enter Company Name", text: $customerFullName)
                            .foregroundColor(.secondary)
                            .padding()
                    }
                    
                    HStack {
                        Text("Address: ")
                            .fontWeight(.semibold)
                            .padding()
                        
                        TextField("Enter Company Address", text: $customerAddress)
                            .foregroundColor(.secondary)
                            .padding()
                    }
                }
                .padding()
            }
        }
        .toolbar {
            ToolbarItem(placement: .keyboard) {
                DismissKeyboardButton()
            }
        }
        .onReceive(viewModel.$didUploadCustomer) { success in
            if success {
                viewModel.service.fetchCustomers(forUId: user?.id ?? "") { customers in
                    self.customerViewModel.customers = customers
                }
                presentationMode.wrappedValue.dismiss()
            }
        }
        
        Spacer()
    }
}

struct CreateNewCustomerView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            CreateNewCustomerView()
                .environmentObject(AuthViewModel())
        }
    }
}

