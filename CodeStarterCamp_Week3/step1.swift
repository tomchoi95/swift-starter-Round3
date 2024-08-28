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
    var menu = [String: Int]()
    var pickUpTable: [String] = []
    
    mutating func getOrder(order: [String]) {
        var number = order.count - 1
        
        for _ in 0...number {
            var wholePrice = 0
            if var price = menu.self [order[number]] {
                wholePrice += price
            }
        
        print("총 \(wholePrice)원 입니다.")
        }
    }
    
    mutating func makeCoffee(order: [String]) {
        pickUpTable.self = order
        print("주문하신 커피 나왔습니다!")
    }
}
