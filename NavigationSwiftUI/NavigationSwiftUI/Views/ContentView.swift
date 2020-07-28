//
//  ContentView.swift
//  NavigationSwiftUI
//
//  Created by Javier Galera Garrido on 26/07/2020.
//  Copyright © 2020 Javier Galera Garrido. All rights reserved.
//

import SwiftUI

let lightGreyColor = Color(red: 239.0/255.0,
                           green: 243.0/255.0,
                           blue: 244.0/255.0,
                           opacity: 1.0)

let storedUsername = "User"
let storedPassword = "user"

struct ContentView: View {
    
    @State var username = ""
    @State var password = ""

    @State var editMode = false
    
    @ObservedObject var keyboardResponder = KeyboardResponder()
    
    var body: some View {
        VStack {
            NavigationView{
                ZStack{
                    VStack{
                        WelcomeText()
                        UserImage()
                        UsernameField(username: $username, editMode: $editMode)
                        PasswordField(password: $password, editMode: $editMode)
                        LoginNavigation2(username: username, password: password)
//                        LoginButton(username: username, password: password)
                    }.padding()
    //                if authenticationDidSucceed {
    //                    Text("Login succesful!")
    //                        .font(.headline)
    //                        .frame(width:250,height: 80)
    //                        .background(Color.green)
    //                        .cornerRadius(20)
    //                        .foregroundColor(Color.white)
    //                        .animation(Animation.default)
    //                }
                }.offset(y: -keyboardResponder.currentHeigth*0.5)
            }
        }
    }
}

struct WelcomeText: View {
    var body: some View {
        Text("Welcome!")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom,20)
    }
}

struct UserImage: View {
    var body: some View {
        Image("gitHub")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width:150, height: 150)
            .clipped()
            .cornerRadius(150)
            .padding(.bottom, 75)
    }
}

struct UsernameField: View {
    @Binding var username: String
    @Binding var editMode: Bool
    
    var body: some View {
        TextField("Username", text: $username, onEditingChanged: {edit in
            if edit {
                self.editMode = true
            } else {
                self.editMode = false
            }
        } )
            .padding()
            .background(lightGreyColor)
            .cornerRadius(5)
            .padding(.bottom, 20)
    }
}

struct PasswordField: View {
    @Binding var password: String
    @Binding var editMode: Bool
    
    var body: some View {
        SecureField("Password", text: $password)
            .padding()
            .background(lightGreyColor)
            .cornerRadius(5.0)
            .padding(.bottom, 20)
    }
}

struct LoginNavigation2: View {
    
    var username: String
    var password: String
    
    @State var authenticationDidFail: Bool = false
    @State var authenticationDidSucceed: Bool = false
    
    
    var body: some View {
        VStack{
            NavigationLink(destination: MenuView(foodCategoryViewModel: foodCategoriesData),isActive: $authenticationDidSucceed){
                LoginButton(username: username, password: password,
                    authenticationDidFail:
                    $authenticationDidFail,
                    authenticationDidSucceed:
                    $authenticationDidSucceed)
//                Button(action: {
//                    if self.username == storedUsername{
//                        self.authenticationDidSucceed = true
//                    }else{
//                        self.authenticationDidFail = true
//                    }
//                }){
//                    LoginButtonContent()
//                }
            }
        }
    }
}

struct LoginButton: View {
    var username: String
    var password: String
    
    @Binding var authenticationDidFail: Bool
    @Binding var authenticationDidSucceed: Bool
    
    var body: some View {
        VStack{
            Button(action: {
                if self.username == storedUsername{
                    self.authenticationDidSucceed = true
                }else{
                    self.authenticationDidFail = true
                }
            })
            {
                LoginButtonContent()
            }.padding()
            if authenticationDidFail{
                LoginErrorContent()
            }
        }
    }
}

struct LoginButtonContent: View {
    var body: some View {
        Text("LOGIN")
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 220, height: 60)
            .background(Color.black)
            .cornerRadius(15.0)
    }
}

struct LoginErrorContent: View {
    var body: some View{
        Text("Information not correct. Try again.")
        .foregroundColor(.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
