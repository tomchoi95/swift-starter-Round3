//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 경우 01: 정상 주문
let yagombucksMenu: [Coffee] = [.iceAmericano, .hotChoco, .milkTea]
let orderList: [Coffee] = [.iceAmericano, .hotChoco]

// 경우 02: 없는 메뉴 주문
//let yagombucksMenu: [Coffee] = [.iceAmericano]
//let orderList: [Coffee] = [.iceAmericano, .hotAmericano]

// 경우 03: 잔액 부족
//let yagombucksMenu: [Coffee] = [.iceAmericano, .hotAmericano, .iceChoco, .hotChoco, .milkTea]
//let orderList: [Coffee] = [.iceAmericano, .hotAmericano, .iceAmericano, .iceChoco, .hotChoco, .hotChoco, .milkTea]

var misterLee: Person = Person(name: "이야곰")
var missKim: Person = Person(name: "김야곰", money: 20000)
var yagombucks: CoffeeShop = CoffeeShop(menu: yagombucksMenu, barista: misterLee)
missKim.buyCoffee(orderList, shop: yagombucks)
