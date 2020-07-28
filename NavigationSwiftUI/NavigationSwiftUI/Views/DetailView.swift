//
//  DetailView.swift
//  NavigationSwiftUI
//
//  Created by Javier Galera Garrido on 26/07/2020.
//  Copyright © 2020 Javier Galera Garrido. All rights reserved.
//

import SwiftUI

struct DetailView: View {
        
    var categoryViewModel : FoodCategoryViewModel
    
    var body: some View {
        List(categoryViewModel.foodList) { food in
            DetailRowView(food: food)
        }
    }
}

#if DEBUG
struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(categoryViewModel: FoodCategoryViewModel(imageName: "burger", categoryName: "burger", foodList: filterData(by: .burger), id: 1))
    }
}
#endif
