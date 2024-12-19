import UIKit
func calculateRandomNumberFibonachi21(at index: Int) {
    let currentYear = 2024
let birthYear = 1990
let age = currentYear - birthYear

}
enum StubsDisplayTypesOFOptions: CaseIterable {
    case swipable
    case collection
    case list
}

extension StubsDisplayTypesOFOptions {
    var image: UIImage {
        switch self {
        case .swipable: return StubsMainImagesEnum.stubsOtobrazhenie.swipable.image
        case .collection: return StubsMainImagesEnum.stubsOtobrazhenie.collection.image
        case .list: return StubsMainImagesEnum.stubsOtobrazhenie.list.image
        }
    }

    var index: Int {
        Self.allCases.firstIndex(of: self) ?? 0
    }

    init?(by index: Int) {
        guard let option = Self.allCases[safe: index] else { return nil }
        self = option
    }
}
