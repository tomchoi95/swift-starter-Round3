//
//  main.swift
//  Step3-Person
//
//  Created by 이재영 on 2024/05/16.
//
import Foundation

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
    
    func orderCoffee(_ orders: [Coffee: Int], of coffeeShop: CoffeeShop) {
        coffeeShop.takeOrder(orders, by: self)
    }
    
    func enoughMoney(charge: Int) -> Bool {
        guard money > charge else {
            print("잔액이 \(charge-money)원만큼 부족합니다.")
            return false
        }
        return true
    }
    
    func pay(charge: Int) -> Int? {
        guard self.enoughMoney(charge: charge) else { return nil }
        
        self.money -= charge
        return charge
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
    
    func takeOrder(_ orders: [Coffee: Int],by customer: Person) {
        guard Set(menuBoard.keys).isSuperset(of: Set(orders.keys)) else {
            let haveNoMenus = Set(orders.keys)
                .filter { !Set(menuBoard.keys).contains($0) }
                .map { $0.convertKorean() }
            
            print("죄송합니다. \(haveNoMenus.joined(separator: ", "))는 준비되지 않은 메뉴입니다.")
            return
        }
        
        let totalPrice: Int = orders.map{ (menuBoard[$0.key] ?? 0) * $0.value }.reduce(0, +)
        print("총 \(totalPrice)원 결제 도와드리겠습니다.")
        
        guard payed(charge: customer.pay(charge: totalPrice)) else { return }
        print("결제되셨습니다.\n커피가 준비되면 성함 불러드리겠습니다.")
        
        self.make(orders: orders, for: customer.name)
    }
    
    func make(orders: [Coffee:Int], for customer: String) {
        let orderStr = orders.map { $0.key.convertKorean() + " " + String($0.value) + "잔" }
        
        self.pickUpTable = orders.reduce(into: pickUpTable) { result, order in
            result[order.key] = (result[order.key] ?? 0) + order.value
        }
 
        print(customer +
              " 님이 주문하신 " +
              orderStr.joined(separator: ", ") +
              "(이/가) 준비되었습니다. 픽업대에서 가져가주세요.")
        return
    }
    
    func payed(charge: Int?) -> Bool {
        guard let charge = charge else {return false}
        self.sales += charge

        return true
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

let misterLee = Person(name: "misterLee" ,birthYears: 1990, job: "barista", money: 20_000)
let missKim = Person(name: "missKim" ,birthYears: 1999, job: "student", money: 50_000)

let yagombucks = CoffeeShop(sales: 0,
                            menuBoard: [.americano(temperature: .ice): 4500,
                                        .americano(temperature: .hot): 4800,
                                        .latte(temperature: .hot): 4800,
                                        .coldbrew: 5000],
                            pickUpTable: [:],
                            barista: misterLee)

missKim.orderCoffee([.americano(temperature: .hot): 3], of: yagombucks)
