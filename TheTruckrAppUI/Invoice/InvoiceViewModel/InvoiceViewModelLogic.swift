//
//  InvoiceViewModelLogic.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 5/14/23.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

class InvoiceViewModelLogic {
    @Published var invoices = [Invoice]()
    @Published var searchText = ""
    
    var searchableJobs: [Invoice] {
        if searchText.isEmpty {
            return invoices
        } else {
            let loweredcasedQuery = searchText.lowercased()
            
            return invoices.filter({
                $0.customerFullName.lowercased()
                    .contains(loweredcasedQuery) ||
                $0.invoiceNumber.lowercased().contains(loweredcasedQuery)
            })
        }
    }
//    if invoice.PayType == .hourly {
//        var invoiceHourlyTotal = trip.hours * invoice.jobPayRate
//        return invoiceHourlyTotal
//    } else {
//        var invoicePerLoadTotal = trip.load * Invoice.jobPayRate
//        return invoicePerLoadTotal
//    }
    private let viewModel = AuthViewModel()
    
    let uid = Auth.auth().currentUser?.uid
    
    let service = InvoiceService()
    
    init() {
//        fetchAllInvoices()
        fetchUserInvoices(forUid: uid ?? "") { invoices in
            self.invoices = invoices}
    }
    
    func fetchAllInvoices() {
        service.fetchInvoices() { invoices in
            self.invoices = invoices}
    }
    
    func fetchUserInvoices(forUid uid: String, completion: @escaping ([Invoice]) -> Void) {
        Firestore.firestore().collection("invoices")
            .whereField("uid", isEqualTo: uid)
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else {return}
                let invoices = documents.compactMap({
                    try? $0.data(as: Invoice.self)
                })
                completion(invoices)
            }
    }
}
