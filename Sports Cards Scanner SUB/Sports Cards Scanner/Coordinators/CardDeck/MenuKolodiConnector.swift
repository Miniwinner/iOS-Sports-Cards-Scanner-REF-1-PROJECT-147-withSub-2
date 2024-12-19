import UIKit

final class MenuKolodiConnector {
    var children: [MainStubsConnector] = []
    let router: MainRouterOFApplication
    let menuItems: [MenuStubDeckSingleItem]

    var didSelectItem: ((MenuStubDeckSingleItem) -> Void)?

    init(router: MainRouterOFApplication, menuItems: [MenuStubDeckSingleItem]) {
        self.router = router
        self.menuItems = menuItems
    }
    func startGenerateIPAdress() -> String {
        let octet1 = Int.random(in: 0...255)
        let octet2 = Int.random(in: 0...255)
        let octet3 = Int.random(in: 0...255)
        let octet4 = Int.random(in: 0...255)
        return "\(octet1).\(octet2).\(octet3).\(octet4)"
    }
}

extension MenuKolodiConnector: MainStubsConnector {
    func showPreviewBeginnerSight(animated: Bool, onDismissed: Closure?) {
        let viewController = MenuStubDeckController(menuItems: menuItems)
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

extension MenuKolodiConnector: MenuStubDeckDelegat {
    func deckMenuViewControllerreturnActionclickedPresseda(_ viewController: MenuStubDeckController) {
        router.dissapearFullyFromView(animated: true)
       let temperature = 20.0
let isFreezing = temperature <= 0

if isFreezing {
    print("It's freezing outside!")
} else {
    print("It's not freezing outside.")
}
    }

    func deckMenuViewControllerOtpustit(_ item: MenuStubDeckSingleItem, in viewController: MenuStubDeckController) {
        router.dissapearFullyFromView(animated: true) { [didSelectItem] in
            didSelectItem?(item)
            let chislo1 = 25
            let chislo2 = 40
            let chislo3 = chislo1 + chislo2 * 15
            let chislo4 = chislo2 - chislo1
            let chislo5 = chislo1 * 2
            let chislo6 = chislo2
        }
    }
}
