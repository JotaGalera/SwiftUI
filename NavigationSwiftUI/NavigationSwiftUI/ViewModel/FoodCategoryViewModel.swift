//
//  FoodCategoryViewModel.swift
//  NavigationSwiftUI
//
//  Created by Javier Galera Garrido on 26/07/2020.
//  Copyright © 2020 Javier Galera Garrido. All rights reserved.
//

import SwiftUI

struct FoodCategoryViewModel : Identifiable {
    let imageName: String
    let categoryName: String
    let foodList: [Food]
    let id: Int
}
