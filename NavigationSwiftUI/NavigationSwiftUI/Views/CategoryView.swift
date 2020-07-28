//
//  CategoryView.swift
//  NavigationSwiftUI
//
//  Created by Javier Galera Garrido on 26/07/2020.
//  Copyright © 2020 Javier Galera Garrido. All rights reserved.
//

import SwiftUI

struct MenuView: View {

    var foodCategoryViewModel: [FoodCategoryViewModel]
    
    var body: some View {
        List(foodCategoryViewModel){ categoryFood in
            CategoryView(foodCategoryViewModel: categoryFood)
        }
    }
}

struct CategoryView: View {

    var foodCategoryViewModel: FoodCategoryViewModel
    
    var body: some View{
        NavigationLink(destination: DetailView(categoryViewModel: foodCategoryViewModel)) {
                HStack{
                    Spacer()
                    ZStack{
                        Image("\(foodCategoryViewModel.imageName)")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 300, height: 150)
                            .clipped()
                            .cornerRadius(20)
                        Text(foodCategoryViewModel.categoryName)
                            .font(.custom("HelveticaNeue-Medium", size: 50))
                            .foregroundColor(Color.white)
                    }
                    Spacer()
                }
                .padding(.top, 5)
                .padding(.bottom, 5)
            }
        }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(foodCategoryViewModel: foodCategoriesData)
    }
}
