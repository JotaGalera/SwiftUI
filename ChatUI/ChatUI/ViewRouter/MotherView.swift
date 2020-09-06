//
//  MotherView.swift
//  ChatUI
//
//  Created by Javier Galera Garrido on 03/09/2020.
//  Copyright © 2020 Javier Galera Garrido. All rights reserved.
//

import SwiftUI

struct MotherView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        VStack {
            if viewRouter.currentPage == "loginScreen" {
                LoginScreen()
            } else if viewRouter.currentPage == "chatScreen" {
                ChatScreen()
            }
        }
    }
}

struct MotherView_Previews: PreviewProvider {
    static var previews: some View {
        MotherView().environmentObject(ViewRouter(pageToStartWith: "loginScreen"))
    }
}
