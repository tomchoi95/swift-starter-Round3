//
//  coffee.swift
//  CodeStarterCamp_Week3
//
//  Created by 구현 on 9/2/24.
//

import Foundation

class CoffeeShop {
    var revenue: Int = 0
    var menu: [Coffee: Int]
    var barista: Person
    var pickUpTable: [Coffee] = []

    init(menu: [Coffee: Int], barista: Person) {
        self.menu = menu
        self.barista = barista
    }

    func order(_ coffees: [Coffee], by buyer: String) {
        guard let (pickUpTable, totalAmount): ([Coffee], Int) = makeOrders(with: coffees) else {
            print("주문을 종료합니다.")
            return
        }

        self.pickUpTable = pickUpTable
        self.revenue += totalAmount
        self.revenue += totalAmount
        printPickUpTable(by: buyer)
         printRevenue()
    }

    func makeOrders(with coffees: [Coffee]) -> ([Coffee], Int)? {
        var pickUpTable: [Coffee] = []
        var totalAmount: Int = 0
        
        for coffee in coffees {
            guard let price: Int = self.menu[coffee] else {
                print("\(coffee)은(는) 없는 품목입니다.")
                return nil
            }
            pickUpTable.append(coffee)
            totalAmount += price
        }
        
        return (pickUpTable, totalAmount)
    }

    func printPickUpTable(by name: String) {
        let pickUpTableJoined: String = self.pickUpTable.map{ $0.rawValue }.joined(separator: ", ")
        print("\(name) 님이 주문하신 \(pickUpTableJoined)(이/가) 준비되었습니다. 픽업대에서 가져가주세요.")
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
