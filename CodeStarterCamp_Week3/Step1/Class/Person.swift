//
//  Person.swift
//  CodeStarterCamp_Week3
//
//  Created by 배정길 on 7/31/24.
//

import Foundation

// Person 타입 정의
class Person {
    var name: String
    var money: Int
    
    init(name: String, money: Int) {
        self.name = name
        self.money = money
    }
    
    func buy(coffee: Coffee, from shop: CoffeeShop) {
        let price = shop.menu[coffee] ?? 0
        
        if money >= price {
            print("\(name)은 커피 \(coffee.rawValue)를 \(price)원에 샀다.")
            
            money -= price
            shop.revenue += price
            shop.make(coffee: coffee)
        } else {
            print("\(name)은 \(coffee.rawValue)를 구매할 돈이 부족하다.")
        }
    }
}
