//
//  step1.swift
//  CodeStarterCamp_Week3
//
//  Created by 변예린 on 8/28/24.
//

import Foundation
    
class CoffeeShop {
    var sales: Int = 0
    var menu = [Coffee: Int]()
    var pickUpTable: [Coffee]? = []
    var barista: Person
    var standBy: [Coffee] = []
    var customerNumber = 0
    
    init(menu: [Coffee: Int], barista: Person) {
        self.menu = menu
        self.barista = barista
    }
    
    func getOrder(of customer: Person, coffeeOrder: String) {
        if let menuKey = Coffee(rawValue: coffeeOrder) {
            if let price = menu[menuKey] {
                print("주문하신 \(coffeeOrder)는(은) \(price)원 입니다.")
                customer.buy(price: price)
                if customer.enoughMoney == true {
                    customer.waitingNumber = self.customerNumber
                    print("\(price)원 받았습니다. 완료되면 \(customerNumber)번 으로 불러드릴게요.")
                    self.standBy.insert(menuKey, at: customerNumber)
                    self.sales += price
                    self.customerNumber += 1
                } else {
                    print("잔액이 부족합니다.")
                }
            } else {
                print("주문하신 메뉴가 없습니다.")
                return
            }
        }
    }
    func makeCoffee(of customerNumber: Int) {
        self.pickUpTable?.insert(standBy[customerNumber], at: customerNumber)
        if let pickUpTable = pickUpTable?[customerNumber] {
            let bell = pickUpTable.rawValue
            print("\(customerNumber)번 손님, 주문하신 \(bell) 나왔습니다!")
        }
    }
    func giveCoffee(to customerNumber: Int, customer: Person) {
        guard customerNumber == customer.waitingNumber else {
            print("고객 번호가 다릅니다.")
            return
        }
        guard let pickUp = pickUpTable?[customerNumber] else {
            print("이미 픽업 하셨습니다.")
            return
            }
        customer.get(coffee: pickUp.rawValue)
        print("감사합니다. 맛있게 드세요~")
        self.pickUpTable?.remove(at: customerNumber)
        }
}

enum Coffee: String {
    case americano = "아메리카노"
    case cafeMocha = "카페모카"
    case cafeLatte = "카페라떼"
    case vanilaLatte = "바닐라라떼"
    
    var price: Int {
        switch self {
        case .americano:
            return 1500
        case .cafeMocha:
            return 4000
        case .cafeLatte:
            return 4000
        case .vanilaLatte:
            return 4500
        }
    }
}

var yagombucksMenu: [Coffee: Int] = [.americano: Coffee.americano.price,
                                     .cafeMocha: Coffee.cafeMocha.price,
                                     .cafeLatte: Coffee.cafeMocha.price,
                                     .vanilaLatte: Coffee.vanilaLatte.price]

