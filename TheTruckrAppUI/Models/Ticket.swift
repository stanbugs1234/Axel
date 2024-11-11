//
//  Ticket.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 4/21/23.
//

import FirebaseFirestoreSwift
import Firebase

enum TicketState: Int, Codable {
    case requested
    case rejected
    case accepted
}



struct Ticket: Identifiable, Decodable, Hashable {
    @DocumentID var ticketId: String?
    let userId: String
    let driverName: String
    let ticketImage: Photo
    var postedOn = Date()
    
    
    var id: String {
        return ticketId ?? ""
    }
}
