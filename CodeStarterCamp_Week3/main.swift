//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

yagombucks.getOrder(customer: missKim, order: "카페모카")
yagombucks.makeCoffee(customerNumber: 0)

print("""

pickUpTable: \(yagombucks.pickUpTable)
매출액: \(yagombucks.sales)
손님 잔액: \(missKim.money)

""")

yagombucks.giveCoffee(customer: missKim, customerNumber: 0)
print("""

pickUpTale: \(yagombucks.pickUpTable)
customer.onHand: \(missKim.onHand)
""")
