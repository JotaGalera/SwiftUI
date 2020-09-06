//
//  ChatScreen.swift
//  ChatUI
//
//  Created by Javier Galera Garrido on 03/09/2020.
//  Copyright © 2020 Javier Galera Garrido. All rights reserved.
//

import SwiftUI

let sampleConversation = [ChatMessage(messageText: "Hello how are you?",
                                      username: "Me",
                                      isMe: true),
                          ChatMessage(messageText: "I'm fine and you?",
                                      username: "Another user",
                                      isMe: false),
                          ChatMessage(messageText: "I'm fine as well.Thanks for asking. What are you doing right now?",
                                      username: "Me",
                                      isMe: true)]

struct ChatScreen: View {
    
    @State var newMessageInput = ""
    @ObservedObject var keyboardResponder = KeyboardResponder()
    
    var body: some View {
        NavigationView {
            VStack{
                ForEach(sampleConversation, id: \.messageID){
                    message in
                    ChatRow(message: message)
                }
                Spacer()
            
                ZStack {
                    Rectangle()
                        .foregroundColor(.white)
                    RoundedRectangle(cornerRadius: 20)
                    .stroke(lightGreyColor, lineWidth: 2)
                    .padding()
                    HStack {
                        TextField("New message...", text: $newMessageInput, onCommit: {print("Send message")})
                            .padding(30)
                        Button(action: {
                            print("Send message")
                        }) {
                            Image(systemName: "paperplane")
                                .imageScale(.large)
                            .padding(30)
                        }
                    }
                }
                .frame(height: 70)
                .offset(y: -keyboardResponder.currentHeight)
                .navigationBarTitle("Chat App")
            }
        }
    }
}

struct ChatScreen_Previews: PreviewProvider {
    static var previews: some View {
        ChatScreen()
    }
}
