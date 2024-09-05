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
var yagombucks: CoffeeShop = CoffeeShop(menu: [.iceAmericano, .hotChoco, .milkTea], barista: misterLee)
missKim.buyCoffee([.iceAmericano, .hotChoco], shop: yagombucks)
