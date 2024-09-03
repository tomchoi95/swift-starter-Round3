//
//  step1.swift
//  CodeStarterCamp_Week3
//
//  Created by 조준희 on 9/1/24.
//

import Foundation

class Person {
    var name: String
    var money: Int?
    
    init(name: String, money: Int) {
        self.name = name
        self.money = money
    }
    
    init(name: String) {
        self.name = name
    }
    
    func order(coffeeShop: CoffeeShop, coffee: Coffee) {
        if let price = coffeeShop.menu[coffee], money! >= price {
            money! -= price
            print("\(name)님이 \(coffee.rawValue)를 주문했습니다.")
            coffeeShop.takeOrder(coffee: coffee)
        } else {
            print("\(coffee.rawValue)를 구매할 돈이 부족합니다.")
        }
        
    }
}

var misterLee: Person = Person(name: "mister Lee")
var missKim: Person = Person(name: "miss Kim", money: 20000)
