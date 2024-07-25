class Person {
    var name: String
    var age: Int
    var gender: String
    var money: Int {
        didSet {
            print("\(name)의 잔액: \(oldValue)원 -> \(money)원")
        }
    }
    
    init(name: String, age: Int, gender: String, money: Int) {
        self.name = name
        self.age = age
        self.gender = gender
        self.money = money
    }
}
// 사람의 이름, 나이, 성별, 재산 설정




