//
//  cafe.swift
//  CodeStarterCamp_Week3
//
//  Created by 최범수 on 2024-10-03.
//

struct Person {
    var money: Int = 0
    
    func buyCoffee() {
        print("커피 구입")
    }
}

struct CoffeeShop {
    var sales: Int = 0
    let menu: [String:Int] = ["아메리카노":3000,"카페라떼":3500,"카푸치노":3500]
    var pickUpTable: [(String,String)] = []
    var orderList: [(String,String)] = []
    
    mutating func takeOrder(_ coffee: String, from person: String) {
        orderList.append((person,coffee))
        print("\(person)님이 \(coffee) 주문")
    }
    mutating func makeCoffee() {
        if let brewingCustomerCoffee = orderList.first?.0, let brewingCoffee = orderList.first?.1 {
            pickUpTable.append(orderList.removeFirst())
            print("\(brewingCustomerCoffee)님의 \(brewingCoffee) 준비 완료")
        } else {
            print("주문 내역이 없습니다.")
        }
    }
}
