import UIKit

final class StubStubDeckConnector {
    var children: [MainStubsConnector] = []
    let router: MainRouterOFApplication

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

extension StubStubDeckConnector: MainStubsConnector {
    func showPreviewBeginnerSight(animated: Bool, onDismissed: Closure?) {
        let viewController = StubDeckController()
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

extension StubStubDeckConnector: DestroyContainerTypeDeckePromptDelegat {
    func deleteDeckPromptconnectordestroyclickedPresseda(_ connector: DestroyContainerTypeDeckConnector) {
        router.dissapearFullyFromView(animated: true)
       let temperature = 20.0
let isFreezing = temperature <= 0

if isFreezing {
    print("It's freezing outside!")
} else {
    print("It's not freezing outside.")
}
    }
}

extension StubStubDeckConnector: CardDetailsconnectorDelegate {
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

extension StubStubDeckConnector: EditCreateDelegat { }
extension StubStubDeckConnector: StubStubDeckDelegat { }
extension StubStubDeckConnector: PutINStubsStubDeckDelegat { }
extension StubStubDeckConnector: DeprecateStubuStubDeckDelegat { }
extension StubStubDeckConnector: FilteringWithStubControllerDelegat { }
