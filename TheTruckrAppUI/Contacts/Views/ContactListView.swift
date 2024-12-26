//
//  ContactListView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 6/19/23.
//

import SwiftUI

struct ContactListView: View {
    @ObservedObject var viewModel = ContactViewModel()
    @State private var showNewCustomerView = false
    
    var body: some View {
            VStack {
                SearchBarView(text: $viewModel.searchText, placementString: "Search Vendors...")
                    .padding()
                
                Spacer()
                
                Divider()
                
                ScrollView {
                    LazyVStack(alignment: .leading) {
                        ForEach(viewModel.searchableContacts) {
                            contact in NavigationLink(value: contact) {
                                ContactRowView(contact: contact)
                            }
                        }
                    }
                }
                //Add New Contact Button
                VStack(alignment: .center) {
                    HStack {
                        Button {
                            showNewCustomerView.toggle()
                        } label: {
                            CreateNewButton(buttonText: "Create New Contact")
                        }
                        .fullScreenCover(isPresented: $showNewCustomerView) {
                            CreateNewContactView(viewModel: viewModel)
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .keyboard) {
                    DismissKeyboardButton()
                }
            }
        .navigationTitle("Contacts")
        .navigationDestination(for: Contact.self, destination: {
            contact in
            ContactDetailView(contact: contact)
        })
    }        
}

struct ContactListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ContactListView()
        }
    }
}
