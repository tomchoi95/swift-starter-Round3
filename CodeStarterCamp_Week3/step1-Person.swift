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
    var waitingNumber: Int?
    var onHand: [String] = []
    
    init(name: String, money: Int) {
        self.name = name
        self.money = money
    }
    
    init(name: String, money: Int, onHand: [String]) {
        self.name = name
        self.money = money
        self.onHand = onHand
    }

    func buy(price: Int) {
        guard money >= price else {
            return self.enoughMoney = false
        }
        self.money -= price
    }
    
    func get(coffee: String) {
        self.onHand.append(coffee)
    }
}
