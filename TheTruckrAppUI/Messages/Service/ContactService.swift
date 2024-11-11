//
//  ContactService.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 6/28/23.
//

import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

class ContactService: ObservableObject {
   
    
    func uploadContact(contactFullName: String, contactPhoneNumber: String, contactEmail: String, contactCompanyName: String, completion: @escaping(Bool)-> Void) {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        
        let data = [
            "contactFullName": contactFullName,
            "contactPhoneNumber": contactPhoneNumber,
            "contactEmail": contactEmail,
            "contactCompanyName": contactCompanyName,
            "uid": uid,
            "timestamp": Timestamp(date: Date())] as [String : Any]
        
        Firestore.firestore().collection("contacts").document()
            .setData(data) {error in
                if let error = error {
                    print("DEBUG: Failed to upload contact with error: \(error.localizedDescription)")
                    completion(false)
                    return
                }
                completion(true)
            }
    }
    
    func fetchContacts(completion: @escaping([Contact]) -> Void) {
        Firestore.firestore().collection("contacts")
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else {return}
                
                let contacts = documents.compactMap({ try? $0.data(as: Contact.self) })
                print("DEBUG: Fetching Contacts")
                completion(contacts)
            }
    }
    
    func fetchUserContacts(forUid uid: String, completion: @escaping ([Contact]) -> Void) {
        Firestore.firestore().collection("contacts")
            .whereField("uid", isEqualTo: uid)
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else { return }
                let contacts = documents.compactMap({
                    try? $0.data(as: Contact.self)
                })
                completion(contacts)
            }
    }
    
    func fetchUserContacts( completion: @escaping ([Contact]) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        Firestore.firestore().collection("contacts")
            .whereField("uid", isEqualTo: uid)
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else { return }
                let contacts = documents.compactMap({
                    try? $0.data(as: Contact.self)
                })
                completion(contacts)
            }
    }
}
