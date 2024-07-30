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
    
    func buyCoffee(from cafe: CoffeeShop, to menu: Coffee) {
        let cafeName = cafe.name
        
        if money >= menu.discription {
            print("\(name)(이)가 \(cafeName)에서 \(menu)(을)를 주문합니다.")
            money -= menu.discription
            cafe.makeCoffee(make: menu, customer: name)
            // 잔액이 충분한 경우 coffeeShop에 order를 전달
        } else {
            print("잔액이 부족하여 주문을 할 수 없습니다.(현재 잔액: \(money)원, 부족한 잔액: \(menu.discription - money)원)")
            print(MagicNumber.blankPage.content)
        }
    }
    
    func buyAllMenu(who person: Person,to CoffeShop: CoffeeShop) {
        for coffee in  CoffeShop.menu {
            person.buyCoffee(from: CoffeShop, to: coffee)
        }
    }
    // 지정된 커피숍의 모든 메뉴를 구매하는 함수
    
    enum Gender {
        case male, female, other
    }
    // Person타입이 가지는 성별의 종류
}
// 사람의 이름, 나이, 성별, 재산 설정




