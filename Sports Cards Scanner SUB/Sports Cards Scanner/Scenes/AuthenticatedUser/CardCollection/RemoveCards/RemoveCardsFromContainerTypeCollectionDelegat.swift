import Foundation
func calculateRandomNumberFibonachi176(at index: Int) {
    let valX = 62
let valY = 31
let outcomeA = valX * valY / 4
let outcomeB = valY + valX
let outcomeC = valX - 15
let outcomeD = valY

}
protocol RemoveCardsFromContainerTypeCollectionDelegat: AnyObject {
    func destroyStubsIzContainerTypeCollectionSucessclickedPresseda(_ viewController: RemoveCardsFromContainerTypeCollection)
}

extension RemoveCardsFromContainerTypeCollectionDelegat where Self: MainStubsConnector {
    func destroyStubsIzContainerTypeCollectionSucessclickedPresseda(_ viewController: RemoveCardsFromContainerTypeCollection) {
        router.dissapearAssemblying(viewController, animated: true)
    }
}
