//
//  Food.swift
//  NavigationSwiftUI
//
//  Created by Javier Galera Garrido on 26/07/2020.
//  Copyright © 2020 Javier Galera Garrido. All rights reserved.
//

import Foundation

class Food: Identifiable {
    let title: String
    let price: Double
    let category: CategoriesFood
    let id: Int
    
    init(title: String, price: Double, category: CategoriesFood, id: Int) {
        self.title = title
        self.price = price
        self.category = category
        self.id = id
    }
}

func filterData(by category: CategoriesFood) -> [Food] {
    let foodFilteredList = foodData.filter({ $0.category == category })
    
    return foodFilteredList
}

