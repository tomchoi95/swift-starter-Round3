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
    var pickUpTable: [String] = []
    var barista: Person
    var standBy: [String] = []
    var customerNumber = 0
    
    init(menu: [Coffee: Int], barista: Person) {
        self.menu = menu
        self.barista = barista
    }
    
    func getOrder(of customer: Person, order: String) {
        if let menuKey = Coffee(rawValue: order) {
            if let price = menu[menuKey] {
                print("주문하신 \(order)는(은) \(price)원 입니다.")
                customer.buyCoffee(priceCoffee: price)
                if customer.enoughMoney == true {
                    customer.number = self.customerNumber
                    print("\(price)원 받았습니다. 완료되면 \(customerNumber)번 으로 불러드릴게요.")
                    self.standBy.insert(order, at: customerNumber)
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
    func makeCoffee(customerNumber: Int) {
        pickUpTable.insert(standBy[customerNumber], at: customerNumber)
        let bell = pickUpTable.joined()
        print("\(customerNumber)번 손님, 주문하신 \(bell) 나왔습니다!")
    }
    
    func giveCoffee(customer: Person, customerNumber: Int) {
        if customerNumber == customer.number {
            if pickUpTable[customerNumber].isEmpty == true {
                print("이미 픽업 하셨습니다.")
            }
            customer.getCoffee(receive: pickUpTable[customerNumber])
            print("감사합니다. 맛있게 드세요~")
            pickUpTable.remove(at: customerNumber)
        }
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

var yagombucksMenu: [Coffee: Int] = [Coffee.americano: Coffee.americano.price,
                                     Coffee.cafeMocha: Coffee.cafeMocha.price,
                                     Coffee.cafeLatte: Coffee.cafeMocha.price,
                                     Coffee.vanilaLatte: Coffee.vanilaLatte.price]

