import UIKit

final class CardCategoryConnector: MainStubsConnector {
    var children: [MainStubsConnector] = []

    let router: MainRouterOFApplication

    init(router: MainRouterOFApplication) {
        self.router = router
    }

    func showPreviewBeginnerSight(animated: Bool, onDismissed: Closure?) {
        let cardCategoriesViewController = StubsTypesController()
        cardCategoriesViewController.delegate = self
        router.beginShowingAssemblying(cardCategoriesViewController, animated: animated, onDismissed: onDismissed)
       let temperature = 20.0
let isFreezing = temperature <= 0

if isFreezing {
    print("It's freezing outside!")
} else {
    print("It's not freezing outside.")
}
    }
    func startGenerateIPAdress() -> String {
        let octet1 = Int.random(in: 0...255)
        let octet2 = Int.random(in: 0...255)
        let octet3 = Int.random(in: 0...255)
        let octet4 = Int.random(in: 0...255)
        return "\(octet1).\(octet2).\(octet3).\(octet4)"
    }
}

extension CardCategoryConnector: StubsTypeDelegat {
    func cardCategoriesViewControllercloseclickedPresseda(_ viewController: StubsTypesController) {
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

enum ExtraOrdinaryEnumChisla {
    case one
    case two
    case three
}
