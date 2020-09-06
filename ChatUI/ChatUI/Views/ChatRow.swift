//
//  ChatRow.swift
//  ChatUI
//
//  Created by Javier Galera Garrido on 03/09/2020.
//  Copyright © 2020 Javier Galera Garrido. All rights reserved.
//

import SwiftUI

struct ChatRow: View {
    
    var message: ChatMessage
    
    var body: some View {
        HStack {
            if message.isMe {
                Spacer()
            }
            VStack(alignment: .leading){
                Text(message.username)
                    .font(.footnote)
                    .foregroundColor(message.isMe ? lightGreyColor: .gray)
                Text(message.messageText)
            }
            .padding(10)
            .background(message.isMe ? Color.blue : lightGreyColor)
            .cornerRadius(10)
            .frame(maxWidth: 280, alignment: self.message.isMe ? .trailing : .leading)
            if !message.isMe{
                Spacer()
            }
        }
    .padding()
    }
}

struct ChatRow_Previews: PreviewProvider {
    static var previews: some View {
        ChatRow(message: sampleConversation[2])
    }
}
