//
//  Invoice.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 5/22/23.
//

import Foundation

import FirebaseFirestoreSwift
import Firebase

enum InvoiceState: Int, Codable {
    //0 - Need to figure out when the invoice is created
    case open
    //1 -Need to Determine how the user makes an invoice closed
    case closed

    var title: String {
        switch self {
        case .open: return "Open"
        case .closed: return "Closed"
        }
    }
}

struct Invoice: Identifiable, Codable, Hashable {
    @DocumentID var invoiceId: String?
    let invoiceNumber: String
    let customerFullName: String
    let ticketCollectionId: String
    let totalAmount: Double
    //is of type integar
    var invoiceStatus: InvoiceState
    let uid: String
    let timestamp: Timestamp
    

    var id: String {
        return invoiceId ?? ""
    }
}
