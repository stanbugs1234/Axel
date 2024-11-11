//
//  MessageFilterViewModel.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 4/27/23.
//

import Foundation

enum MessageFilterViewModel: Int, CaseIterable {
    case messages
    case replies
    case likes
    
    var title: String {
        switch self {
        case .messages: return "Messages"
        case .replies: return "Replies"
        case .likes: return "Likes"
        }
    }
}
