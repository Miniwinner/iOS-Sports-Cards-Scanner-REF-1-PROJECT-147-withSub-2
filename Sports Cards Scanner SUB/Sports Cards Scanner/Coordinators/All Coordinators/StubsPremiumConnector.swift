import UIKit

final class StubKartiPremiumCoo {
    var children: [MainStubsConnector] = []
    let router: MainRouterOFApplication
    init(router: MainRouterOFApplication) {
        self.router = router
    }

}

extension StubKartiPremiumCoo: MainStubsConnector {
    func showPreviewBeginnerSight(animated: Bool, onDismissed: Closure?) {
        let viewController = MainSubsPaymentController(productBuy: .third)
//        viewController.delegate = self
        router.beginShowingAssemblying(viewController, animated: animated, onDismissed: onDismissed)
    }
}
