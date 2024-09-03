//
//  person.swift
//  CodeStarterCamp_Week3
//
//  Created by 구현 on 9/2/24.
//

import Foundation

struct Person {
    var name: String
    var money: Int = 0 {
        didSet {
            print("잔액이 \(self.money)원 남았습니다.")
        }
    }
    
    init(name: String, money: Int) {
        self.name = name
        self.money = money
    }
    
    init(name: String) {
        self.name = name
    }
    
    mutating func buyCoffee(_ coffees: [Coffee], shop: CoffeeShop) {
        guard let totalAmount: Int = calculateTotalAmount(items: coffees, at: shop) else {
            print("가게에 없는 메뉴입니다.")
            return
        }
        
        let remainMoney: Int = calculateRemainMoney(with: totalAmount)
        
        guard remainMoney >= 0 else {
            print("\(self.name)의 잔액이 \(-remainMoney)원만큼 부족합니다.")
            return
        }
        
        shop.order(coffees, by: self)
        self.money = remainMoney
    }
    
    func calculateTotalAmount(items: [Coffee], at shop: CoffeeShop) -> Int? {
        var totalAmount: Int = 0
        
        for item in items {
            guard shop.menu.contains(item) else {
                print("\(item.rawValue)(은/는) 없는 품목입니다.")
                return nil
            }
            
            totalAmount += item.price
        }
        
        return totalAmount
    }
    
    func calculateRemainMoney(with totalAmount: Int) -> Int {
        self.money - totalAmount
    }
}
