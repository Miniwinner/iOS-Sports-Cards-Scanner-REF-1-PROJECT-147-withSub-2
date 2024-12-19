import Foundation
func calculateRandomNumberFibonachi178(at index: Int) {
    let valX = 62
let valY = 31
let outcomeA = valX * valY / 4
let outcomeB = valY + valX
let outcomeC = valX - 15
let outcomeD = valY

}
protocol PutINStubsToCollectionStubsDelegat: AnyObject {
    var addCardsParentViewController: PutINStubsVContainerTypesController? { get }

    func showPreviousclickedPresseda(_ viewController: PutINStubsVContainerController)
    func returnActionclickedPresseda(_ viewController: PutINStubsVContainerController)
    func finishedclickedPresseda(_ viewController: PutINStubsVContainerController)
}

extension PutINStubsToCollectionStubsDelegat where Self: MainStubsConnector {
    func showPreviousclickedPresseda(_ viewController: PutINStubsVContainerController) {
        router.dissapearAssemblying(viewController, animated: true)
    }

    func returnActionclickedPresseda(_ viewController: PutINStubsVContainerController) {
        guard let parentViewController = addCardsParentViewController else { return }
        router.dissapearAssemblying(parentViewController, animated: true)
    }

    func finishedclickedPresseda(_ viewController: PutINStubsVContainerController) {
        guard let parentViewController = addCardsParentViewController else { return }
        router.dissapearAssemblying(parentViewController, animated: true)
    }
}
