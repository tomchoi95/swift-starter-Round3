//
//  Person.swift
//  CodeStarterCamp_Week3
//
//  Created by 최범수 on 2024-10-07.
//

class Person {
    let name: String
    var money: Int

    init(name: String, money: Int) {
        self.name = name
        self.money = money
    }
    
    func placeOrder (_ coffee: Coffee, at cafe: CoffeeShop) {
        cafe.takeOrder(coffee, by: self)
    }
}
