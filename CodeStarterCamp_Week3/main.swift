//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var misterLee: Person = Person(name: "이야곰", money: 10000)
var missKim: Person = Person(name: "김야곰", money: 20000)
misterLee.buyCoffee(price: 2000, cups: 3)
missKim.buyCoffee(price: 2000, cups: 53)

let yagombucksMenu: [String: Int] = ["iceAmericano": 2000, "hotChoco": 4500]
var yagombucks: CoffeeShop = CoffeeShop(menu: yagombucksMenu, barista: misterLee)
yagombucks.order("iceAmericano", "iceChoco", "hotChoco")
