//
//  Person.swift
//  CodeStarterCamp_Week3
//
//  Created by 배정길 on 7/31/24.
//

import Foundation

// Person 타입 정의
class Person {
    var name: String            // 이름
    var money: Double           // 돈
    
    init(name: String, money: Double) {
        self.name = name
        self.money = money
    }
    
    func buyCoffee(coffee: Coffee, from shop: CoffeeShop) {
        let price = shop.menu[coffee] ?? 0      // 커피숍에 커피 가격
        if money >= price {                     // 구매자의 돈이 커피가격보다 크다면 커피를 살수 있다.
            money -= price                      // 구매자의 구매한 만큼 차감된 금액
            shop.revenue += price               // 매출액
            shop.makeCoffe(coffee: coffee)      // 커피를 만듬
            print("\(name)은 커피 \(coffee.rawValue)를 \(price)원에 샀다.")
        } else {
            print("\(name)은 \(coffee.rawValue)를 구매할 돈이 부족하다.")
        }
    }
}
