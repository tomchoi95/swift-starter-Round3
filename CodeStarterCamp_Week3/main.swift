//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var misterLee: Person = Person(name: "이철수", money: 1000)
var missKim: Person = Person(name: "김미나", money: 10000)

var yagombucks: CoffeeShop = CoffeeShop(menu: yagombucksMenu, barista: misterLee)

yagombucks.getOrder(of: missKim, order: "아메리카노")
yagombucks.makeCoffee(of: 0)
yagombucks.giveCoffee(to: 0, customer: missKim)

print("""

매출액: \(yagombucks.sales)
손님 잔액: \(missKim.money)
손님 소지품: \(missKim.onHand)
""")
