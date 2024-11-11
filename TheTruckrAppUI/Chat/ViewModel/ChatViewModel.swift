//
//  ChatViewModel.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 1/18/24.
//

import Foundation

class ChatViewModel: ObservableObject {
    @Published var messageText = ""
    @Published var messages = [Chat]()
    
    let service: ChatService
    
    init(user: User) {
        self.service = ChatService(chatPartner: user)
        observeMessages()
    }
    
    func observeMessages() {
        service.observeChats() { messages in
            self.messages.append(contentsOf: messages)
        }
    }
    
    func sendChat() {
        service.sendChat(messageText)
    }
}
