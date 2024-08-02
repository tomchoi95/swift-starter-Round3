import Foundation

class Person {
    var name: String
    var age: Int
    var money: Double
    
    init(name: String, age: Int, money: Double) {
        self.name = name
        self.age = age
        self.money = money
    }
    
    func buyCoffee(coffeePrice: Double) {
        if money >= coffeePrice {
            money -= coffeePrice
            print("\(name)이(가) 커피를 구매했습니다. 남은 돈: \(money)원")
        } else {
            print("\(name)에게 충분한 돈이 없습니다. 현재 돈: \(money)원")
        }
    }
}

let person = Person(name: "김무민", age: 30, money: 10000)

person.buyCoffee(coffeePrice: 4500)
person.buyCoffee(coffeePrice: 6000)
