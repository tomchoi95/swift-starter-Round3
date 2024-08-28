//
//  step1.swift
//  CodeStarterCamp_Week3
//
//  Created by 구현 on 8/28/24.
//

import Foundation

struct Person {
    var name: String
    var money: Int
    init(name: String, money: Int) {
        self.name = name
        self.money = money
    }
    mutating func buyCoffee(price: Int, cups: Int) {
        let remainMoney: Int = self.money - (price * cups)

        if remainMoney >= 0 {
            self.money = remainMoney
            print("\(name)이(가) 커피를 구매하였습니다. 현재 남은 돈은 \(self.money)원 입니다.")
        } else {
            print("\(name)의 돈이 부족합니다. 현재 남은 돈은 \(self.money)원 입니다.")
        }
    }
}

class CoffeeShop {
    var revenue: Int
    var menu: [String: Int]
    var pickUpTable: [String]
    init(menu: [String: Int]) {
        self.revenue = 0
        self.menu = menu
        self.pickUpTable = []
    }
    func order(_ items: String...) {
        for item in items {
            if self.menu[item] != nil {
                self.pickUpTable.append(item)
            } else {
                print("\(item)은(는) 없는 품목입니다.")
            }
        }
        print("\(self.pickUpTable) 주문 접수되었습니다.")
    }
}
