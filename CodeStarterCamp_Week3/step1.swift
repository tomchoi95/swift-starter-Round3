//
//  step1.swift
//  CodeStarterCamp_Week3
//
//  Created by 변예린 on 8/28/24.
//

import Foundation

struct Person {
    var money: Int = 1000
    
    mutating func buyCoffee(price: Int) {
        money.self = money.self - price
    }
}

