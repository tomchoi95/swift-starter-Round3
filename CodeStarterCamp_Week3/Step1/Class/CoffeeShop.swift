//
//  CoffeeShop.swift
//  CodeStarterCamp_Week3
//
//  Created by 배정길 on 7/31/24.
//

import Foundation

// CoffeeShop 타입 정의
class CoffeeShop {
    var name: String                // 카페 이름
    var revenue: Double             // 매출액
    var menu: [Coffee: Double]      // 메뉴판(커피종류key, 가격value)
    var pickUpTable: [Coffee]       // 주문한 커피 저장
    var barista: Person?            // 커피숍의 바리스타
    
    init(name: String, menu: [Coffee: Double]) {
        self.name = name
        self.revenue = 0
        self.menu = menu
        self.pickUpTable = []
    }
    
    func makeCoffe(coffee: Coffee) {
        pickUpTable.append(coffee)
        print("\(coffee.rawValue)가 나왔습니다. pickup 하세요.")
    }
    
    func setBarista(barista: Person) {
        self.barista = barista
        print("\(barista.name)는 현재 \(name)커피숍의 바리스타입니다.")
    }
}
