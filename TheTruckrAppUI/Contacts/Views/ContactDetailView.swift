//
//  ContactDetailView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 6/28/23.
//

import SwiftUI

struct ContactDetailView: View {
    let contact: Contact
    var viewModel = ContactDetailViewModel()
    
    @State private var contactNotes = ""
    
    var body: some View {
        let abbreviatedName = initials(from: contact.contactFullName)
        VStack {
            Section {
                HStack {
                    ZStack {
                        Circle()
                            .frame(width: 85, height: 85, alignment: .leading)
                            .foregroundColor(.gray)
                        
                        Text(abbreviatedName!)
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                    }
                }
                .padding(.top)
                
                HStack {
                    Text(contact.contactFullName)
                        .font(.title2)
                        .foregroundColor(.themeGreen)
                }
                
                HStack {
                    Text(contact.contactCompanyName ?? "")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding(.bottom, 15)
                
                HStack {
                    ForEach(ContactDetailRowViewModel.allCases) { viewModel in
                        NavigationLink (value: viewModel) { ContactDetailRowView(viewModel: viewModel)
                        }
                        .padding(.horizontal, 7)
                    }
                }
                .padding(.bottom, 4)
            }
            
            Form {
                Section {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Mobile")
                                .padding(.bottom, 2)
                            
                            Button {
                                viewModel.callContact()
                            } label: {
                                Text(contact.contactPhoneNumber)
                            }
                        }
                    }
                }
                
                Section {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Email")
                                .padding(.bottom, 3)
                            
                            Button {
                                viewModel.emailContact()
                            } label: {
                                Text(contact.contactEmail ?? "")
                            }
                        }
                    }
                }
                
                Section{
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Notes")
                            
                            VStack {
                                TextField("Enter Notes about Contact Here", text: $contactNotes)
                                    .multilineTextAlignment(.leading)
                            }
                        }
                    }
                }
            }
        }
    }
}

struct ContactDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContactDetailView(contact: dev2.mockContact)
    }
}
