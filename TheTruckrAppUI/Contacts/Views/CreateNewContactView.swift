//
//  CreateNewContactView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 6/28/23.
//

import SwiftUI
import iPhoneNumberField

struct CreateNewContactView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var viewModel = ContactViewModel()
    
    @State private var contactFullName = ""
    @State private var contactContactNumber = ""
    @State private var contactEmail = ""
    @State private var contactCompanyFullName = ""
    @State private var phoneEditing = false
    
    
    var body: some View {

        let uid = UserService.shared.currentUser?.id
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
                
                Text("New Contact")
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                //                    .padding(.horizontal)
                    .padding(.vertical, 8)
                
                Spacer()
                
                Button { viewModel.uploadContact(contactFullName: contactFullName, contactPhoneNumber: contactContactNumber, contactEmail: contactEmail, contactCompanyName: contactCompanyFullName)} label: {
                    Text("Save")
                }
            }
            .padding()
            
            Form {
                Section {
                    TextField("Enter Contact Name", text: $contactFullName)

                    TextField("Enter Contact Email", text: $contactEmail)
//                    Button {
//                        showCustomerListView.toggle()
//                    } label: {
//                        Text("Enter Customer")
//                    }

                    TextField("Enter Contact Company Name", text: $contactCompanyFullName)
                } header: {
                    Text("Enter Contact Information")
                }
                
                Section {
                    iPhoneNumberField("Enter Phone Number", text: $contactContactNumber, isEditing: $phoneEditing)
                        .keyboardType(.phonePad)
                } header: {
                    Text("Enter Contact Phone Number")
                }
            }
            .foregroundColor(.themeGreen)
        }
        .toolbar {
            ToolbarItem(placement: .keyboard) {
                DismissKeyboardButton()
            }
        }
        .onReceive(viewModel.$didUploadContact) {success in
            if success {
                            viewModel.service.fetchUserContacts(forUid: uid ?? "") { contacts in
                                self.viewModel.contacts = contacts
                            }
                presentationMode.wrappedValue.dismiss()
            }
        }

//        .fullScreenCover(isPresented: $showCustomerListView) {
//            TripSelectActiveCustomerView()
//        }
    }
}

struct CreateNewContactView_Previews: PreviewProvider {
    static var previews: some View {
        CreateNewContactView()
    }
}
