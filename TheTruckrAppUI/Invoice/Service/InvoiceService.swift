//
//  InvoiceService.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 11/10/23.
//

import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

struct InvoiceService {
    
    func fetchInvoices(completion: @escaping([Invoice]) -> Void) {
        Firestore.firestore().collection("invoices")
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else {return}
                
                let invoices = documents.compactMap({ try? $0.data(as: Invoice.self) })
                print("DEBUG: Fetching Jobs")
                completion(invoices)
            }
    }
    
    func fetchUserInvoices(forUid uid: String, completion: @escaping ([Invoice]) -> Void) {
        Firestore.firestore().collection("invoices")
            .whereField("uid", isEqualTo: uid)
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else { return }
                let invoices = documents.compactMap({
                    try? $0.data(as: Invoice.self)
                })
                completion(invoices)
            }
    }

}
