//
//  cafe.swift
//  CodeStarterCamp_Week3
//
//  Created by 최범수 on 2024-10-03.
//

struct CoffeeShop {
    var sales: Int = 0
    var menu: [Coffee:Int] = [.americano:3000, .cafeLatte:3500, .cappuccino:3500, .espresso:3000, .latteMacchiato:3500]
    var pickUpTable: [(String, String)] = []
    var orderList: [(String, String)] = []
    var baristas: [Person] = []
    
    mutating func takeOrder(_ coffee: Coffee, from person: Person) {
        orderList.append((person.name,coffee.rawValue))
        print("\(person.name)님이 \(coffee.rawValue) 주문")
    }
    mutating func makeCoffee() {
        if let brewingCustomerCoffee = orderList.first?.0, let brewingCoffee = orderList.first?.1 {
            pickUpTable.append(orderList.removeFirst())
            print("\(brewingCustomerCoffee)님의 \(brewingCoffee) 준비 완료")
        } else {
            print("주문 내역이 없습니다.")
        }
    }
    mutating func hireBarista(_ barista: Person) {
        baristas.append(barista)
    }
}
