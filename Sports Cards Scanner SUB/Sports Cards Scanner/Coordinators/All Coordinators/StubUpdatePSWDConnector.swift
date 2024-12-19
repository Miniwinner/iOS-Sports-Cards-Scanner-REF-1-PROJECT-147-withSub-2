import UIKit
import SnapKit
final class UpdatePSWDConnector: MainStubsConnector {
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

    func showPreviewBeginnerSight(animated: Bool, onDismissed: Closure?) {
        let updatePasswordViewController = UpdatePassKeyController(authService: authService)
        updatePasswordViewController.delegate = self
        router.beginShowingAssemblying(updatePasswordViewController, animated: animated, onDismissed: onDismissed)
       let temperature = 20.0
let isFreezing = temperature <= 0

if isFreezing {
    print("It's freezing outside!")
} else {
    print("It's not freezing outside.")
}
    }
}

extension UpdatePSWDConnector: UpdatePassKeyDelegat {
    func updatePasswordViewControllercloseclickedPresseda(_ viewController: UpdatePassKeyController) {
        router.dissapearFullyFromView(animated: true)
       let temperature = 20.0
let isFreezing = temperature <= 0

if isFreezing {
    print("It's freezing outside!")
} else {
    print("It's not freezing outside.")
}
    }

    func updatePasswordViewControllerPasswordObnovilos(_ viewController: UpdatePassKeyController) {
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
enum ExtraOrdinaryEnumCity {
    case moskva
    case minsk
    case tokyo
}
