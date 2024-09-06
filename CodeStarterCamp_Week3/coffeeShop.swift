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
    var barista: Person
    
    init(menu: [Coffee : Int], barista: Person) {
        self.menu = menu
        self.barista = barista
    }
    
    func takeOrder(coffee: Coffee, name: String) {
        if let price = menu[coffee] {
            revenue += price
            make(_: coffee, from: name)
        } else {
            print("죄송합니다. \(coffee.rawValue)는 없는 메뉴입니다.")
        }
    }
    
    private func make(_ coffee: Coffee, from name: String) {
        print("\(barista.name)가 \(coffee.rawValue)를 만들고 있습니다.")
        pickupTable.append(coffee)
        print("\(name) 님이 주문하신 \(coffee.rawValue)(이/가) 준비되었습니다. 픽업대에서 가져가주세요.")
    }
    
}

var yagombuks: CoffeeShop = CoffeeShop(
    menu: [
        .americano: 4500,
        .iceAmericano: 5000,
        .espresso: 4500,
        .latte: 6000,
        .cappuccino: 6500
    ],
    barista: misterLee)
