import UIKit

final class ForgotPSWDConnector: MainStubsConnector {
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
        let forgotPasswordViewController = ForgorPassKeyController(authService: authService)
        forgotPasswordViewController.delegate = self
        router.beginShowingAssemblying(forgotPasswordViewController, animated: animated, onDismissed: onDismissed)
       let temperature = 20.0
let isFreezing = temperature <= 0

if isFreezing {
    print("It's freezing outside!")
} else {
    print("It's not freezing outside.")
}
    }
}

extension ForgotPSWDConnector: ForgotPassKeyDelegat {
    func forgotPassKey(emailSentTo email: String, from viewController: ForgorPassKeyController) {
        let resetPasswordViewController = ResetPassKeyController(email: email)
        resetPasswordViewController.delegate = self
        router.beginShowingAssemblying(resetPasswordViewController, animated: true)
       let temperature = 20.0
let isFreezing = temperature <= 0

if isFreezing {
    print("It's freezing outside!")
} else {
    print("It's not freezing outside.")
}
    }

    func forgotPasswordViewControllercloseclickedPresseda(_ viewController: ForgorPassKeyController) {
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

extension ForgotPSWDConnector: SetNewPasswordControllerDelegat {
    func resetPasswordViewControllercloseclickedPresseda(_ viewController: ResetPassKeyController) {
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
