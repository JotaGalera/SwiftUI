//
//  DetailRow.swift
//  FoodDeliveryUI
//
//  Created by Javier Galera Garrido on 15/07/2020.
//  Copyright © 2020 Javier Galera Garrido. All rights reserved.
//

import SwiftUI

struct DetailRow: View {
    var food: Food
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(food.title)
                    .font(.headline)
                    .padding(.top,10)
                Text("\(food.price , specifier: "%2.2f") $")
                    .font(.caption)
            }
            Spacer()
            Button(action: {print("order received")}) {
                Text("ORDER")
                    .frame(width: 80, height: 50)
                    .background(Color.orange)
                    .cornerRadius(10.0)
            }
        }.padding(20)
        
    }
}

struct DetailRow_Previews: PreviewProvider {
    static var previews: some View {
        DetailRow(food: foodData[0])
    }
}
