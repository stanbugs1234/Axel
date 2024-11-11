//
//  ContactViewModel.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 6/19/23.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

class ContactViewModel: ObservableObject {
    @Published var didUploadContact = false
    @Published var contacts = [Contact]()
    @Published var searchText = ""
    
    let uid = UserService.shared.currentUser?.id
    
    var searchableContacts: [Contact] {
        if searchText.isEmpty {
            return contacts
        } else {
            let lowercasedQuery = searchText.lowercased()
            
            return contacts.filter({
                $0.contactFullName.lowercased().contains(lowercasedQuery) ||
                $0.contactPhoneNumber.lowercased().contains(lowercasedQuery)
                
            })
        }
    }
    
    let service = ContactService()
    
    init() {
        service.fetchUserContacts(forUid: uid ?? "") { contacts in
            self.contacts = contacts
        }
    }
    
    func uploadContact(contactFullName: String, contactPhoneNumber: String, contactEmail: String, contactCompanyName: String) {
        
        service.uploadContact(contactFullName: contactFullName, contactPhoneNumber: contactPhoneNumber, contactEmail: contactEmail, contactCompanyName: contactCompanyName) {success in
            if success {
                self.didUploadContact = true
            } else {
                print("Customer did not upload for some fucking reason")
            }
        }
    }
}

