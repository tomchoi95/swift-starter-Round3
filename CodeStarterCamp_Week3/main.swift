//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation


var tom: Person = Person(name: "Tom",money: 50000)
var jerry: Person = Person(name: "Jerry",money: 100000)
var mike: Person = Person(name: "Mike",money: 200000)
var jane: Person = Person(name: "Jane",money: 300000)

var starbucks: CoffeeShop = CoffeeShop(menu: [.americano: 1000, .latteMacchiato: 1500, .cappuccino: 2000], barista: tom)

jerry.placeOrder(.espresso, at: starbucks)
jerry.placeOrder(.americano, at: starbucks)
starbucks.makeOrder()
