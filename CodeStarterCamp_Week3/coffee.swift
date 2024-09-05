//
//  coffee.swift
//  CodeStarterCamp_Week3
//
//  Created by 구현 on 9/2/24.
//

import Foundation

class CoffeeShop {
    var menu: [Coffee]
    var barista: Person
    var buyer: Person!
    var pickUpTable: [Coffee] = [] {
        didSet {
            printPickUpTable()
        }
    }
    var revenue: Int = 0 {
        didSet {
            printRevenue()
        }
    }
    
    init(menu: [Coffee], barista: Person) {
        self.menu = menu
        self.barista = barista
    }
    
    func order(_ coffees: [Coffee], by buyer: Person) {
        guard let (pickUpTable, totalAmount): ([Coffee], Int) = makeOrders(with: coffees) else {
            return
        }
        
        self.buyer = buyer
        self.pickUpTable = pickUpTable
        self.revenue += totalAmount
    }
    
    func makeOrders(with coffees: [Coffee]) -> ([Coffee], Int)? {
        var pickUpTable: [Coffee] = []
        var totalAmount: Int = 0
        
        for coffee in coffees {
            guard self.menu.contains(coffee) else {
                print("\(coffee.rawValue)(은/는) 없는 품목입니다.")
                return nil
            }
            
            pickUpTable.append(coffee)
            totalAmount += coffee.price
        }
        
        return (pickUpTable, totalAmount)
    }
    
    func printPickUpTable() {
        let pickUpTableJoined: String = self.pickUpTable.map{ $0.rawValue }.joined(separator: ", ")
        print("\(self.buyer.name) 님이 주문하신 \(pickUpTableJoined)(이/가) 준비되었습니다. 픽업대에서 가져가주세요.")
    }
    
    func printRevenue() {
        print("오늘의 총매출은 \(self.revenue)원 입니다.")
    }
}

enum Coffee: String {
    case iceAmericano = "아이스아메리카노"
    case hotAmericano = "뜨거운아메리카노"
    case iceChoco = "아이스초코"
    case hotChoco = "핫초코"
    case milkTea = "밀크티"
    
    var price: Int {
        switch self {
        case .iceAmericano:
            return 2000
        case .hotAmericano:
            return 1500
        case .iceChoco:
            return 4500
        case .hotChoco:
            return 4000
        case .milkTea:
            return 5000
        }
    }
}
