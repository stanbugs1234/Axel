//
//  ContactDetailViewModel.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 12/1/23.
//

import Foundation

class ContactDetailViewModel: ObservableObject {
    
    func callContact() {
        print("Making a call to the contact")
    }
    
    func emailContact() {
        print("emailing the contact")
    }
    
    func messageContact() {
        print("Messaging the Contact")
    }
}
