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
    
    init(name: String, money: Int) {
        self.name = name
        self.money = money
    }
    
    init(name: String) {
        self.name = name
    }
    
    func buyCoffee(priceCoffee: Int) {
        guard money >= priceCoffee else {
            print("잔액이 부족합니다!")
            return }
        self.money = money - priceCoffee
    }
}
    
class CoffeeShop {
    var sales: Int = 0
    var menu = [String: Int]()
    var pickUpTable: [String] = []
    
    init(sales: Int, menu: [String : Int]) {
        self.sales = sales
        self.menu = menu
    }
    
    init(menu: [String: Int]) {
        self.menu = menu
    }
    
    func getOrder(order: String) {
        if let priceCoffee = menu[order] {
            print("주문하신 \(order)는(은) \(priceCoffee)원 입니다.")
        } else {
            print("주문하신 메뉴가 없습니다.")
            return }
    }
    
    func makeCoffee(brista: Person, customer: Person, order: String) {
        getOrder(order: order)
        if let priceCoffee = menu[order] {
            customer.buyCoffee(priceCoffee: priceCoffee)
            self.sales += priceCoffee
        }
        pickUpTable.append(order)
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
