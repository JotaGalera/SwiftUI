//
//  ViewRouter.swift
//  ChatUI
//
//  Created by Javier Galera Garrido on 03/09/2020.
//  Copyright © 2020 Javier Galera Garrido. All rights reserved.
//
import Foundation
import Combine
import SwiftUI

class ViewRouter: ObservableObject {
    
    let objectWillChange = PassthroughSubject<ViewRouter,Never>()
    
    var currentPage: String = "" {
        didSet {
            objectWillChange.send(self)
        }
    }
    
    init(pageToStartWith: String){
        currentPage = pageToStartWith
    }
}
