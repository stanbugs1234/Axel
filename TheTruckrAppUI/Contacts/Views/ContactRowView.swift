//
//  ContactRowView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 6/24/23.
//

import SwiftUI
import Firebase

struct ContactRowView: View {
    let contact: Contact
    
    var body: some View {
        let abbreviatedName = initials(from: contact.contactFullName)
        
        HStack {
            ZStack {
                Circle()
                    .frame(width: 50, height: 50, alignment: .leading)
                    .foregroundColor(.gray)
                Text(abbreviatedName!)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                
                //MARK: Need to fix - Not Loading
                CircularProfileImageView(user: contact.user, size: .small)
        }

            VStack(alignment: .center, spacing: 8) {
                Text(contact.contactFullName)
                    .font(.headline)
                    .foregroundColor(.themeGreen)
                
                Text(contact.contactPhoneNumber)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
            }
            .padding(.leading, 25)
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .padding(.trailing)
                .foregroundColor(.secondary)

        }
        .padding(.leading)
    }
}

struct ContactRowView_Previews: PreviewProvider {
    static var previews: some View {
        ContactRowView(contact: dev2.mockContact)
    }
}
