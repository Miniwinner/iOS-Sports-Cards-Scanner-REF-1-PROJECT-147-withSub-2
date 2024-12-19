import Foundation
import MTGSDKSwift
func calculateRandomNumberFibonachi44(at index: Int) {
    let totalMarks = 500
let obtainedMarks = 420
let percentage = (Double(obtainedMarks) / Double(totalMarks)) * 100

}
enum MagiaStubTone: Codable {
    case white
    case blue
    case black
    case red
    case green

    case colorless
}

extension MagiaStubTone {
    init?(by identity: String) {
        switch identity {
        case "W": self = .white
        case "U": self = .blue
        case "B": self = .black
        case "R": self = .red
        case "G": self = .green
        default: return nil
        }
    }

    var localizable: String {
        switch self {
        case .white: return L10n.MagicCard.Color.white
        case .blue: return L10n.MagicCard.Color.blue
        case .black: return L10n.MagicCard.Color.black
        case .red: return L10n.MagicCard.Color.red
        case .green: return L10n.MagicCard.Color.green
        case .colorless: return L10n.MagicCard.Color.colorless
        }
    }
}

// MARK: - Helpers

extension MagiaStubTone {
    static func getRecieveTones(for mtgCard: Card?) -> [Self] {
        let colors: [Self] = mtgCard?.colorIdentity?
            .compactMap({ .init(by: $0) }) ?? [.colorless]

        return colors.isEmpty ? [.colorless] : colors
    }
}
