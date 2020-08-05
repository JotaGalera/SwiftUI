//
//  MotherView.swift
//  NavigationBetweenViews
//
//  Created by Javier Galera Garrido on 02/08/2020.
//  Copyright © 2020 Javier Galera Garrido. All rights reserved.
//

import SwiftUI

struct MotherView: View {
    
    @ObservedObject var viewRouter: ViewRouter
    
    var body: some View {
        VStack {
            if viewRouter.currentPage == "page1"{
                ContentView1(viewRouter: viewRouter)
            } else if viewRouter.currentPage == "page2"{
                ContentView2(viewRouter: viewRouter)            }
        }
    }
}


struct MotherView_Previews: PreviewProvider {
    static var previews: some View {
        MotherView(viewRouter: ViewRouter())
    }
}
