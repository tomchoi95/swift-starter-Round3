enum Coffee: Int {
    case Americano
    case Cafelatte
    case Espresso
    case Macchiato
    case Frappe
    
    var discription: Int {
        switch self {
        case .Americano:
            return 2500
        case .Cafelatte:
            return 3000
        case .Espresso:
            return 2000
        case .Frappe:
            return 4500
        case .Macchiato:
            return 5000
        }
    }
}
// 커피숍의 메뉴와 가격
