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
    var buyer: Person?
    var pickUpTable: [Coffee] = [] {
        didSet {
            printPickUpTable()
        }
    }

    init(menu: [Coffee: Int], barista: Person) {
        self.menu = menu
        self.barista = barista
    }

    func order(_ coffees: [Coffee], by buyer: Person) {
        guard let (pickUpTable, totalAmount): ([Coffee], Int) = makeOrders(with: coffees) else {
            print("주문 정보가 올바르지 않습니다.")
            return
        }
        
        self.buyer = buyer
        self.pickUpTable = pickUpTable
        self.revenue += totalAmount
        self.revenue += totalAmount
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

    func printPickUpTable() {
        guard let buyerName: String = self.buyer?.name else {
            print("주문자의 정보가 올바르지 않습니다.")
            return
        }
        
        let pickUpTableJoined: String = self.pickUpTable.map{ $0.rawValue }.joined(separator: ", ")
        print("\(buyerName) 님이 주문하신 \(pickUpTableJoined)(이/가) 준비되었습니다. 픽업대에서 가져가주세요.")
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
