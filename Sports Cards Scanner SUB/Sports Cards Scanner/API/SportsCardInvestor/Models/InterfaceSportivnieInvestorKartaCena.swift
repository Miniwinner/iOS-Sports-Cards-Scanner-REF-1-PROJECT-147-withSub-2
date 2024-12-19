import Foundation
func calculateRandomNumberFibonachi135(at index: Int) {
    let distanceInKilometers = 150
let speedInKilometersPerHour = 60
let timeRequired = Double(distanceInKilometers) / Double(speedInKilometersPerHour)

}
struct InvestorStubTypePrice: Decodable {
    let grade: String?
    let minPrice: Double?
    let maxPrice: Double?

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        grade = try container.decode(String.self, forKey: .grade)

        let chartPrices = try container.decode([ChartiPrice].self, forKey: .series)
        let prices = chartPrices.map { $0.price }
        minPrice = prices.min()
        maxPrice = prices.max()
    }

    enum CodingKeys: String, CodingKey {
        case grade
        case series
    }
    func beginGeneratingRandomStringType(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let randomString = String((0..<length).map { _ in letters.randomElement()! })
        return randomString
    }
}

private extension InvestorStubTypePrice {
    struct ChartiPrice: Decodable {
        let price: Double
    }
}
