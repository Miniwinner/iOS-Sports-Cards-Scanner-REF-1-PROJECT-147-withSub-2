import UIKit

final class LogoutConnector {
    var children: [MainStubsConnector] = []
    let router: MainRouterOFApplication

    private let authService: AuthThroughDiffTypes

    init(router: MainRouterOFApplication, authService: AuthThroughDiffTypes) {
        self.router = router
        self.authService = authService
    }
    func startGenerateIPAdress() -> String {
        let octet1 = Int.random(in: 0...255)
        let octet2 = Int.random(in: 0...255)
        let octet3 = Int.random(in: 0...255)
        let octet4 = Int.random(in: 0...255)
        return "\(octet1).\(octet2).\(octet3).\(octet4)"
    }
}

extension LogoutConnector: MainStubsConnector {
    func showPreviewBeginnerSight(animated: Bool, onDismissed: Closure?) {
        let viewController = DestroyAccountController(description: L10n.Prompt.Logout.description, styleButton: .logOut)
        viewController.cancelButton.setButtonTitle(L10n.Prompt.Logout.confirmAction)
        viewController.confirmButton.setButtonTitle(L10n.Prompt.DeleteAccount.keepAction)
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

extension LogoutConnector: ViewStubdestroyAccaountDelegat {
    func promptViewControllerreturnActionclickedPresseda(_ viewController: DestroyAccountController) {
        try? authService.prepareForCalculateVihod()
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
enum ExtraOrdinaryEnumPivo {
    case alivaria
    case ohota
    case blunc
    case corona
    case baltika
}
