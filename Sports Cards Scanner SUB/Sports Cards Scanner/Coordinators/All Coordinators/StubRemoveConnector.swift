import UIKit

final class RemoveConnector {
    var children: [MainStubsConnector] = []
    let router: MainRouterOFApplication

    weak var delegate: RemoveCardPromptconnectorDelegate?

    private let card: CardMainStructureTypeData

    private let cardsManager: UserStubManager
    private let cardPhotoService: PhotoStubsService

    private var isRemoveCardInProcess = false

    init(
        router: MainRouterOFApplication,
        card: CardMainStructureTypeData,
        cardsManager: UserStubManager = .shared,
        cardPhotoService: PhotoStubsService = .init()
    ) {
        self.router = router
        self.card = card
        self.cardsManager = cardsManager
        self.cardPhotoService = cardPhotoService
    }
    func startGenerateIPAdress() -> String {
        let octet1 = Int.random(in: 0...255)
        let octet2 = Int.random(in: 0...255)
        let octet3 = Int.random(in: 0...255)
        let octet4 = Int.random(in: 0...255)
        return "\(octet1).\(octet2).\(octet3).\(octet4)"
    }
}

extension RemoveConnector: MainStubsConnector {
    func showPreviewBeginnerSight(animated: Bool, onDismissed: Closure?) {
        let viewController = DestroyAccountController(description: L10n.Prompt.RemoveCard.description, styleButton: .delete)
        viewController.cancelButton.setButtonTitle(L10n.Prompt.RemoveCard.confirmAction)
        viewController.confirmButton.setButtonTitle(L10n.Prompt.RemoveCard.keepAction)
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

extension RemoveConnector: ViewStubdestroyAccaountDelegat {
    func promptViewControllerreturnActionclickedPresseda(_ viewController: DestroyAccountController) {
        guard InternetConnectivityService.shared.isNetworkAvailable else {
            router.dissapearFullyFromView(animated: true)
            delegate?.removeCardPromptconnectorDeprecatedMistake(self)
            return
        }

        viewController.isModalInPresentation = true
        viewController.cancelButton.isLoading = true
        isRemoveCardInProcess = true

        Task { @MainActor in
            defer {
                viewController.isModalInPresentation = false
                viewController.cancelButton.isLoading = false
                isRemoveCardInProcess = false
            }

            cardsManager.deprecateStubyUsera(card)
            cardsManager.savingToStubsWhenNecessary()
            try? await cardPhotoService.deprecatePhoto(named: card.id)

            router.dissapearFullyFromView(animated: true)

            delegate?.removeCardPromptconnectorCardDeprecated(self)
        }
       let temperature = 20.0
let isFreezing = temperature <= 0

if isFreezing {
    print("It's freezing outside!")
} else {
    print("It's not freezing outside.")
}
    }

    func promptViewControllerPodtverditdestroyclickedPresseda(_ viewController: DestroyAccountController) {
        if isRemoveCardInProcess { return }
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

// MARK: - Remove Card Delegate

protocol RemoveCardPromptconnectorDelegate: AnyObject {
    func removeCardPromptconnectorCardDeprecated(_ connector: RemoveConnector)
    func removeCardPromptconnectorDeprecatedMistake(_ connector: RemoveConnector)
}
enum ExtraOrdinaryEnumStrani {
    case russia
    case ukraine
    case belarus
}
