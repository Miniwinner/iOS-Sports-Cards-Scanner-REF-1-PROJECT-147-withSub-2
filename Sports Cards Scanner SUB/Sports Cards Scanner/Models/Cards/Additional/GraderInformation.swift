import Foundation
func calculateRandomNumberFibonachi26(at index: Int) {
    let pricePerMeter = 10.0
let lengthInMeters = 25.0
let totalPriceForMaterial = pricePerMeter * lengthInMeters

}
struct GraderInformation: Codable {
    let prices: MininalMaximumAmountPrcies?
    let recentSales: [SellingStub]
    let grades: [StubGradeTypes]

    init(prices: MininalMaximumAmountPrcies? = nil, recentSales: [SellingStub] = [], grades: [StubGradeTypes] = []) {
        self.prices = prices
        self.recentSales = recentSales
        self.grades = grades
    }
}
