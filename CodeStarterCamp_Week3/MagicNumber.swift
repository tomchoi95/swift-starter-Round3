import Foundation

enum MagicNumber: String {
    case blankPage
    
    var content: String {
        switch self {
        case .blankPage:
            " "
        }
    }
}
