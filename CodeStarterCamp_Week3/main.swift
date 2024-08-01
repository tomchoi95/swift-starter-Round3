//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// Person 인스턴스 생성
let misterLee = Person(name: "Mister Lee", money: 8)
let missKim = Person(name: "Miss Kim", money: 8)

// CoffeeShop 인스턴스 생성
let yagombucks = CoffeeShop(name: "Yagombucks", menu: [.americano: 4.5, .latte: 5, .cappuccino: 5, .espresso: 4])

// yagombucks 의 바리스타를 misterLee 로 할당
yagombucks.setBarista(barista: misterLee)

// missKim이 커피를 구매하도록 함
missKim.buyCoffee(coffee: .latte, from: yagombucks)

// misterLee가 커피를 구매하도록 함
misterLee.buyCoffee(coffee: .espresso, from: yagombucks)

// missKim이 커피를 한잔 더 구매 했다.
missKim.buyCoffee(coffee: .cappuccino, from: yagombucks)

// 픽업 테이블 출력
print("Pick Up Table: \(yagombucks.pickUpTable.map { $0.rawValue })")

// 커피숍 매출액 출력
print("커피숍 매출액 : \(yagombucks.revenue)")
