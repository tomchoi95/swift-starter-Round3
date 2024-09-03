//
//  step1 - Person.swift
//  CodeStarterCamp_Week3
//
//  Created by 변예린 on 9/3/24.
//

import Foundation

class Person {
    var name: String
    var money = 0
    var enoughMoney: Bool = true
    var number: Int?
    var onHand: [String] = []
    
    init(name: String, money: Int) {
        self.name = name
        self.money = money
    }

    func buyCoffee(priceCoffee: Int) {
        guard money >= priceCoffee else {
            return self.enoughMoney = false }
        self.money = money - priceCoffee
    }
    
    func getCoffee(receive: String) {
        self.onHand.append(receive)
    }
}
