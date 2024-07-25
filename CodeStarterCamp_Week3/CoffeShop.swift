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
    
    func makeCoffee(make: Coffee, customer: String) {
        print("\(barista)(이)가 \(customer)(이)가 주문한 \(make)(을)를 만듭니다.")
        sales += make.discription
        
        pickUpTable.append(make)
        if let order = pickUpTable.last {
            print("현재 주문목록: \(order)")
        }
        
        if pickUpTable.count != 0 {
            print("주문하신 \(make) 나왔습니다!")
        }
    }
    
    func todaysCalculate(_ of: CoffeeShop) {
        var calculateCoffee: String = String()
        for calculate in of.pickUpTable {
            calculateCoffee.insert(contentsOf: "\(calculate), ", at: calculateCoffee.endIndex)
        }
        calculateCoffee.removeLast()
        calculateCoffee.removeLast()
      
        print(
            """
            
            \(String(repeating: "&", count: 65))
            <오늘의 주문 목록>
            \(calculateCoffee)
            
            오늘의 수익: \(of.sales) 원
            \(String(repeating: "&", count: 65))
            """
        )
    }
    // 커피숍의 하루 매출을 확인하는 함수
    
    init(name: String, barista: String, sales: Int) {
        self.name = name
        self.barista = barista
        self.sales = sales
    }
}
