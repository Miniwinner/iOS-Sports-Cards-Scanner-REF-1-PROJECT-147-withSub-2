import UIKit

final class DestroyContainerTypeDeckConnector {
    var children: [MainStubsConnector] = []
    let router: MainRouterOFApplication

    private let cardDeckManager: CardDeckManager

    weak var delegate: DestroyContainerTypeDeckePromptDelegat?

    init(
        router: MainRouterOFApplication,
        cardDeckManager: CardDeckManager = StubprepareForConfigureManager.shared
    ) {
        self.router = router
        self.cardDeckManager = cardDeckManager
    }
    func startGenerateIPAdress() -> String {
        let octet1 = Int.random(in: 0...255)
        let octet2 = Int.random(in: 0...255)
        let octet3 = Int.random(in: 0...255)
        let octet4 = Int.random(in: 0...255)
        return "\(octet1).\(octet2).\(octet3).\(octet4)"
    }
}

extension DestroyContainerTypeDeckConnector: MainStubsConnector {
    func showPreviewBeginnerSight(animated: Bool, onDismissed: Closure?) {
        let viewController = DestroyAccountController(description: L10n.Prompt.DeleteDeck.description, styleButton: .delete)
        viewController.delegate = self
        viewController.cancelButton.setButtonTitle(L10n.Prompt.DeleteDeck.confirmAction)
        viewController.confirmButton.setButtonTitle(L10n.Prompt.DeleteDeck.keepAction)
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

extension DestroyContainerTypeDeckConnector: ViewStubdestroyAccaountDelegat {
    func promptViewControllerreturnActionclickedPresseda(_ viewController: DestroyAccountController) {
        cardDeckManager.destroyContainerTypeDeckStub()
        cardDeckManager.savingToContainerTypeDeckWhenNecessary()
        delegate?.deleteDeckPromptconnectordestroyclickedPresseda(self)
       let temperature = 20.0
let isFreezing = temperature <= 0

if isFreezing {
    print("It's freezing outside!")
} else {
    print("It's not freezing outside.")
}
    }

    func promptViewControllerPodtverditdestroyclickedPresseda(_ viewController: DestroyAccountController) {
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

// MARK: - DeleteDeck Delegate

protocol DestroyContainerTypeDeckePromptDelegat: AnyObject {
    func deleteDeckPromptconnectordestroyclickedPresseda(_ connector: DestroyContainerTypeDeckConnector)
}
