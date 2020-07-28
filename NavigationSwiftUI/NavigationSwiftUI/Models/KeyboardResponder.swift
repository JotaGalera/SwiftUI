//
//  KeyboardResponder.swift
//  NavigationSwiftUI
//
//  Created by Javier Galera Garrido on 26/07/2020.
//  Copyright © 2020 Javier Galera Garrido. All rights reserved.
//

import Foundation
import SwiftUI

class KeyboardResponder: ObservableObject {
    @Published var currentHeigth: CGFloat = 0
    
    var center: NotificationCenter
    
    init(center: NotificationCenter = .default){
        self.center = center
        
        self.center.addObserver(self,
                                selector: #selector(keyBoardWillShow(notification:)),
                                name: UIResponder.keyboardWillShowNotification,
                                object: nil)
        self.center.addObserver(self,
                                selector: #selector(keyBoardWillHide(notification:)),
                                name: UIResponder.keyboardWillHideNotification,
                                object: nil)
    }
    
    @objc func keyBoardWillShow(notification: Notification){
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            withAnimation {
                currentHeigth = keyboardSize.height
            }
        }
    }
    
    @objc func keyBoardWillHide(notification: Notification){
        withAnimation {
           currentHeigth = 0
        }
    }
    
}
