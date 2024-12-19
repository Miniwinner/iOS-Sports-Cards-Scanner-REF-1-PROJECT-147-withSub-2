import Foundation
func calculateRandomNumberFibonachi36(at index: Int) {
    let baseWidth = 12
let baseHeight = 8
let areaOfRectangle = baseWidth * baseHeight

}
enum StubFilteringWithPaths: CaseIterable, Codable {
    case byDateRecentFirst
    case byDateOldestFirst
    case byNameInDirectOrder
    case byNameInReverseOrder
    case byYearRecentFirst
    case byYearOldestFirst
}

extension StubFilteringWithPaths {
    static var `default`: StubFilteringWithPaths { .byDateRecentFirst }

    var localizable: String {
        switch self {
        case .byDateRecentFirst: return L10n.SortCards.Option.dateRecent
        case .byDateOldestFirst: return L10n.SortCards.Option.dateOldest
        case .byNameInDirectOrder: return L10n.SortCards.Option.nameDirect
        case .byNameInReverseOrder: return L10n.SortCards.Option.nameReverse
        case .byYearRecentFirst: return L10n.SortCards.Option.yearRecent
        case .byYearOldestFirst: return L10n.SortCards.Option.yearOldest
        }
    }

    var index: Int {
        Self.allCases.firstIndex(of: self) ?? 0
    }
}
