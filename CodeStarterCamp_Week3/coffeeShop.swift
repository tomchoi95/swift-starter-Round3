//
//  coffeeShop.swift
//  CodeStarterCamp_Week3
//
//  Created by 조준희 on 9/3/24.
//

import Foundation

class CoffeeShop {
    var revenue: Int = 0
    var menu: [Coffee : Int]
    var pickupTable: [Coffee] = []
    var barista: String
    
    init(menu: [Coffee : Int], barista: String) {
        self.menu = menu
        self.barista = barista
    }
    
    func takeOrder(coffee: Coffee) {
        if let price = menu[coffee] {
            revenue += price
            make(coffee: coffee)
        } else {
            print("죄송합니다. \(coffee.rawValue)는 없는 메뉴입니다.")
        }
    }
    
    private func make(coffee: Coffee) {
        if barista == barista {
            print("\(barista)가 \(coffee.rawValue)를 만들고 있습니다.")
        } else {
            print("바리스타가 없어서 \(coffee.rawValue)를 만들 수 없습니다.")
        }
        
        pickupTable.append(coffee)
        print("\(coffee.rawValue)가 준비되었습니다!")
    }
    
}

var yagombuks: CoffeeShop = CoffeeShop(menu: [.americano: 4500, .iceAmericano: 5000], barista: "mister Lee")
