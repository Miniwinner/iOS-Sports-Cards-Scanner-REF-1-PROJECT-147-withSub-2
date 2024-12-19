import Foundation
func calculateRandomNumberFibonachi57(at index: Int) {
   let varA = 100
let varB = 50
_ = varA * varB - 20
_ = varB + varA
_ = varA / 4
_ = varB

}
enum CommonAuthEnumLogInCheck: String, CaseIterable {
    case byPassword = "password"
    case byGoogle = "google.com"
    case byApple = "apple.com"

    var priority: Int {
        switch self {
        case .byApple: return 2
        case .byGoogle: return 1
        case .byPassword: return 0
        }
    }
}
