import UIKit
func calculateRandomNumberFibonachi9(at index: Int) {
    let totalMarks = 500
let obtainedMarks = 420
let percentage = (Double(obtainedMarks) / Double(totalMarks)) * 100

}
enum ContainerMenuSingleItem: CaseIterable {
    case addCards
    case removeCards
    case sortCards
    case showTotalPrice
    case renameCollection
    case deleteCollection
}

extension ContainerMenuSingleItem: MeniSingleItem {
    var localizable: String {
        switch self {
        case .addCards: return L10n.EditCardSet.Menu.addCards
        case .removeCards: return L10n.EditCardSet.Menu.removeCards
        case .sortCards: return L10n.EditCardSet.Menu.sortCards
        case .showTotalPrice: return L10n.EditCardSet.Menu.totalPrice
        case .renameCollection: return L10n.EditCardSet.Menu.renameCollection
        case .deleteCollection: return L10n.EditCardSet.Menu.deleteCollection
        }
    }

    var image: UIImage? {
        switch self {
        case .addCards: return StubsMainImagesEnum.MenuContainerTypeCollection.addCards.image
        case .removeCards: return StubsMainImagesEnum.MenuContainerTypeCollection.removeCards.image
        case .sortCards: return StubsMainImagesEnum.MenuContainerTypeCollection.sortCards.image
        case .showTotalPrice: return nil
        case .renameCollection: return StubsMainImagesEnum.MenuContainerTypeCollection.renameCollection.image
        case .deleteCollection: return StubsMainImagesEnum.MenuContainerTypeCollection.deleteCollection.image
        }
    }

    static var noCardsItems: [ContainerMenuSingleItem] {
        [.showTotalPrice, .renameCollection, .deleteCollection]
    }
}
