//
//  step1.swift
//  CodeStarterCamp_Week3
//
//  Created by 변예린 on 8/28/24.
//

import Foundation

struct Person {
    var name: String
    var money: Int = 1000
    
    mutating func buyCoffee(price: Int) {
        money.self = money.self - price
    }
}

struct CoffeeShop {
    var sales: Int = 0
    var menu = [Coffee: Int]()
    var pickUpTable: [Coffee] = []
    var barista: Person?
    var customer: Person?
    
    mutating func getOrder(orders: [Coffee]) {
        var wholePrice = 0
        for order in orders {
            guard Coffee.allCases.contains(order) else {
                print("주문하신 메뉴가 없습니다.")
                return
            }
            if var price = menu[order] {
                wholePrice += price
            }
        }
        print("총 \(wholePrice)원 입니다.")
    }
    
    mutating func makeCoffee(orders: [Coffee]) {
        pickUpTable.self = orders.map { (made: Coffee) -> Coffee in return made}
        print("주문하신 \(pickUpTable) 나왔습니다!")
    }
}

enum Coffee: String, CaseIterable {
    case americano = "Americano"
    case cafeLatte = "Cafe Latte"
    case vanilaLatte = "Vanila Latte"
    case cafeMocha = "Cafe Mocha"
}

var misterLee = Person(name: "misterLee", money: 10000000)
var missKim = Person(name: "missKim", money: 10000)
