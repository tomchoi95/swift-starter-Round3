//
//  Person.swift
//  CodeStarterCamp_Week3
//
//  Created by 최범수 on 2024-10-07.
//

class Person {
    var money: Int
    let name : String
    
    init(name: String, money: Int) {
        self.name = name
        self.money = money
    }
    
    func buyCoffee(at coffeeShop: CoffeeShop) {
        print("커피 구입")
    }
}
