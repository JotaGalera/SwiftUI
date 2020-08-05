//
//  ContentView2.swift
//  NavigationBetweenViews
//
//  Created by Javier Galera Garrido on 02/08/2020.
//  Copyright © 2020 Javier Galera Garrido. All rights reserved.
//

import SwiftUI

struct ContentView2: View {
    
    @ObservedObject var viewRouter: ViewRouter
    
    var body: some View {
        VStack {
            HappyDog()
            BackButton(viewRouter: viewRouter)
        }
    }
}

struct HappyDog: View {
    var body: some View{
        Image("happyDog")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 300, height: 600)
            .cornerRadius(10)
            .clipped()
    }
}

struct BackButton: View {
    
    var viewRouter: ViewRouter
    
    var body: some View{
        Button(action: {self.viewRouter.currentPage = "page1"}){
            BackButtonContent()
        }
    }
}

struct BackButtonContent: View{
    var body: some View {
        Text("Back")
            .foregroundColor(.white)
            .frame(width: 200, height: 50)
            .background(Color.blue)
            .cornerRadius(15)
            .padding(.top, 50)
    }
    
}
struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2(viewRouter: ViewRouter())
    }
}
