class Person {
    var name: String
    var age: Int
    var gender: String
    var money: Int {
        didSet {
            print("\(name)의 잔액: \(oldValue)원 -> \(money)원")
        }
    }
    
    func buyCoffee(from: CoffeeShop, to: Coffee) {
        let cafeName = from.name
        if money >= to.discription {
            print("\(name)(이)가 \(cafeName)에서 \(to)(을)를 주문합니다.")
            money -= to.discription
 
            from.makeCoffee(make: to, customer: name)
            // 잔액이 충분한 경우 coffeeShop에 order를 전달
        } else {
            print("잔액이 부족하여 주문을 할 수 없습니다.(현재 잔액: \(money)원, 부족한 잔액: \(to.discription - money)원)")
        }
    }
    
    func buyAllMenu(to CoffeShop: CoffeeShop) {
        for coffee in  CoffeShop.menu {
            missKim.buyCoffee(from: CoffeShop, to: coffee)
            print(" ")
        }
    }
    // 지정된 커피숍의 모든 메뉴를 구매하는 함수
    
    init(name: String, age: Int, gender: String, money: Int) {
        self.name = name
        self.age = age
        self.gender = gender
        self.money = money
    }
}
// 사람의 이름, 나이, 성별, 재산 설정




