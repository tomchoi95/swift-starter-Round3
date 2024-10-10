//
//  cafe.swift
//  CodeStarterCamp_Week3
//
//  Created by 최범수 on 2024-10-03.
//

class CoffeeShop {
    var sales: Int = 0
    var orderList: [(Coffee, String)] = []
    var pickUpTable: [(Coffee, String)] = []
    var barista: Person
    let menu: [Coffee: Int]
    
    init(menu : [Coffee: Int], barista: Person) {
        self.barista = barista
        self.menu = menu
    }

    func takeOrder(_ order: Coffee, by customer: Person) {
        if let price = menu[order] {
            print("\(customer.name)님의 \(order.rawValue) 주문을 받았습니다!")
            orderList.append((order, customer.name))
            customer.money -= price
        } else {
            print("우리집에 그런거 안팔아요")
        }
    }
    
    func makeOrder() {
        if let brewingOrder: (Coffee, String) = orderList.first {
            self.pickUpTable.append(brewingOrder)
            orderList.remove(at: 0)
            print("\(brewingOrder.1)님 주문하신 \(brewingOrder.0.rawValue) 나왔습니다.")
        } else {
            print("만들고 싶어도 오더가 없음")
        }
    }
}
