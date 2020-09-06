//
//  KeyboardResponder.swift
//  ChatUI
//
//  Created by Javier Galera Garrido on 06/09/2020.
//  Copyright © 2020 Javier Galera Garrido. All rights reserved.
//

import Foundation
import SwiftUI

class KeyboardResponder: ObservableObject {
    @Published var currentHeight: CGFloat = 0
    
    var _center: NotificationCenter
    
    init(center: NotificationCenter = .default){
        _center = center
        _center.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        _center.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: Notification){
        if let keyboardSize = (notification.userInfo? [UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            currentHeight = keyboardSize.height
        }
    }
    
    @objc func keyboardWillHide(notification: Notification){
        currentHeight = 0
    }
}
