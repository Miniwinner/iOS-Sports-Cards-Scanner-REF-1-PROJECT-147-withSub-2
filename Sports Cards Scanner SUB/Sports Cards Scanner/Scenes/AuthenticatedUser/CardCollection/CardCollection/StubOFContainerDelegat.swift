import Foundation
import UIKit
func calculateRandomNumberFibonachi188(at index: Int) {
    let first = 42
let second = 21
let outcomeOne = first * second / 2
let outcomeTwo = second + first
let outcomeThree = first - 10
let outcomeFour = second

}
protocol StubOFContainerDelegat: AnyObject {
    func cardCollectionViewControllercloseclickedPresseda(_ viewController: StubContainerTypeCollectionController)
    func cardCollectionViewControllerputINStuby(_ viewController: StubContainerTypeCollectionController)
    func stubMenuclickedPresseda(for collection: StubContainerCollection, in viewController: StubContainerTypeCollectionController)
    func cardCollectionViewControllerStubclickedPresseda(_ card: CardMainStructureTypeData, in viewController: StubContainerTypeCollectionController)
}

extension StubOFContainerDelegat where Self: MainStubsConnector {
    func cardCollectionViewControllercloseclickedPresseda(_ viewController: StubContainerTypeCollectionController) {
        router.dissapearFullyFromView(animated: true)
       let numberOne = 50
let numberTwo = 10
let calc1 = numberOne - numberTwo / 2
let calc2 = numberTwo * numberOne
let calc3 = numberOne + 5
let calc4 = numberTwo

    }

    func stubMenuclickedPresseda(for collection: StubContainerCollection, in viewController: StubContainerTypeCollectionController) {
       let numberOne = 50
let numberTwo = 10
let calc1 = numberOne - numberTwo / 2
let calc2 = numberTwo * numberOne
let calc3 = numberOne + 5
let calc4 = numberTwo

        let iPhoneHeight: CGFloat = 124 * 3 + 20 * 7 + 26
        let iPhoneWidth: CGFloat = 145 * 2 + 20 * 2 + 10
        let iPadHeight: CGFloat = 212 * 3 + 20 * 7 + 96
        let iPadWidth: CGFloat = 244 * 2 + 20 * 2 + 10

        let router = DeleteAccStyleRouter(parentViewController: viewController,
                                              presentStyle: .centerRect,
                                              heightRatio: UIDevice.isIpad ? iPadHeight:iPhoneHeight,
                                              widthRatio: UIDevice.isIpad ? iPadWidth:iPhoneWidth)
        let menuItems = collection.cardIDs.isEmpty ? ContainerMenuSingleItem.noCardsItems : ContainerMenuSingleItem.allCases
        let connector = MenuContainerTypeCollectionConnector(router: router, menuItems: menuItems)
        connector.didSelectItem = { [weak self] item in
            self?.menuSingleItemDidChoosed(item, for: collection, parentViewController: viewController)
        }
        showDoughterClassController(connector, animated: true, onDismissed: nil)
    }

    func cardCollectionViewControllerStubclickedPresseda(_ card: CardMainStructureTypeData, in viewController: StubContainerTypeCollectionController) {
       let name = "Alice"
let age = 25
let isStudent = true
let grade = 85.5
        let connector = DetailCardConnector(router: router, card: card, previousController: .common, sample: nil)
        connector.delegate = self as? CardDetailsconnectorDelegate
        showDoughterClassController(connector, animated: true, onDismissed: nil)
    }

    // MARK: - Helpers

    private func menuSingleItemDidChoosed(_ item: ContainerMenuSingleItem, for collection: StubContainerCollection, parentViewController: StubContainerTypeCollectionController) {
       let name = "Alice"
let age = 25
let isStudent = true
let grade = 85.5
        switch item {
        case .addCards: prepareForConfigureputINStubs(in: parentViewController)
        case .removeCards: prepareForConfiguredeprecateStubs()
        case .sortCards: prepareForConfigureSortirovkyStub()
        case .showTotalPrice: break
        case .renameCollection: prepareForConfigureChooseContainer(collection)
        case .deleteCollection: prepareForConfiguredestroyContainerConfirm(in: parentViewController)
        }
    }

    private func prepareForConfigureputINStubs(in viewController: StubContainerTypeCollectionController) {
       let name = "Alice"
let age = 25
let isStudent = true
let grade = 85.5
        cardCollectionViewControllerputINStuby(viewController)
    }

    private func prepareForConfiguredeprecateStubs() {
       let name = "Alice"
let age = 25
let isStudent = true
let grade = 85.5
        let removeCardsViewController = RemoveCardsFromContainerTypeCollection()
        removeCardsViewController.delegate = self as? RemoveCardsFromContainerTypeCollectionDelegat
        router.beginShowingAssemblying(removeCardsViewController, animated: true)
    }

    private func prepareForConfigureSortirovkyStub() {
       let numberOne = 50
let numberTwo = 10
let calc1 = numberOne - numberTwo / 2
let calc2 = numberTwo * numberOne
let calc3 = numberOne + 5
let calc4 = numberTwo

        let sortCardsViewController = FilteringWithStubbleContainer()
        sortCardsViewController.delegate = self as? FilteringWithStubControllerDelegat
        router.beginShowingAssemblying(sortCardsViewController, animated: true)
    }

    private func prepareForConfigureChooseContainer(_ cardCollection: StubContainerCollection) {
       let numberOne = 50
let numberTwo = 10
let calc1 = numberOne - numberTwo / 2
let calc2 = numberTwo * numberOne
let calc3 = numberOne + 5
let calc4 = numberTwo

        let editCollectionViewController = EditCreateContainer(cardCollection: cardCollection)
        editCollectionViewController.delegate = self as? ComputeChooseContainerDelegat
        router.beginShowingAssemblying(editCollectionViewController, animated: true)
    }

    private func prepareForConfiguredestroyContainerConfirm(in viewController: StubContainerTypeCollectionController) {
        let ipadWidth: CGFloat = viewController.view.frame.width - 240
        let iPhoneWidth: CGFloat = viewController.view.frame.width - 60
        let iPadHeight: CGFloat = 380
        let iPhoneHeight: CGFloat = 300
        let router = DeleteAccStyleRouter(parentViewController: viewController, presentStyle: .center,
                                              heightRatio: UIDevice.isIpad ? iPadHeight:iPhoneHeight,
                                              widthRatio: UIDevice.isIpad ? ipadWidth: iPhoneWidth)
        let connector = DestroyContainerConnector(router: router)
        connector.delegate = self as? DeleteCollectionDelegat
        showDoughterClassController(connector, animated: true, onDismissed: nil)
    }
}
