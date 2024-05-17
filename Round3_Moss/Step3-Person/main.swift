//
//  main.swift
//  Step3-Person
//
//  Created by 이재영 on 2024/05/16.
//
import Foundation

let misterLee = Person(name: "misterLee" ,birthYears: 1990, job: "barista", money: 20_000)
let missKim = Person(name: "missKim" ,birthYears: 1999, job: "student", money: 50_000)

let yagombucks = CoffeeShop(sales: 0,
                            menuBoard: [.americano(temperature: .ice): 4500,
                                        .americano(temperature: .hot): 4800,
                                        .latte(temperature: .hot): 4800,
                                        .coldbrew: 5000],
                            pickUpTable: [:],
                            barista: misterLee)

//print("missKim 의 잔액: ", missKim.money,"yagombucks 의 매출액: ", yagombucks.sales, "픽업대: ", yagombucks.pickUpTable)
missKim.orderCoffee(at: yagombucks, [.americano(temperature: .ice): 5])
//print("missKim 의 잔액: ", missKim.money,"yagombucks 의 매출액: ", yagombucks.sales, "픽업대: ", yagombucks.pickUpTable)


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
        guard let totalPrice = coffeeShop.takeOrder(orders, customer: self) else { return }
        
        guard enoughMoney(charge: totalPrice) else { return }
        
        pay(charge: totalPrice)
        
        coffeeShop.payed(charge: totalPrice)
        
        coffeeShop.makeCoffee(orders: orders, customer: self)
    }
    
    func enoughMoney(charge: Int) -> Bool {
        guard money > charge else {
            print("잔액이 \(charge-money)원만큼 부족합니다.")
            return false
        }
        return true
    }
    
    func pay(charge: Int) {
        self.money -= charge
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
    
    func takeOrder(_ orders: [Coffee: Int], customer: Person) -> Int? {
        guard Set(menuBoard.keys).isSuperset(of: Set(orders.keys)) else {
            let haveNoMenus = Set(orders.keys)
                .filter { !Set(menuBoard.keys).contains($0) }
                .map { $0.convertKorean() }
            
            print("죄송합니다. \(haveNoMenus.joined(separator: ", "))는 준비되지 않은 메뉴입니다.")
            return nil
        }
        
        let totalPrice: Int = orders.map{
            (menuBoard[$0.key] ?? 0) * $0.value
        } .reduce(0, +)
        
        print("총 \(totalPrice)원 결제 도와드리겠습니다.")
        return totalPrice
    }
    
    func makeCoffee(orders: [Coffee:Int], customer: Person) {
        let orderStr = orders.map { $0.key.convertKorean() + " " + String($0.value) + "잔" }
        
        self.pickUpTable = orders.reduce(into: pickUpTable) { result, order in
            result[order.key] = (result[order.key] ?? 0) + order.value
        }
 
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
    case americano(temperature: CoffeeTemperature)
    case latte(temperature: CoffeeTemperature)
    case vanillaLatte(temperature: CoffeeTemperature)
    case coldbrew
    
    func convertKorean() -> String {
        switch self {
        case .americano(temperature: .hot):
            return "따뜻한 아메리카노"
        case .americano(temperature: .ice):
            return "아이스 아메리카노"
        case .latte(temperature: .hot):
            return "따뜻한 라떼"
        case .latte(temperature: .ice):
            return "아이스 라떼"
        case .vanillaLatte(temperature: .hot):
            return "따뜻한 바닐라 라떼"
        case .vanillaLatte(temperature: .ice):
            return "아이스 바닐라 라떼"
        case .coldbrew:
            return "콜드브루"
        }
    }
    
    enum CoffeeTemperature {
        case ice
        case hot
    }
}
