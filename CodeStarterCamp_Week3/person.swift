//
//  person.swift
//  CodeStarterCamp_Week3
//
//  Created by 구현 on 9/2/24.
//

import Foundation

struct Person {
    var name: String
    var money: Int = 0

    init(name: String, money: Int) {
        self.name = name
        self.money = money
    }
    
    init(name: String) {
        self.name = name
    }

    mutating func buyCoffee(_ coffees: [Coffee], shop: CoffeeShop) {
        guard let totalAmount: Int = calculateTotalAmount(items: coffees, at: shop) else {
            print("\(name)이(가) 구매를 종료합니다.")
            return
        }
        guard let remainMoney: Int = calculateRemainMoney(with: totalAmount) else {
            print("\(name)의 돈이 부족합니다. 현재 남은 돈은 \(self.money)원 입니다.")
            return
        }

        shop.order(coffees, by: self)
        self.money = remainMoney
        printOrderList(of: coffees)
    }

    func calculateTotalAmount(items: [Coffee], at shop: CoffeeShop) -> Int? {
        let menu: [Coffee: Int] = shop.menu
        var totalAmount: Int = 0
        
        for item in items {
            guard let price: Int = menu[item] else {
                print("\(item.rawValue)은(는) 없는 품목입니다.")
                return nil
            }
            totalAmount += price
        }
        
        return totalAmount
    }

    func calculateRemainMoney(with totalAmount: Int) -> Int? {
        let remainMoney: Int = self.money - totalAmount
        
        guard remainMoney >= 0 else {
            return nil
        }
        
        return remainMoney
    }

    func printOrderList(of items: [Coffee]) {
        let orderListJoined: String = items.map{ $0.rawValue }.joined(separator: ", ")
        print("\(name)이(가) \(orderListJoined)을(를) 구매하였습니다. 현재 남은 돈은 \(self.money)원 입니다.")
    }
}
