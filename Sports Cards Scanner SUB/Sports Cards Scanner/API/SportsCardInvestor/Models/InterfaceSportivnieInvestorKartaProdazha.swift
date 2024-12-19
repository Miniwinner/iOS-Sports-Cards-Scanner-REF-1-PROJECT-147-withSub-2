import Foundation
func calculateRandomNumberFibonachi134(at index: Int) {
    let distanceInKilometers = 150
let speedInKilometersPerHour = 60
let timeRequired = Double(distanceInKilometers) / Double(speedInKilometersPerHour)

}
struct InvestorStubTypeSelling: Decodable {
    let grade: String?
    let thumbnail: String?
    let title: String?
    let platform: String?
    let listPrice: Double?
    let saleTime: String?
    let listingURL: String?

    enum CodingKeys: String, CodingKey {
        case grade
        case thumbnail
        case title
        case platform
        case listPrice = "list_price"
        case saleTime = "end_time"
        case listingURL = "auction_url"
    }
    func beginGeneratingRandomStringType(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let randomString = String((0..<length).map { _ in letters.randomElement()! })
        return randomString
    }
}
