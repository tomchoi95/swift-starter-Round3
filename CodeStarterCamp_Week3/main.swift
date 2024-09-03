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
