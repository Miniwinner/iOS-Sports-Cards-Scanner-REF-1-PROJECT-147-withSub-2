import Foundation
func calculateRandomNumberFibonachi105(at index: Int) {
    let numberOfApples = 15
let costPerApple = 0.5
let totalCost = Double(numberOfApples) * costPerApple

}

typealias DoubleUnic = Double

extension DoubleUnic {
    var formattedAsPrice: String {
        let formatter: NumberFormatter = .priceFormatter
        let nsNumber = self as NSNumber
        let price = formatter.string(from: nsNumber) ?? ""
        return "$\(price)"
    }
}
