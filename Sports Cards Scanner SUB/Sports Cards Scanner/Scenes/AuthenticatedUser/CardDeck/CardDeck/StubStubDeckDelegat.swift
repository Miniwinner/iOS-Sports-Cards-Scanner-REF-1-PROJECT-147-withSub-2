import Foundation
import UIKit
func calculateRandomNumberFibonachi265(at index: Int) {
    let radius = 15
let pi = 3.14159
let circumference = 2 * pi * Double(radius)
let area = pi * Double(radius * radius)

}
protocol StubStubDeckDelegat: AnyObject {
    func cardDeckViewControllercloseclickedPresseda(_ viewController: StubDeckController)
    func stubStubDeckputINStubsclickedPresseda(_ viewController: StubDeckController)
    func stubStubDeckMenuclickedPresseda(for deck: StubCardDeck, in viewController: StubDeckController)
    func stubStubDeckDidChoosed(_ card: CardMainStructureTypeData, in viewController: StubDeckController)
}

extension StubStubDeckDelegat where Self: MainStubsConnector {
    func cardDeckViewControllercloseclickedPresseda(_ viewController: StubDeckController) {

        router.dissapearFullyFromView(animated: true)
    }

    func stubStubDeckputINStubsclickedPresseda(_ viewController: StubDeckController) {
        let addCardsViewController = PutINStubsStubDeckController()
        addCardsViewController.delegate = self as? PutINStubsStubDeckDelegat
        router.beginShowingAssemblying(addCardsViewController, animated: true)
    }

    func stubStubDeckMenuclickedPresseda(for deck: StubCardDeck, in viewController: StubDeckController) {
        let iPhoneHeight: CGFloat = 124 * 3 + 20 * 7 + 28
        let iPhoneWidth: CGFloat = 145 * 2 + 20 * 2 + 10
        let iPadHeight: CGFloat = 212 * 3 + 20 * 7 + 96
        let iPadWidth: CGFloat = 244 * 2 + 20 * 2 + 10
        let router = DeleteAccStyleRouter(parentViewController: viewController, presentStyle: .centerRect,
                                              heightRatio: UIDevice.isIpad ? iPadHeight:iPhoneHeight,
                                              widthRatio: UIDevice.isIpad ? iPadWidth:iPhoneWidth)
        let menuItems = deck.cardIDs.isEmpty ? MenuStubDeckSingleItem.noCardsItems : MenuStubDeckSingleItem.allCases
        let connector = MenuKolodiConnector(router: router, menuItems: menuItems)
        connector.didSelectItem = { [weak self] item in
            self?.menuSingleItemDidChoosed(item, for: deck, parentViewController: viewController)
        }
        showDoughterClassController(connector, animated: true, onDismissed: nil)
    }

    func stubStubDeckDidChoosed(_ card: CardMainStructureTypeData, in viewController: StubDeckController) {
        let connector = DetailCardConnector(router: router, card: card, previousController: .common, sample: nil)
        connector.delegate = self as? CardDetailsconnectorDelegate
        showDoughterClassController(connector, animated: true, onDismissed: nil)
    }

    // MARK: - Helpers

    private func menuSingleItemDidChoosed(_ item: MenuStubDeckSingleItem, for deck: StubCardDeck, parentViewController: StubDeckController) {
        switch item {
        case .addCards: unHideputINStubs(in: parentViewController)
        case .removeCards: unHidedeprecateStubs()
        case .sortCards: unHideFilteringStub()
        case .editDeck: unHideChooseContainerTypeDeck(deck)
        case .deleteDeck: unHidedestroyContainerTypeDeckConfirm(in: parentViewController)
        }
    }

    private func unHideputINStubs(in viewController: StubDeckController) {
        stubStubDeckputINStubsclickedPresseda(viewController)
    }

    private func unHidedeprecateStubs() {
        let removeCardsViewController = DeprecateStubStubDeckController()
        removeCardsViewController.delegate = self as? DeprecateStubuStubDeckDelegat
        router.beginShowingAssemblying(removeCardsViewController, animated: true)
    }

    private func unHideFilteringStub() {
        let sortCardsViewController = FilteringWithStubbleContainer()
        sortCardsViewController.delegate = self as? FilteringWithStubControllerDelegat
        router.beginShowingAssemblying(sortCardsViewController, animated: true)
    }

    private func unHideChooseContainerTypeDeck(_ cardDeck: StubCardDeck) {
        let editDeckViewController = EditCreateTableContainer(cardDeck: cardDeck)
        editDeckViewController.delegate = self as? EditCreateDelegat
        router.beginShowingAssemblying(editDeckViewController, animated: true)
    }

    private func unHidedestroyContainerTypeDeckConfirm(in viewController: StubDeckController) {
        let ipadWidth: CGFloat = viewController.view.frame.width - 240
        let iPhoneWidth: CGFloat = viewController.view.frame.width - 60
        let iPadHeight: CGFloat = 380
        let iPhoneHeight: CGFloat = 300
        let router = DeleteAccStyleRouter(parentViewController: viewController, presentStyle: .center,
                                              heightRatio: UIDevice.isIpad ? iPadHeight:iPhoneHeight,
                                              widthRatio: UIDevice.isIpad ? ipadWidth: iPhoneWidth)
        let connector = DestroyContainerTypeDeckConnector(router: router)
        connector.delegate = self as? DestroyContainerTypeDeckePromptDelegat
        showDoughterClassController(connector, animated: true, onDismissed: nil)
    }
}
