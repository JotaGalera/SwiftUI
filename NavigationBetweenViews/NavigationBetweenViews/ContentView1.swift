//
//  ContentView1.swift
//  NavigationBetweenViews
//
//  Created by Javier Galera Garrido on 02/08/2020.
//  Copyright © 2020 Javier Galera Garrido. All rights reserved.
//

import SwiftUI

struct ContentView1: View {
    
    @ObservedObject var viewRouter: ViewRouter
    
    var body: some View {
        VStack{
            GrumpyDog()
            NextButton(viewRouter: viewRouter)
        }
    }
}

struct GrumpyDog: View {
    var body: some View {
        return Image("grumpyDog")
        .resizable()
        .aspectRatio(contentMode: .fill)
        .frame(width: 300, height: 600)
        .cornerRadius(10)
        .clipped()
    }
}

struct NextButton: View {
    
    var viewRouter: ViewRouter
    
    var body: some View {
        Button(action: {self.viewRouter.currentPage = "page2"}) {                NextButtonContent()
        }
    }
}

struct NextButtonContent: View {
    var body: some View {
        Text("Next")
            .foregroundColor(.white)
            .frame(width: 200, height: 50)
            .background(Color.blue)
            .cornerRadius(15)
            .padding(.top, 50)
    }
}

struct ContentView1_Previews: PreviewProvider {
    static var previews: some View {
        ContentView1(viewRouter: ViewRouter())
    }
}
