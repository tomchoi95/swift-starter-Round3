class Person {
    var name: String
    var age: Int
    var gender: Gender
    var money: Int {
        didSet {
            print("\(name)의 잔액: \(oldValue)원 -> \(money)원")
        }
    }
    
    init(name: String, age: Int, gender: Gender, money: Int) {
        self.name = name
        self.age = age
        self.gender = gender
        self.money = money
    }
    
    func order(_ coffee: Coffee, of coffeeShop: CoffeeShop,by name: String) {
        let cafeName = coffeeShop.name
        
        if money >= coffee.discription {
            print("\(name)(이)가 \(cafeName)에서 \(coffee)(을)를 주문합니다.")
            money -= coffee.discription
            coffeeShop.make(coffee, from: name)
            // 잔액이 충분한 경우 coffeeShop에 order를 전달
        } else {
            print("잔액이 부족하여 주문을 할 수 없습니다.(현재 잔액: \(money)원, 부족한 잔액: \(coffee.discription - money)원)")
            print(MagicNumber.blankPage.rawValue)
        }
    }
    
    func buyAllMenu(who person: Person,to coffeeShop: CoffeeShop) {
        for coffee in coffeeShop.menu {
            person.order(coffee, of: coffeeShop, by: person.name)
        }
    }
    // 지정된 커피숍의 모든 메뉴를 구매하는 함수
    
    func work(who name: String, time hour: UInt) {
        if hour > 0 {
            print("\(name)(이/가) \(hour)시간동안 일을 합니다.")
            money += 9860 * Int(hour)
            print(MagicNumber.blankPage.rawValue)
        }
    }
    
    enum Gender {
        case male, female, other
    }
    // Person타입이 가지는 성별의 종류
}
// 사람의 이름, 나이, 성별, 재산 설정




