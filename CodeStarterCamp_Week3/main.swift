//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var misterLee: Person = Person(name: "이야곰")
var missKim: Person = Person(name: "김야곰", money: 20000)

let yagombucksMenu: [Coffee: Int] = [.iceAmericano: 2000,.hotChoco: 4500]
var yagombucks: CoffeeShop = CoffeeShop(menu: yagombucksMenu, barista: misterLee)

let orderList: [Coffee] = [.iceAmericano, .hotChoco]
//let orderList: [Coffee] = [.iceAmericano, .iceAmericano, .iceAmericano, .hotChoco, .hotChoco, .hotChoco, .hotChoco]
missKim.buyCoffee(orderList, shop: yagombucks)
