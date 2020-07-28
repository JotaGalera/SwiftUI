import Foundation

enum Categories {
    case burger
    case pizza
    case dessert
    case pasta
}

func categoryString(for category: Categories)->String{
    switch category {
        case .burger:
            return "Burger"
        case .pizza:
            return "Pizza"
        case .pasta:
            return "Pasta"
        case .dessert:
            return "Dessert"
    }
}

func filterData(by category: Categories) -> [Food] {
    var filteredArray = [Food]()
    
    for food in foodData{
        if food.category == category{
            filteredArray.append(food)
        }
    }
    return filteredArray
}
