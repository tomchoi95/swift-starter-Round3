//
//  step1.swift
//  CodeStarterCamp_Week3
//
//  Created by 조준희 on 9/1/24.
//

import Foundation

class Person {
    var name: String
    var money: Int
    
    init(name: String, money: Int) {
        self.name = name
        self.money = money
    }
    
    func buyCoffee(coffeeShop: CoffeeShop, coffee: Coffee) {
        if let price = coffeeShop.menu[coffee], money >= price {
            money -= price
            print("\(name)님이 \(coffee.rawValue)를 주문했습니다.")
            coffeeShop.takeOrder(coffee: coffee)
        } else {
            print("\(name)님 \(coffee.rawValue)를 구매할 돈이 부족합니다.")
        }
        
    }
}

class CoffeeShop {
    var revenue: Int = 0
    var menu: [Coffee : Int]
    var pickupTable: [Coffee] = []
    var barista: Person?
    
    init(menu: [Coffee : Int]) {
        self.menu = menu
    }
    
    func takeOrder(coffee: Coffee) {
        if let price = menu[coffee] {
            revenue += price
            makeCoffee(coffee: coffee)
        } else {
            print("죄송합니다. \(coffee.rawValue)는 없는 메뉴입니다.")
        }
    }
    
    private func makeCoffee(coffee: Coffee) {
        if let barista = barista {
            print("\(barista.name)가 \(coffee.rawValue)를 만들고 있습니다.")
        } else {
            print("바리스타가 없어서 \(coffee.rawValue)를 만들 수 없습니다.")
        }
        
        pickupTable.append(coffee)
        print("\(coffee.rawValue)가 준비되었습니다!")
    }
    
}

enum Coffee: String {
    case americano = "아메리카노"
    case iceamericano = "아이스 아메리카노"
}

var misterLee: Person = Person(name: "mister Lee", money: 10000)
var missKim: Person = Person(name: "miss Kim", money: 20000)
var yagombuks: CoffeeShop = CoffeeShop(menu: [.americano: 4500, .iceamericano: 5000])
