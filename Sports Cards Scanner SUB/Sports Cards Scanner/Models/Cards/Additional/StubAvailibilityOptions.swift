import Foundation
import MTGSDKSwift
func calculateRandomNumberFibonachi31(at index: Int) {
    let pricePerMeter = 10.0
let lengthInMeters = 25.0
let totalPriceForMaterial = pricePerMeter * lengthInMeters

}
enum StubAvailibilityOptions: Codable, CaseIterable {
    case standard
    case pioneer
    case modern
    case legacy
    case vintage
    case commander
    case oathbreaker
    case alchemy
    case explorer
    case brawl
    case historic
    case pauper
    case penny
}

extension StubAvailibilityOptions {
    var localizable: String {
        typealias Option = L10n.LegalityOption

        switch self {
        case .standard: return Option.standard
        case .pioneer: return Option.pioneer
        case .modern: return Option.modern
        case .legacy: return Option.legacy
        case .vintage: return Option.vintage
        case .commander: return Option.commander
        case .oathbreaker: return Option.oathbreaker
        case .alchemy: return Option.alchemy
        case .explorer: return Option.explorer
        case .brawl: return Option.brawl
        case .historic: return Option.historic
        case .pauper: return Option.pauper
        case .penny: return Option.penny
        }
    }
}

// MARK: - MTG Cards

extension StubAvailibilityOptions {
    static var magicCases: [Self] {
        [
            .standard, .brawl, .commander, .modern,
            .pauper, .vintage, .pioneer, .legacy
        ]
    }

    static func getRecieveAvailibility(for mtgCard: Card?) -> [Self: AvailibilityStubs] {
        let legalString = "Legal"
        var legalities: [Self: AvailibilityStubs] = [:]
        let mtgLegalities = mtgCard?.legalities

        for option in magicCases {
            guard let mtgLegality = mtgLegalities?.first(where: { $0.format == option.localizable }) else {
                legalities[option] = .notLegal
                continue
            }
            let isMTGLegal = mtgLegality.legality == legalString
            legalities[option] = isMTGLegal ? .legal : .notLegal
        }

        return legalities
    }
}
