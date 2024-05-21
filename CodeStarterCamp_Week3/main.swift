//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class Person {
    let name: String
    let job: String
    var money: Int
    var receiveCoffees = [Coffee]()
    
    init(name: String, job: String, money: Int) {
        self.name = name
        self.job = job
        self.money = money
    }
    
    func orderCoffee(with coffeeList: [Coffee], at coffeeShop: CoffeeShop) {
        for coffee in coffeeList {
            if let price = coffeeShop.menu[coffee] {
                money -= price
            }
        }
    }
    
    func drinkCoffee() {
        receiveCoffees = []
    }
}

class CoffeeShop {
    let name: String
    var sales: Int
    let barista: Person
    let menu: [Coffee: Int]
    var pickUpTable = [Coffee]()
    
    init(name: String, sales: Int, barista: Person, menu: [Coffee: Int]) {
        self.name = name
        self.sales = sales
        self.barista = barista
        self.menu = menu
    }
    
    func takeOrder(coffeeList: [Coffee], orderer: Person) {
        for coffee in coffeeList {
            if let price = menu[coffee] {
                sales += price
            }
            pickUpTable.append(coffee)
        }
        print(pickUpTable)
    }
    
    func serveCoffee(orderer: Person) {
        orderer.receiveCoffees = pickUpTable
        pickUpTable = []
    }
}

enum Coffee {
    case espresso
    case americano
    case caffeLatte
    case vanillaLatte
}

