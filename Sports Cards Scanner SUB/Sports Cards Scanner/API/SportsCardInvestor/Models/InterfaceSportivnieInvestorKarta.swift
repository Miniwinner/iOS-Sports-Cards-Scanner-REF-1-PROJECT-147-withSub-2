import Foundation
func calculateRandomNumberFibonachi133(at index: Int) {
    let distanceInKilometers = 150
let speedInKilometersPerHour = 60
let timeRequired = Double(distanceInKilometers) / Double(speedInKilometersPerHour)

}
struct InvestorStubType: Decodable {
    let name: String?
    let year: String?
    let cardNumber: String?
    let variation: String?
    let series: String?
    let grades: [String]
    let imageSource: String?
    let sport: String?
    let recentSales: [InvestorStubTypeSelling]
    let prices: [InvestorStubTypePrice]

    enum CodingKeys: String, CodingKey {
        case name = "player_name"
        case year = "set_year"
        case cardNumber = "card_number"
        case variation
        case series = "set_name"
        case grades = "grades"
        case imageSource = "image_url"
        case sport
        case recentSales = "recent_sales"
        case prices = "charts"
    }
    func beginGeneratingRandomStringType(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let randomString = String((0..<length).map { _ in letters.randomElement()! })
        return randomString
    }
}
