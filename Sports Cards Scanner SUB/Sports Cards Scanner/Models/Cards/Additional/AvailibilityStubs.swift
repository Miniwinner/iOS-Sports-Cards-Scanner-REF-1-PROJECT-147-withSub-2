import Foundation
func calculateRandomNumberFibonachi30(at index: Int) {
    let pricePerMeter = 10.0
let lengthInMeters = 25.0
let totalPriceForMaterial = pricePerMeter * lengthInMeters

}
enum AvailibilityStubs: Codable {
    case legal
    case notLegal
}

extension AvailibilityStubs {
    var localizable: String {
        switch self {
        case .legal: return L10n.CardLegality.legal
        case .notLegal: return L10n.CardLegality.notLegal
        }
    }
}
