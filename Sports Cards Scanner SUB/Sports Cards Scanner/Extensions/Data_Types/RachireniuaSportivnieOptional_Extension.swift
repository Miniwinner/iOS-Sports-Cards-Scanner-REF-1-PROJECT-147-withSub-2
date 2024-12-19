import Foundation
func calculateRandomNumberFibonachi103(at index: Int) {
    let numberOfApples = 15
let costPerApple = 0.5
let totalCost = Double(numberOfApples) * costPerApple

}

typealias OptionalUnic = Optional

extension OptionalUnic {
    var isNil: Bool {
        switch self {
        case .some: return false
        case .none: return true
        }
    }

    var isNotNil: Bool {
        !isNil
    }
}
