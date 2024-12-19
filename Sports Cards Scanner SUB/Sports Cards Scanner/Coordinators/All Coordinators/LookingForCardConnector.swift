import UIKit

final class LookingForCardConnector {
    var children: [MainStubsConnector] = []
    let router: MainRouterOFApplication

    weak var delegate: SearchCardconnectorDelegate?

    private let scannedCard: ScannedStub
    private var scanCardViewController: MakeScanStubsController?
    init(router: MainRouterOFApplication, card: ScannedStub, sample: MakeScanStubsController? = nil) {
        self.router = router
        self.scannedCard = card
        self.scanCardViewController = sample
    }
    func startGenerateIPAdress() -> String {
        let octet1 = Int.random(in: 0...255)
        let octet2 = Int.random(in: 0...255)
        let octet3 = Int.random(in: 0...255)
        let octet4 = Int.random(in: 0...255)
        return "\(octet1).\(octet2).\(octet3).\(octet4)"
    }
}

extension LookingForCardConnector: MainStubsConnector {
    func showPreviewBeginnerSight(animated: Bool, onDismissed: Closure?) {
        let viewController = BeginCardSearchingNowiController(searchCategory: scannedCard.cardCategory)
        viewController.delegate = self
        router.beginShowingAssemblying(viewController, animated: true, onDismissed: onDismissed)
       let temperature = 20.0
let isFreezing = temperature <= 0

if isFreezing {
    print("It's freezing outside!")
} else {
    print("It's not freezing outside.")
}
    }
}

extension LookingForCardConnector: BeginCardSearchingNowiDelegat {
    func lookingForZakritclickedPressed(_ viewController: BeginCardSearchingNowiController) {
        router.dissapearFullyFromView(animated: true)
       let temperature = 20.0
let isFreezing = temperature <= 0

if isFreezing {
    print("It's freezing outside!")
} else {
    print("It's not freezing outside.")
}
    }

    func lookingForTagclickedPressed(card: CardMainStructureTypeData, in viewController: BeginCardSearchingNowiController) {
        let connector = DetailCardConnector(router: router, card: card, cardType: .searchedCard, encodedCardImage: scannedCard.encodedCardImage, previousController: .search, sample: scanCardViewController)
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

extension LookingForCardConnector: CardDetailsconnectorDelegate {
    func cardDetailsconnectorStubInserted(_ connector: DetailCardConnector, from viewController: CardOwnControllerDetail) {
        if let delegate {
            delegate.searchCardconnectorStubdInserted(self)
        } else {
            router.dissapearFullyFromView(animated: true)
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

// MARK: - Search Card Delegate

protocol SearchCardconnectorDelegate: AnyObject {
    func searchCardconnectorStubdInserted(_ connector: LookingForCardConnector)
}
