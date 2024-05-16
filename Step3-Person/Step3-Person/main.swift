//
//  main.swift
//  Step3-Person
//
//  Created by 이재영 on 2024/05/16.
//

import Foundation

var misterLee = Person(birthYears: 1990, job: "barista", money: 20_000)
var missKim = Person(birthYears: 1999, job: "student", money: 50_000)

var yagombucks = CoffeeShop(sales: 0,
                            menuBoard: [.americano(temp: .ice): 4500,
                                        .americano(temp: .hot): 4800,
                                        .latte(temp: .hot): 4800,
                                        .coldbrew: 5000],
                            pickUpTable: [:],
                            barista: misterLee)
missKim.orderCoffee(at: yagombucks, [.americano(temp: .ice) : 11])
missKim.orderCoffee(at: yagombucks, [.americano(temp: .ice) : 11])

missKim.orderCoffee(at: yagombucks, [.americano(temp: .ice) : 11, .latte(temp: .ice): 3, .vanillaLatte(temp: .ice): 1])

class Person {
    let birthYears: Int
    var job: String
    var money: Int
    
    init(birthYears: Int, job: String, money: Int) {
        self.birthYears = birthYears
        self.job = job
        self.money = money
    }
    
    func orderCoffee(at coffeeShop: CoffeeShop ,_ orders: [Coffee: Int]) {
        var coffeeShop = coffeeShop
        coffeeShop.takeOrder(orders, customer: self)
    }
    
    func pay(charge: Int) -> Bool {
        guard money > charge else {return false}
        self.money -= charge
        return true
    }
}

struct CoffeeShop {
    var sales: Int
    let menuBoard: [Coffee: Int]
    var pickUpTable: [Coffee: Int]
    var barista: Person
    
    mutating func takeOrder(_ orders: [Coffee: Int], customer: Person) {
        guard Set(menuBoard.keys).isSuperset(of: Set(orders.keys)) else {
            let haveNoMenus = Set(orders.keys)
                .filter( {!Set(menuBoard.keys).contains($0)})
                .map( {$0.convertKor()})
            print("죄송합니다. \(haveNoMenus.joined(separator: ", "))는 준비되지 않은 메뉴입니다.")
            return
        }
        
        let sales: Int = orders.map( {menuBoard[$0.key]! * $0.value}).reduce(0, +)
        print("총 \(sales)원 결제 도와드리겠습니다.")
        
        guard customer.pay(charge: sales) else {
            print("죄송합니다. 결제에 실패했습니다.")
            return
        }
        self.sales += sales
                
        self.pickUpTable = orders.reduce(into: pickUpTable) {
            result, order in
            result[order.key] = (result[order.key] ?? 0) + order.value
        }
        
        print("픽업 테이블에 커피가 준비되었습니다.")
        return
    }
}

enum Coffee: Hashable {
    case americano(temp: CoffeeTemperature)
    case latte(temp: CoffeeTemperature)
    case coldbrew
    case vanillaLatte(temp: CoffeeTemperature)
    
    enum CoffeeTemperature {
        case ice
        case hot
    }
    
    func convertKor() -> String {
        switch self {
        case .americano(temp: .hot):
            return "따뜻한 아메리카노"
        case .americano(temp: .ice):
            return "아이스 아메리카노"
        case .latte(temp: .hot):
            return "따뜻한 라떼"
        case .latte(temp: .ice):
            return "아이스 라떼"
        case .coldbrew:
            return "콜드브루"
        case .vanillaLatte(temp: .hot):
            return "따뜻한 바닐라 라떼"
        case .vanillaLatte(temp: .ice):
            return "아이스 바닐라 라뗴"
        }
    }
}


