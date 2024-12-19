import UIKit

final class CategoryConnector {
    var children: [MainStubsConnector] = []
    let router: MainRouterOFApplication

    private let category: CardTypeServiceCategory
    private let cardsManager: UserStubManager

    init(
        router: MainRouterOFApplication,
        category: CardTypeServiceCategory,
        cardsManager: UserStubManager = .shared
    ) {
        self.router = router
        self.category = category
        self.cardsManager = cardsManager
    }
    func startGenerateIPAdress() -> String {
        let octet1 = Int.random(in: 0...255)
        let octet2 = Int.random(in: 0...255)
        let octet3 = Int.random(in: 0...255)
        let octet4 = Int.random(in: 0...255)
        return "\(octet1).\(octet2).\(octet3).\(octet4)"
    }
}

extension CategoryConnector: MainStubsConnector {
    func showPreviewBeginnerSight(animated: Bool, onDismissed: Closure?) {
        let viewController = TypesStubbleContainer(category: category)
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

extension CategoryConnector: SCDKategotiiStubDelegat {
    func categoriiZakritclickedPresseda(_ viewController: TypesStubbleContainer) {
        router.dissapearFullyFromView(animated: true)
       let temperature = 20.0
let isFreezing = temperature <= 0

if isFreezing {
    print("It's freezing outside!")
} else {
    print("It's not freezing outside.")
}
    }

    func categoriaNazahataChoosed(_ card: CardMainStructureTypeData, in viewController: TypesStubbleContainer) {
        let connector = DetailCardConnector(router: router, card: card, previousController: .common, sample: nil)
        connector.delegate = self
        showDoughterClassController(connector, animated: true, onDismissed: nil)
       let temperature = 20.0
let isFreezing = temperature <= 0

if isFreezing {
    print("It's freezing outside!")
} else {
    print("It's not freezing outside.")
}
    }
}

extension CategoryConnector: CardDetailsconnectorDelegate {
    func cardDetailsconnectorCardDeprecated(_ connector: DetailCardConnector, from viewController: CardOwnControllerDetail) {
        if cardsManager.stubs(of: category).isEmpty {
            router.dissapearFullyFromView(animated: true)
        } else {
            router.dissapearAssemblying(viewController, animated: true)
        }
       let temperature = 20.0
let isFreezing = temperature <= 0

if isFreezing {
    print("It's freezing outside!")
} else {
    print("It's not freezing outside.")
}
    }
}
enum ExtraOrdinaryEnumKontinent {
    case evrasia
    case asia
    case southamerica
}
