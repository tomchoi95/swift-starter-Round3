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
    var methodsOfPayment: MethodsOfPayment
    var name: String
    
    init(birthYears: Int, job: String, methodsOfPayment: MethodsOfPayment, name: String) {
        self.birthYears = birthYears
        self.job = job
        self.methodsOfPayment = methodsOfPayment
        self.name = name
    }
    
    func orderCoffee(_ orders: [Coffee: Int], of coffeeShop: CoffeeShop) {
        coffeeShop.takeOrder(orders, by: name, payment: methodsOfPayment)
    }
}

class MethodsOfPayment {
    var money: Int
    
    init(money: Int) {
        self.money = money
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
    var pickUpTable: [String: [Coffee: Int]] = [:] {
        willSet {
            let newCustomers = Array<String>(newValue.keys).filter { !Array<String>(pickUpTable.keys).contains($0) }
            for customer in newCustomers {
                if let orderStr = newValue[customer] {
                    print(customer +
                          " 님이 주문하신 " +
                          orderStr.map { $0.key.convertKorean() + " " + String($0.value) + "잔" }.joined(separator: ", ") +
                          "(이/가) 준비되었습니다. 픽업대에서 가져가주세요.")
                }
            }
        }
    }
    var barista: Person
    
    init(sales: Int, menuBoard: [Coffee : Int], barista: Person) {
        self.sales = sales
        self.menuBoard = menuBoard
        self.barista = barista
    }
    
    func takeOrder(_ orders: [Coffee: Int], by customer: String, payment: MethodsOfPayment) {
        guard Set(menuBoard.keys).isSuperset(of: Set(orders.keys)) else {
            let haveNoMenus = Set(orders.keys)
                .filter { !Set(menuBoard.keys).contains($0) }
                .map { $0.convertKorean() }
            
            print("죄송합니다. \(haveNoMenus.joined(separator: ", "))는 준비되지 않은 메뉴입니다.")
            return
        }
        
        let totalPrice: Int = orders.map{ (menuBoard[$0.key] ?? 0) * $0.value }.reduce(0, +)
        print("총 \(totalPrice)원 결제 도와드리겠습니다.")
        
        guard payed(charge: totalPrice, payment: payment) else { return }
        print("결제되셨습니다.\n커피가 준비되면 성함 불러드리겠습니다.")
        
        self.make(orders: orders, for: customer)
    }
    
    func make(orders: [Coffee:Int], for customer: String) {
        
        
        
        pickUpTable[customer] = orders
        //        }
        
        return
    }
    
    func payed(charge: Int?, payment: MethodsOfPayment) -> Bool {
        guard let charge = charge else { return false }
        guard let payed = payment.pay(charge: charge) else { return false }
        self.sales += payed
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

let misterLee = Person(birthYears: 1990, job: "barista", methodsOfPayment: MethodsOfPayment(money: 30000), name: "lee")
let missKim = Person(birthYears: 1996, job: "student", methodsOfPayment: MethodsOfPayment(money: 50000), name: "kim")

let yagombucks = CoffeeShop(sales: 0,
                            menuBoard: [.americano(temperature: .ice): 4500,
                                        .americano(temperature: .hot): 4800,
                                        .latte(temperature: .hot): 4800,
                                        .coldbrew: 5000],
                            barista: misterLee)

missKim.orderCoffee([.americano(temperature: .hot): 3], of: yagombucks)


