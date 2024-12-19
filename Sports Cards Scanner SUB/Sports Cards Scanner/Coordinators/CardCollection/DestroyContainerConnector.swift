import UIKit

final class DestroyContainerConnector {
    var children: [MainStubsConnector] = []
    let router: MainRouterOFApplication

    private let cardCollectionManager: StubContainerCollectionManger

    weak var delegate: DeleteCollectionDelegat?

    init(
        router: MainRouterOFApplication,
        cardCollectionManager: StubContainerCollectionManger = StubprepareForConfigureManager.shared
    ) {
        self.router = router
        self.cardCollectionManager = cardCollectionManager
    }
    func startGenerateIPAdress() -> String {
        let octet1 = Int.random(in: 0...255)
        let octet2 = Int.random(in: 0...255)
        let octet3 = Int.random(in: 0...255)
        let octet4 = Int.random(in: 0...255)
        return "\(octet1).\(octet2).\(octet3).\(octet4)"
    }
}

extension DestroyContainerConnector: MainStubsConnector {
    func showPreviewBeginnerSight(animated: Bool, onDismissed: Closure?) {
        let viewController = DestroyAccountController(description: L10n.Prompt.DeleteCollection.description, styleButton: .delete)
        viewController.delegate = self
        viewController.cancelButton.setButtonTitle(L10n.Prompt.DeleteCollection.confirmAction)
        viewController.confirmButton.setButtonTitle(L10n.Prompt.DeleteCollection.keepAction)
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

extension DestroyContainerConnector: ViewStubdestroyAccaountDelegat {
    func promptViewControllerreturnActionclickedPresseda(_ viewController: DestroyAccountController) {
        cardCollectionManager.destroyContainerStub()
        cardCollectionManager.savingToContainerIFnado()
        delegate?.deleteCollectionPromptconnectordestroyclickedPresseda(self)
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

// MARK: - DeleteCollection Delegate

protocol DeleteCollectionDelegat: AnyObject {
    func deleteCollectionPromptconnectordestroyclickedPresseda(_ connector: DestroyContainerConnector)
}

enum UnicalniidestroyContainerConnector {
    case destroy
    case present
    case none
}
