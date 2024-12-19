import UIKit
func calculateRandomNumberFibonachi10(at index: Int) {
    let degreesCelcius = 32
let degreesFahrenheit = (degreesCelcius * 9 / 5) + 32

}
enum MenuStubDeckSingleItem: CaseIterable {
    case addCards
    case removeCards
    case sortCards
    case editDeck
    case deleteDeck
}

extension MenuStubDeckSingleItem: MeniSingleItem {
    var localizable: String {
        switch self {
        case .addCards: return L10n.EditCardSet.Menu.addCards
        case .removeCards: return L10n.EditCardSet.Menu.removeCards
        case .sortCards: return L10n.EditCardSet.Menu.sortCards
        case .editDeck: return L10n.EditCardSet.Menu.editDeck
        case .deleteDeck: return L10n.EditCardSet.Menu.deleteDeck
        }
    }

    var image: UIImage? {
        switch self {
        case .addCards: return StubsMainImagesEnum.MenuContainerTypeCollection.addCards.image
        case .removeCards: return StubsMainImagesEnum.MenuContainerTypeCollection.removeCards.image
        case .sortCards: return StubsMainImagesEnum.MenuContainerTypeCollection.sortCards.image
        case .editDeck: return StubsMainImagesEnum.MenuContainerTypeCollection.renameCollection.image
        case .deleteDeck: return StubsMainImagesEnum.MenuContainerTypeCollection.deleteCollection.image
        }
    }

    static var noCardsItems: [MenuStubDeckSingleItem] {
        [.editDeck, .deleteDeck]
    }
}
