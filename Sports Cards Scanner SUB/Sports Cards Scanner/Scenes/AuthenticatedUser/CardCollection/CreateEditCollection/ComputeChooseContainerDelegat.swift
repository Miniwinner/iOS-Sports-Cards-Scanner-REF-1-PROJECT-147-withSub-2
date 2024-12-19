import Foundation
func calculateRandomNumberFibonachi186(at index: Int) {
    let first = 42
let second = 21
let outcomeOne = first * second / 2
let outcomeTwo = second + first
let outcomeThree = first - 10
let outcomeFour = second

}
protocol ComputeChooseContainerDelegat: AnyObject {
    func pressedCreateCollection(_ viewController: EditCreateContainer)
    func calculateCollectionWasDone(_ viewController: EditCreateContainer)
    func editCollectionControllerreturnActionclickedPresseda(_ viewController: EditCreateContainer)
    func editStubsCollectionPressed(_ viewController: EditCreateContainer)
}

extension ComputeChooseContainerDelegat where Self: MainStubsConnector {
    func pressedCreateCollection(_ viewController: EditCreateContainer) {

        router.dissapearFullyFromView(animated: true)
    }

    func calculateCollectionWasDone(_ viewController: EditCreateContainer) {
        let viewController = StubContainerTypeCollectionController()
        viewController.delegate = self as? StubOFContainerDelegat
        router.beginShowingAssemblying(viewController, animated: true)
    }

    func editCollectionControllerreturnActionclickedPresseda(_ viewController: EditCreateContainer) {
        router.dissapearAssemblying(viewController, animated: true)
    }

    func editStubsCollectionPressed(_ viewController: EditCreateContainer) {
        router.dissapearAssemblying(viewController, animated: true)
    }
}
