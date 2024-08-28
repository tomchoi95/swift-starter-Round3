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

    mutating func buyCoffee(items: [Coffee], shop: CoffeeShop) {
        guard let totalAmount: Int = calculateTotalAmount(items, at: shop) else {
            print("\(name)이(가) 구매를 종료합니다.")
            return
        }
        guard let remainMoney: Int = checkBuyAvailability(totalAmount) else {
            print("\(name)의 돈이 부족합니다. 현재 남은 돈은 \(self.money)원 입니다.")
            return
        }

        self.money = remainMoney
        printOrderList(items)
    }

    func calculateTotalAmount(_ items: [Coffee], at shop: CoffeeShop) -> Int? {
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

    func checkBuyAvailability(_ totalAmount: Int) -> Int? {
        let remainMoney: Int = self.money - totalAmount
        if remainMoney >= 0 {
            return remainMoney
        } else {
            return nil
        }
    }

    func printOrderList(_ items: [Coffee]) {
        let orderListJoined: String = items.map{ $0.rawValue }.joined(separator: ", ")
        print("\(name)이(가) \(orderListJoined)을(를) 구매하였습니다. 현재 남은 돈은 \(self.money)원 입니다.")
    }
}

class CoffeeShop {
    var revenue: Int
    var menu: [Coffee: Int]
    var barista: Person
    var pickUpTable: [Coffee]

    init(menu: [Coffee: Int], barista: Person) {
        self.revenue = 0
        self.menu = menu
        self.barista = barista
        self.pickUpTable = []
    }

    func order(items: [Coffee]) {
        guard let (pickUpTable, revenue): ([Coffee], Int) = checkItemAvailability(items) else {
            print("주문을 종료합니다.")
            return
        }

        self.pickUpTable = pickUpTable
        self.revenue = revenue
        printPickUpTable()
        printRevenue()
    }

    func checkItemAvailability(_ items: [Coffee]) -> ([Coffee], Int)? {
        var pickUpTable: [Coffee] = []
        var revenue: Int = 0
        for item in items {
            guard let price: Int = self.menu[item] else {
                print("\(item)은(는) 없는 품목입니다.")
                return nil
            }
            pickUpTable.append(item)
            revenue += price
        }
        return (pickUpTable, revenue)
    }

    func printPickUpTable() {
        let pickUpTableJoined: String = self.pickUpTable.map{ $0.rawValue }.joined(separator: ", ")
        print("바리스타 \(self.barista.name)(이)가 \(pickUpTableJoined) 주문을 접수하였습니다.")
    }

    func printRevenue() {
        print("오늘의 총매출은 \(self.revenue)원 입니다.")
    }
}

enum Coffee: String {
    case iceAmericano
    case hotAmericano
    case iceChoco
    case hotChoco
    case milkTea
}
