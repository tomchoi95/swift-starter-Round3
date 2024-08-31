//
//  step1.swift
//  CodeStarterCamp_Week3
//
//  Created by 변예린 on 8/28/24.
//

import Foundation

class Person {
    var name: String
    var money = 0
    var enoughMoney: Bool = true
    
    init(name: String, money: Int) {
        self.name = name
        self.money = money
    }

    func buyCoffee(priceCoffee: Int) {
        guard money >= priceCoffee else {
            return self.enoughMoney = false }
        self.money = money - priceCoffee
    }
}
    
class CoffeeShop {
    var sales: Int = 0
    var menu = [String: Int]()
    var pickUpTable: [String] = []
    var barista: Person
    var standBy: String?
    
    init(menu: [String: Int], barista: Person) {
        self.menu = menu
        self.barista = barista
    }
    
    func getOrder(customer: Person, order: String) {
        if let priceCoffee = menu[order] {
            print("주문하신 \(order)는(은) \(priceCoffee)원 입니다.")
            customer.buyCoffee(priceCoffee: priceCoffee)
            if customer.enoughMoney == true {
                print("\(priceCoffee)원 받았습니다. 완료되면 불러드릴게요.")
                self.standBy = order
                self.sales += priceCoffee
            } else {
                print("잔액이 부족합니다.")
            }
        } else {
            print("주문하신 메뉴가 없습니다.")
            return }
    }
    
    func makeCoffee() {
        if var done = standBy {
            pickUpTable.append(done)
            let bell = pickUpTable.joined(separator: ", ")
            print("주문하신 \(bell) 나왔습니다!")
        }
    }
}

enum Coffee: String {
    case americano = "아메리카노"
    case cafeMocha = "카페모카"
    case cafeLatte = "카페라떼"
    case vanilaLatte = "바닐라라떼"
}

var yagombucksMenu: [String: Int] = [Coffee.americano.rawValue: 1500,
                                     Coffee.cafeMocha.rawValue: 4000,
                                     Coffee.cafeLatte.rawValue: 4000,
                                     Coffee.vanilaLatte.rawValue: 4500]

var misterLee: Person = Person(name: "이철수", money: 1000)
var missKim: Person = Person(name: "김미나", money: 10000)

var yagombucks: CoffeeShop = CoffeeShop(menu: yagombucksMenu, barista: misterLee)
