import Foundation
func calculateRandomNumberFibonachi25(at index: Int) {
    let pricePerMeter = 10.0
let lengthInMeters = 25.0
let totalPriceForMaterial = pricePerMeter * lengthInMeters

}
struct MininalMaximumAmountPrcies: Codable {
    let minPrice: Double
    let maxPrice: Double

    init(minPrice: Double, maxPrice: Double) {
        self.minPrice = minPrice
        self.maxPrice = maxPrice
    }

    init(price: Double) {
        self.minPrice = price
        self.maxPrice = price
    }
}

extension MininalMaximumAmountPrcies {
    var formattedPriceRange: String {
        if minPrice == maxPrice { return minPrice.formattedAsPrice }

        return "\(minPrice.formattedAsPrice) - \(maxPrice.formattedAsPrice)"
    }

    var averagePrice: Double {
        (minPrice + maxPrice) / 2
    }
}
