//
//  ChatController.swift
//  ChatUI
//
//  Created by Javier Galera Garrido on 09/09/2020.
//  Copyright © 2020 Javier Galera Garrido. All rights reserved.
//

import Foundation
import Combine

class ChatController: ObservableObject {
    let objectWillChange = PassthroughSubject<ChatController,Never>()
    var messages = [ChatMessage]()
    
    func sendMessage(messageText: String){
        let newChat = databaseChats.childByAutoId()
        
        let messageToSend = ["username": UserDefaults.standard.string(forKey: "username") ?? "Unknown user", "messageText": messageText]
        
        newChat.setValue(messageToSend)
    }
}
