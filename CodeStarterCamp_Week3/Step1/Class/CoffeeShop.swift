//
//  CoffeeShop.swift
//  CodeStarterCamp_Week3
//
//  Created by 배정길 on 7/31/24.
//

import Foundation

// CoffeeShop 타입 정의
class CoffeeShop {
    var name: String
    var revenue: Int
    var menu: [Coffee: Int]
    var pickUpTable: [Coffee]
    var barista: Person?            
    
    init(name: String, menu: [Coffee: Int]) {
        self.name = name
        self.revenue = 0
        self.menu = menu
        self.pickUpTable = []
    }
    
    func make(coffee: Coffee) {
        pickUpTable.append(coffee)
        print("\(coffee.rawValue)가 나왔습니다. pickup 하세요.")
    }
    
    func setBarista(barista: Person) {
        self.barista = barista
        print("\(barista.name)는 현재 \(name)커피숍의 바리스타입니다.")
    }
}
