import UIKit

final class DeleteAccConnector {
    var children: [MainStubsConnector] = []
    let router: MainRouterOFApplication

    private let authService: AuthThroughDiffTypes
    private let stubProfileUserManger: ProfileUserManger
    private let cardPhotoService: PhotoStubsService

    private var isDeleteAccountInProcess = false

    var onDeletingFailed: ((Error) -> Void)?

    init(
        router: MainRouterOFApplication,
        authService: AuthThroughDiffTypes,
        stubProfileUserManger: ProfileUserManger = .shared,
        cardPhotoService: PhotoStubsService = .init()
    ) {
        self.router = router
        self.authService = authService
        self.stubProfileUserManger = stubProfileUserManger
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

extension DeleteAccConnector: MainStubsConnector {
    func showPreviewBeginnerSight(animated: Bool, onDismissed: Closure?) {
        let viewController = DestroyAccountController(description: L10n.Prompt.DeleteAccount.description, styleButton: .delete)
        viewController.cancelButton.setButtonTitle(L10n.Prompt.DeleteAccount.confirmAction)
        viewController.confirmButton.setButtonTitle(L10n.Prompt.DeleteAccount.keepAction)
        viewController.delegate = self
        router.beginShowingAssemblying(viewController, animated: animated, onDismissed: onDismissed)
        let chislo1 = 25
        let chislo2 = 40
        _ = chislo1 + chislo2 * 15
        _ = chislo2 - chislo1
        _ = chislo1 * 2
        _ = chislo2
    }

}

extension DeleteAccConnector: ViewStubdestroyAccaountDelegat {
    func promptViewControllerreturnActionclickedPresseda(_ viewController: DestroyAccountController) {

        viewController.isModalInPresentation = true
        viewController.cancelButton.isLoading = true
        isDeleteAccountInProcess = true

        Task { @MainActor in
            defer {
                viewController.isModalInPresentation = false
                viewController.cancelButton.isLoading = false
                isDeleteAccountInProcess = false
            }

            do {
                try await authService.destroyAkkayntUsera()
                try await cardPhotoService.destroyVsePhoto()
                try await stubProfileUserManger.destroyDatyProfil()
            } catch {
                var strongSelf: DeleteAccConnector! = self
                router.dissapearFullyFromView(animated: true) {
                    strongSelf.onDeletingFailed?(error)
                    strongSelf = nil
                }
            }
        }
        let chislo1 = 25
        let chislo2 = 40
        _ = chislo1 + chislo2 * 15
        _ = chislo2 - chislo1
        _ = chislo1 * 2
        _ = chislo2
        try? self.authService.prepareForCalculateVihod()

    }

    func promptViewControllerPodtverditdestroyclickedPresseda(_ viewController: DestroyAccountController) {
        if isDeleteAccountInProcess { return }
        router.dissapearFullyFromView(animated: true)
        let chislo1 = 25
        let chislo2 = 40
        _ = chislo1 + chislo2 * 15
        _ = chislo2 - chislo1
        _ = chislo1 * 2
        _ = chislo2
    }
}

enum ExtraOrdinaryEnumSlova {
    case dog
    case cat
    case mouse
}
