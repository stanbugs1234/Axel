//
//  ContactDetailRowViewModel.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 6/28/23.
//

import Foundation

enum ContactDetailRowViewModel: Int, CaseIterable, Identifiable {
    case message
    case call
    case email
    
    var title: String {
        switch self {
        case .message: return "Message"
        case .call: return "Call"
        case .email: return "Email"
        }
    }
    
    var imageName: String {
        switch self {
        case .message: return "message.fill"
        case .call: return "phone.fill"
        case .email: return "envelope.circle.fill"
        }
    }
    
    var id: Int {
        return self.rawValue
    }
}
