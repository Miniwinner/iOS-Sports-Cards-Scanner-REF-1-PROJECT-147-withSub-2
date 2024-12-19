import UIKit

final class DetailCardConnector {
    var children: [MainStubsConnector] = []
    let router: MainRouterOFApplication
    let card: CardMainStructureTypeData
    let cardType: StubType
    let encodedCardImage: Data?
    private var previousController: PreviousController
    weak var delegate: CardDetailsconnectorDelegate?

    private weak var cardDetailsViewController: CardOwnControllerDetail?
    private var scanCardViewController: MakeScanStubsController?

    init(
        router: MainRouterOFApplication,
        card: CardMainStructureTypeData,
        cardType: StubType = .addedCard,
        encodedCardImage: Data? = nil,
        previousController: PreviousController,
        sample: MakeScanStubsController? = nil

    ) {
        self.router = router
        self.card = card
        self.cardType = cardType
        self.encodedCardImage = encodedCardImage
        self.previousController = previousController
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

extension DetailCardConnector: MainStubsConnector {
    func showPreviewBeginnerSight(animated: Bool, onDismissed: Closure?) {
        let viewController = CardOwnControllerDetail(card: card, cardType: cardType, encodedCardImage: encodedCardImage, previousController: previousController, locked: true)
        viewController.delegate = self
        router.beginShowingAssemblying(viewController, animated: animated, onDismissed: onDismissed)
    }
}

extension DetailCardConnector: SearchCardconnectorDelegate {
    func searchCardconnectorStubdInserted(_ connector: LookingForCardConnector) {

        router.dissapearFullyFromView(animated: true)
    }
}

extension DetailCardConnector: CardOwnControllerDetailDelegate {

    func chooseStubyPodbischik(_ viewController: CardOwnControllerDetail) {
        cardDetailsViewController = viewController
        let router = DeleteAccStyleRouter(parentViewController: viewController, presentStyle: .fullscreen,
                                          heightRatio: viewController.view.frame.height,
                                          widthRatio: viewController.view.frame.width)
        let coordinator = StubKartiPremiumCoo(router: router)
        showDoughterClassController(coordinator, animated: true, onDismissed: nil)
    }

    func cardDetailsViewControllercloseclickedPresseda(_ viewController: CardOwnControllerDetail) {

        router.dissapearFullyFromView(animated: true)
    }

    func hidePosleLookingFora(_ viewController: CardOwnControllerDetail) {

        router.dissapearFullyFromView(animated: true)
        scanCardViewController?.restartScanning()
    }

    func showPreviousclickedPresseda(_ viewController: CardOwnControllerDetail) {
        router.dissapearAssemblying(viewController, animated: true)
    }

    func graderclickedPressed(_ viewController: CardOwnControllerDetail) {
        let inset: CGFloat = UIDevice.isIpad ? 160:40

        let router = DeleteAccStyleRouter(parentViewController: viewController, presentStyle: .centerRect,
                                              heightRatio: UIDevice.isIpad ? 360:260,
                                              widthRatio: viewController.view.frame.width - inset)
        let connector = GraderConnector(router: router, card: viewController.card)
        connector.didSelectGrader = { [unowned viewController] grader in
            viewController.gradeDidChoosed(grader)
        }
        showDoughterClassController(connector, animated: true, onDismissed: nil)
    }

    func priceObzorclickedPresseda(_ viewController: CardOwnControllerDetail) {
        let viewController = PriceValueCheckingController(
            card: viewController.card,
            grader: viewController.selectedGrader,
            encodedCardImage: viewController.encodedCardImage
        )
        router.beginShowingAssemblying(viewController, animated: true)

    }

    func chooseStubuclickedPresseda(_ viewController: CardOwnControllerDetail) {
        let cardsUpdater: StubUpdater
        if viewController.card is LookingForanieStubs {
            cardsUpdater = viewController.searchedCardsManager
        } else {
            cardsUpdater = UserStubManager.shared
        }

        let viewController = ChooseStubuController(card: viewController.card, cardsManager: cardsUpdater)
        viewController.delegate = self
        router.beginShowingAssemblying(viewController, animated: true)
    }

    func naitiStubyclickedPresseda(_ viewController: CardOwnControllerDetail) {
        let encodedCardImage = viewController.encodedCardImage ?? Data()
        let cardCategory = viewController.card.category
        let scannedCard = ScannedStub(encodedCardImage: encodedCardImage, cardCategory: cardCategory)

        let router = ModalNavRouter(parentViewController: viewController)
        let connector = LookingForCardConnector(router: router, card: scannedCard, sample: nil)
        connector.delegate = self
        showDoughterClassController(connector, animated: true, onDismissed: nil)
    }

    func stubInsertedclickedPresseda(_ viewController: CardOwnControllerDetail) {
        if let delegate = delegate {
            delegate.cardDetailsconnectorStubInserted(self, from: viewController)
        } else {
            router.dissapearFullyFromView(animated: true)
        }
    }

    func deprecateStubyclickedPresseda(_ card: CardMainStructureTypeData, in viewController: CardOwnControllerDetail) {
        cardDetailsViewController = viewController
        let inset: CGFloat = UIDevice.isIpad ? 140:40
        let router = DeleteAccStyleRouter(parentViewController: viewController, presentStyle: .center, heightRatio: UIDevice.isIpad ? 380: 330, widthRatio: viewController.view.frame.width - inset)
        let connector = RemoveConnector(router: router, card: card)
        connector.delegate = self
        showDoughterClassController(connector, animated: true, onDismissed: nil)
    }
}

extension DetailCardConnector: ChooseStubuDelegat {
    func editCardViewParallelclickedPresseda(_ viewController: ChooseStubuController) {
        let parallels = viewController.card.parallels
        let selectedParallelIndex = viewController.selectedParallelIndex

        let parallelSelectionViewController = ParallelChoiceController(parallels: parallels, selected: selectedParallelIndex)
        parallelSelectionViewController.parallelDidSelect = { [unowned parallelSelectionViewController, unowned router] index in
            viewController.reCalculatechoosedyIndex(index)
            router.dissapearAssemblying(parallelSelectionViewController, animated: true)
        }
        router.beginShowingAssemblying(parallelSelectionViewController, animated: true)
    }

    func editCardViewGradeclickedPresseda(_ viewController: ChooseStubuController) {
        let selectedGrader = viewController.selectedGrader
        let selectedGrade = viewController.selectedGrade

        let gradeSelectionViewController = GradeChoiceController(grader: selectedGrader, grade: selectedGrade)
        gradeSelectionViewController.gradeDidSelect = { [unowned gradeSelectionViewController, unowned router] grader, grade in
            viewController.reCalculatechoosediGrade(grader: grader, grade: grade)
            router.dissapearAssemblying(gradeSelectionViewController, animated: true)
        }
        router.beginShowingAssemblying(gradeSelectionViewController, animated: true)
    }

    func editCardViewControllerDetaliObnovleni(_ viewController: ChooseStubuController) {
        router.dissapearAssemblying(viewController, animated: true)
    }
}

extension DetailCardConnector: RemoveCardPromptconnectorDelegate {
    func removeCardPromptconnectorCardDeprecated(_ connector: RemoveConnector) {
        if let delegate = delegate {
            guard let viewController = cardDetailsViewController else { return }
            delegate.cardDetailsconnectorCardDeprecated(self, from: viewController)
        } else {
            router.dissapearFullyFromView(animated: true)
        }
    }

    func removeCardPromptconnectorDeprecatedMistake(_ connector: RemoveConnector) {
        guard let viewController = cardDetailsViewController else { return }
        let alertType: TipAlerta = .noInternetConnection(okAction: nil)
        AlertStubsService.shared.prepareAlertController(type: alertType, in: viewController)
    }
}

// MARK: - CardDetails connector Delegate

protocol CardDetailsconnectorDelegate: AnyObject {
    func cardDetailsconnectorStubInserted(_ connector: DetailCardConnector, from viewController: CardOwnControllerDetail)
    func cardDetailsconnectorCardDeprecated(_ connector: DetailCardConnector, from viewController: CardOwnControllerDetail)
}

extension CardDetailsconnectorDelegate where Self: MainStubsConnector {
    func cardDetailsconnectorStubInserted(_ connector: DetailCardConnector, from viewController: CardOwnControllerDetail) {
        router.dissapearFullyFromView(animated: true)
    }

    func cardDetailsconnectorCardDeprecated(_ connector: DetailCardConnector, from viewController: CardOwnControllerDetail) {
        router.dissapearFullyFromView(animated: true)
    }
}
