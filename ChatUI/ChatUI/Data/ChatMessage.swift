//
//  ChatMessage.swift
//  ChatUI
//
//  Created by Javier Galera Garrido on 03/09/2020.
//  Copyright © 2020 Javier Galera Garrido. All rights reserved.
//

import Foundation

class ChatMessage{
    let messageText: String
    let username: String
    let isMe: Bool
    let messageID = UUID()
    
    init(messageText: String, username: String, isMe: Bool){
        self.messageText = messageText
        self.username = username
        self.isMe = isMe
    }
}
