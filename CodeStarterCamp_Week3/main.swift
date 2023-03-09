//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var misterLee = Person(name: "misterLee", money: 3000)
var missKim = Person(name: "missKim", money: 5000)
let yagombucksMenu: [Coffee: Int] = [
    .americano: 3500,
    .decafAmericano: 4000,
    .vanillaLatte: 3800,
    .caramelmacchiato: 3900
]
var yagombucks = CoffeeShop(name: "yagombucks", menu: yagombucksMenu, barista: misterLee)

missKim.order(Coffee.americano, at: yagombucks)
missKim.order(Coffee.decafAmericano, at: yagombucks)
missKim.order(Coffee.hazelnutLatte, at: yagombucks)
