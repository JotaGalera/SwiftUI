//
//  DatabaseConstants.swift
//  ChatUI
//
//  Created by Javier Galera Garrido on 09/09/2020.
//  Copyright © 2020 Javier Galera Garrido. All rights reserved.
//

import Firebase

let databaseRoot = Database.database().reference()
let databaseChats = databaseRoot.child("chats")
