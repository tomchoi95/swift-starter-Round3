//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class Person {
    var name: String
    var money: Int {
        didSet {
            print("\(name)의 잔액이 \(money)원 남았습니다.")
        }
    }
    
    init(name: String, money: Int = 0) {
        self.name = name
        self.money = money
    }
    
    func buyCoffee(order coffee: Coffee, in cafe: CoffeeShop) {
        guard let price = cafe.menu[coffee] else {
            print("\(coffee.rawValue)는 \(cafe.shopName)에 없는 메뉴입니다.")
            return
        }
        if price > self.money {
            print("\(name)의 잔액이 부족합니다.")
            return
        }
        print("\(name)(이)가 \(cafe.shopName)에서 \(coffee.rawValue)를 주문했습니다.")
        self.money -= price
        cafe.getOrder(self, order: coffee)
    }
}

class CoffeeShop {
    var shopName: String
    var barista: Person
    var menu: [Coffee: Int]
    var pickUpTable: [(Person, Coffee)]
    var sales: Int {
        didSet {
            print("\(shopName)의 매출액이 \(oldValue)원에서 \(sales)원으로 증가했습니다.")
        }
    }
    
    init(shopName: String, barista: Person, menu: [Coffee : Int], pickUpTable: [(Person, Coffee)] = [], sales: Int = 0) {
        self.shopName = shopName
        self.barista = barista
        self.menu = menu
        self.pickUpTable = pickUpTable
        self.sales = sales
    }
    
    func getOrder(_ customer: Person, order coffee: Coffee) {
        guard let price = self.menu[coffee] else { return }
        sales += price
        
        print("\(shopName)의 바리스타 \(barista.name)가 \(coffee.rawValue)를 만드는 중입니다.")
        pickUpTable.append((customer, coffee))
        print("\(customer.name)님의 \(coffee.rawValue)가 준비되었습니다.")
    }
}

enum Coffee: String {
    case Espresso = "에스프레소"
    case Americano = "아메리카노"
    case CafeLatte = "카페라떼"
    case VanillaLatte = "바닐라라떼"
    case CaramelMacchiato = "카라멜마끼아또"
    case CafeMocha = "카페모카"
}

var misterLee = Person(name: "Lee")
var missKim = Person(name: "Kim", money: 10000)
var misterChoi = Person(name: "Choi", money: 5000)

var yagombucks = CoffeeShop(shopName: "야곰벅스", barista: misterLee, menu: [Coffee.Espresso: 3000, Coffee.Americano: 4000, Coffee.CafeLatte: 5000, Coffee.VanillaLatte: 6000])

missKim.buyCoffee(order: Coffee.Americano, in: yagombucks)
misterChoi.buyCoffee(order: Coffee.CaramelMacchiato, in: yagombucks)
