//
//  coffee.swift
//  CodeStarterCamp_Week3
//
//  Created by 구현 on 9/2/24.
//

import Foundation

class CoffeeShop {
    var revenue: Int
    var menu: [Coffee: Int]
    var barista: Person
    var pickUpTable: [Coffee] = []

    init(menu: [Coffee: Int], barista: Person) {
        self.revenue = 0
        self.menu = menu
        self.barista = barista
    }

    func order(coffees: [Coffee]) {
        guard let (pickUpTable, totalAmount): ([Coffee], Int) = makeOrders(with: coffees) else {
            print("주문을 종료합니다.")
            return
        }

        self.pickUpTable = pickUpTable
        self.revenue += totalAmount
        self.revenue += totalAmount
        printPickUpTable()
        printRevenue()
    }

    func makeOrders(with items: [Coffee]) -> ([Coffee], Int)? {
        var pickUpTable: [Coffee] = []
        var totalAmount: Int = 0
        
        for item in items {
            guard let price: Int = self.menu[item] else {
                print("\(item)은(는) 없는 품목입니다.")
                return nil
            }
            pickUpTable.append(item)
            totalAmount += price
        }
        return (pickUpTable, totalAmount)
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
