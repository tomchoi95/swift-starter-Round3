//
//  main.swift
//  Step3-Person
//
//  Created by 이재영 on 2024/05/16.
//
import Foundation

var misterLee = Person(name: "misterLee" ,birthYears: 1990, job: "barista", money: 20_000)
var missKim = Person(name: "missKim" ,birthYears: 1999, job: "student", money: 50_000)

var yagombucks = CoffeeShop(sales: 0,
                            menuBoard: [.americano(temp: .ice): 4500,
                                        .americano(temp: .hot): 4800,
                                        .latte(temp: .hot): 4800,
                                        .coldbrew: 5000],
                            pickUpTable: [:],
                            barista: misterLee)

class Person {
    let birthYears: Int
    var job: String
    var money: Int
    var name: String
    
    init(name: String, birthYears: Int, job: String, money: Int) {
        self.name = name
        self.birthYears = birthYears
        self.job = job
        self.money = money
    }
    
    func orderCoffee(at coffeeShop: CoffeeShop ,_ orders: [Coffee: Int]) {
        var coffeeShop = coffeeShop
        
        let totalPrice = coffeeShop.takeOrder(orders, customer: self)
        
        guard totalPrice != -1 else {return}
        
        guard pay(charge: totalPrice) else {return}
        
        coffeeShop.payed(charge: totalPrice)
        
        coffeeShop.makeCoffee(orders: orders, customer: self)
    }
    
    func pay(charge: Int) -> Bool {
        guard money > charge else {
            print("잔액이 \(charge-money)원만큼 부족합니다.")
            return false
        }
        self.money -= charge
        return true
    }
}

class CoffeeShop {
    var sales: Int
    let menuBoard: [Coffee: Int]
    var pickUpTable: [Coffee: Int]
    var barista: Person
    
    init(sales: Int, menuBoard: [Coffee : Int], pickUpTable: [Coffee : Int], barista: Person) {
        self.sales = sales
        self.menuBoard = menuBoard
        self.pickUpTable = pickUpTable
        self.barista = barista
    }
    
    func takeOrder(_ orders: [Coffee: Int], customer: Person) -> Int {
        guard Set(menuBoard.keys).isSuperset(of: Set(orders.keys)) else {
            let haveNoMenus = Set(orders.keys)
                .filter {!Set(menuBoard.keys).contains($0)}
                .map {$0.convertKor()}
            
            print("죄송합니다. \(haveNoMenus.joined(separator: ", "))는 준비되지 않은 메뉴입니다.")
            return -1
        }
        
        let totalPrice: Int = orders.map {menuBoard[$0.key]! * $0.value}.reduce(0, +)
        print("총 \(totalPrice)원 결제 도와드리겠습니다.")
        return totalPrice
    }
    
    func makeCoffee(orders: [Coffee:Int], customer: Person) {
        let orderStr = orders.map {$0.key.convertKor() + " " + String($0.value) + "잔"}
        self.pickUpTable = orders.reduce(into: pickUpTable) {
            result, order in
            result[order.key] = (result[order.key] ?? 0) + order.value}
            
        print(customer.name +
              " 님이 주문하신 " +
              orderStr.joined(separator: ", ") +
              " (이/가) 준비되었습니다. 픽업대에서 가져가주세요.")
        return
    }
    
    func payed(charge: Int) {
        self.sales += charge
    }
}

enum Coffee: Hashable {
    case americano(temp: CoffeeTemperature)
    case latte(temp: CoffeeTemperature)
    case coldbrew
    case vanillaLatte(temp: CoffeeTemperature)
    
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
            return "아이스 바닐라 라떼"
        }
    }
    
    enum CoffeeTemperature {
        case ice
        case hot
    }
}
