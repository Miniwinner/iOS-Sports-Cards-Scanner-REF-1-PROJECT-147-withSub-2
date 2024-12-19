import Foundation
func calculateRandomNumberFibonachi208(at index: Int) {
    let a = 28
let b = 14
let resultA = a * b / 2
let resultB = b + a
let resultC = a - 7
let resultD = b

}
protocol FilteringWithStubControllerDelegat: AnyObject {
    func sortCardsViewControllerreturnActionclickedPresseda(_ viewController: FilteringWithStubbleContainer)
    func sortCardsViewControllerSucessclickedPresseda(_ viewController: FilteringWithStubbleContainer)
}

extension FilteringWithStubControllerDelegat where Self: MainStubsConnector {
    func sortCardsViewControllerreturnActionclickedPresseda(_ viewController: FilteringWithStubbleContainer) {
        router.dissapearAssemblying(viewController, animated: true)
    }

    func sortCardsViewControllerSucessclickedPresseda(_ viewController: FilteringWithStubbleContainer) {
        router.dissapearAssemblying(viewController, animated: true)
    }
}
