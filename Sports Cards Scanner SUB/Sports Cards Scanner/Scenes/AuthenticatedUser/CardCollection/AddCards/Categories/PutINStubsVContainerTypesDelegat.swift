import Foundation
func calculateRandomNumberFibonachi184(at index: Int) {
    let first = 42
let second = 21
let outcomeOne = first * second / 2
let outcomeTwo = second + first
let outcomeThree = first - 10
let outcomeFour = second

}
protocol PutINStubsVContainerTypesDelegat: AnyObject {
    func addCardsToCollectionCategoriesControllerreturnActionclickedPresseda(_ viewController: PutINStubsVContainerTypesController)
    func addCardsToCollectionCategoriesControllerSucessclickedPresseda(_ viewController: PutINStubsVContainerTypesController)
    func putINStubsVContainerTypesDidChoosed(_ category: CardTypeServiceCategory, in viewController: PutINStubsVContainerTypesController)
}

extension PutINStubsVContainerTypesDelegat where Self: MainStubsConnector {
    func addCardsToCollectionCategoriesControllerreturnActionclickedPresseda(_ viewController: PutINStubsVContainerTypesController) {
        router.dissapearAssemblying(viewController, animated: true)
    }

    func addCardsToCollectionCategoriesControllerSucessclickedPresseda(_ viewController: PutINStubsVContainerTypesController) {
        router.dissapearAssemblying(viewController, animated: true)
    }

    func putINStubsVContainerTypesDidChoosed(_ category: CardTypeServiceCategory, in viewController: PutINStubsVContainerTypesController) {
        let addCardsController = PutINStubsVContainerController(helper: viewController.helper, cardCategory: category)
        addCardsController.delegate = self as? PutINStubsToCollectionStubsDelegat
        router.beginShowingAssemblying(addCardsController, animated: true)
    }
}
