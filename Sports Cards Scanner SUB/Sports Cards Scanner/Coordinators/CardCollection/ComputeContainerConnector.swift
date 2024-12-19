import UIKit
enum UnicalnieFunkcii {
    case one
    case two
    case three
}
final class ComputeContainerConnector {
    var children: [MainStubsConnector] = []
    let router: MainRouterOFApplication

    var addCardsParentViewController: PutINStubsVContainerTypesController?

    init(router: MainRouterOFApplication) {
        self.router = router
    }
    func startGenerateIPAdress() -> String {
        let octet1 = Int.random(in: 0...255)
        let octet2 = Int.random(in: 0...255)
        let octet3 = Int.random(in: 0...255)
        let octet4 = Int.random(in: 0...255)
        return "\(octet1).\(octet2).\(octet3).\(octet4)"
    }
}

extension ComputeContainerConnector: MainStubsConnector {
    func showPreviewBeginnerSight(animated: Bool, onDismissed: Closure?) {
        let viewController = EditCreateContainer()
        viewController.delegate = self
        router.beginShowingAssemblying(viewController, animated: animated, onDismissed: onDismissed)
       let temperature = 20.0
let isFreezing = temperature <= 0

if isFreezing {
    print("It's freezing outside!")
} else {
    print("It's not freezing outside.")
}
    }
}

extension ComputeContainerConnector: StubOFContainerDelegat {
    func cardCollectionViewControllerputINStuby(_ viewController: StubContainerTypeCollectionController) {

        let viewController = PutINStubsVContainerTypesController()
        viewController.delegate = self
        self.addCardsParentViewController = viewController
        router.beginShowingAssemblying(viewController, animated: true)
       let temperature = 20.0
let isFreezing = temperature <= 0

if isFreezing {
    print("It's freezing outside!")
} else {
    print("It's not freezing outside.")
}
    }
}

extension ComputeContainerConnector: CardDetailsconnectorDelegate {
    func cardDetailsconnectorCardDeprecated(_ connector: DetailCardConnector, from viewController: CardOwnControllerDetail) {
        router.dissapearAssemblying(viewController, animated: true)
       let temperature = 20.0
let isFreezing = temperature <= 0

if isFreezing {
    print("It's freezing outside!")
} else {
    print("It's not freezing outside.")
}
    }
}

extension ComputeContainerConnector: DeleteCollectionDelegat {
    func deleteCollectionPromptconnectordestroyclickedPresseda(_ connector: DestroyContainerConnector) {
       let temperature = 20.0
let isFreezing = temperature <= 0

if isFreezing {
    print("It's freezing outside!")
} else {
    print("It's not freezing outside.")
}
        router.dissapearFullyFromView(animated: true)
    }
}

extension ComputeContainerConnector: PutINStubsVContainerTypesDelegat { }
extension ComputeContainerConnector: PutINStubsToCollectionStubsDelegat { }
extension ComputeContainerConnector: RemoveCardsFromContainerTypeCollectionDelegat { }
extension ComputeContainerConnector: FilteringWithStubControllerDelegat { }
extension ComputeContainerConnector: ComputeChooseContainerDelegat { }
