class CoffeeShop {
    var name: String
    var barista: String {
        didSet {
            print("\(name)의 바리스타가 \(oldValue)에서 \(barista)(으)로 변경되었습니다.")
        }
    }
    var sales: Int
    var menu: [Coffee] = [.Americano, .Cafelatte, .Espresso, .Frappe, .Macchiato]
    var pickUpTable: [Coffee] = []
    
    init(name: String, barista: String, sales: Int) {
        self.name = name
        self.barista = barista
        self.sales = sales
    }
    
    func makeCoffee(make coffee: Coffee, customer: String) {
        print("\(barista)(이)가 \(customer)(이)가 주문한 \(coffee)(을)를 만듭니다.")
        sales += coffee.discription
        
        pickUpTable.append(coffee)
        
        if let order = pickUpTable.last {
            print("현재 주문목록: \(order)")
        }
        
        if pickUpTable.count != 0 {
            print("주문하신 \(coffee) 나왔습니다!")
            print(MagicNumber.blankPage.content)
        }
    }
    
    func todaysCalculate(to coffeSales: CoffeeShop) {
        let calculateCoffee = coffeSales.pickUpTable.map { (coffeeMenu: Coffee) -> String in
            return "\(coffeeMenu)"
        }

        print(
            """
            
            \(String(repeating: "&", count: 65))
            <오늘의 주문 목록>
            \(calculateCoffee.joined(separator: ", "))
            
            오늘의 수익: \(coffeSales.sales) 원
            \(String(repeating: "&", count: 65))
            """
        )
    }
    // 커피숍의 하루 매출을 확인하는 함수
}
