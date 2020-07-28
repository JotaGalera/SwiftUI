//
//  FoodData.swift
//  NavigationSwiftUI
//
//  Created by Javier Galera Garrido on 26/07/2020.
//  Copyright © 2020 Javier Galera Garrido. All rights reserved.
//

import Foundation

let foodData: [Food] = [
    Food(title: "Margherita", price: 5.99, category: .pizza, id: 1),
    Food(title: "Prosciutto", price: 6.89, category: .pizza, id: 2),
    Food(title: "Funghi", price: 6.99, category: .pizza, id: 3),
    Food(title: "Calzone", price: 6.99, category: .pizza, id: 4),
    Food(title: "BBQ Burger", price: 9.90, category: .burger, id: 5),
    Food(title: "Cheeseburger", price: 7.90, category: .burger, id: 6),
    Food(title: "Vegan Burger", price: 8.90, category: .burger, id: 7),
    Food(title: "Pulled Pork Burger", price: 11.90, category: .burger, id: 8),
    Food(title: "Spagetthi Bolognese", price: 8.90, category: .pasta, id: 9),
    Food(title: "Penne all'arrabbiata", price: 7.90, category: .pasta, id: 10),
    Food(title: "Aglio e olio", price: 7.90, category: .pasta, id: 11),
    Food(title: "Cheesecake", price: 3.99, category: .dessert, id: 12),
    Food(title: "Cupcake", price: 2.99, category: .dessert, id: 13),
    Food(title: "Icecream", price: 2.99, category: .dessert, id: 14)
]

let foodCategoriesData: [FoodCategoryViewModel] = [
    FoodCategoryViewModel(imageName: "burger", categoryName: "BURGER", foodList: filterData(by: .burger), id: 1),
    FoodCategoryViewModel(imageName: "pasta", categoryName: "PASTA", foodList: filterData(by: .pasta), id: 2),
    FoodCategoryViewModel(imageName: "pizza", categoryName: "PIZZA", foodList: filterData(by: .pizza), id: 3),
    FoodCategoryViewModel(imageName: "dessert", categoryName: "DESSERT", foodList: filterData(by: .dessert), id: 4)
]

