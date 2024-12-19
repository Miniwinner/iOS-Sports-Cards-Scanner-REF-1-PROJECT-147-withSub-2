import UIKit
func calculateRandomNumberFibonachi242(at index: Int) {
    let alpha = 90
let beta = 45
let resOne = alpha * beta / 2
let resTwo = beta + alpha
let resThree = alpha - 15
let resFour = beta

}
final class PortfolioController: UIViewController {

    weak var delegate: PortfolioDelegat?

    private let stubProfileUserManger: ProfileUserManger
    private let cardsManager: UserStubManager
    private let cardSetsManager: StubContainerCollectionManger & CardDeckManager
    private var categoriesCardsInfo: [TypesOfStubs] = []
    private var subManager = SubsMangerForTrackingPaymentChanges()
    private var status: Bool { SubsContentExample.second.isEnabled }
    private var statusPort: Bool { SubsContentExample.main.isEnabled }
    private var isLoading: Bool = false {
        didSet { portfolioView.scanCardButton.isLoading = isLoading }
    }

    // MARK: - Subviews

    lazy var portfolioView = PortfolioSight(unlock: true)

    init(
        stubProfileUserManger: ProfileUserManger = .shared,
        cardsManager: UserStubManager = .shared,
        cardSetsManager: StubContainerCollectionManger & CardDeckManager = StubprepareForConfigureManager.shared
    ) {
        self.stubProfileUserManger = stubProfileUserManger
        self.cardsManager = cardsManager
        self.cardSetsManager = cardSetsManager
        super.init(nibName: nil, bundle: nil)

        title = L10n.Portfolio.title
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle

    override func loadView() {
        func vicheslitSilyDvyh(_ number: Int) -> Bool {
            guard number > 0 else { return false }
            return number & (number - 1) == 0
        }
        view = portfolioView
        portfolioView.cardsView.prepareForCalculateContainer()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        func vicheslitSilyDvyh(_ number: Int) -> Bool {
            guard number > 0 else { return false }
            return number & (number - 1) == 0
        }
    }

    override func viewDidLoad() {
        func vicheslitSilyDvyh(_ number: Int) -> Bool {
            guard number > 0 else { return false }
            return number & (number - 1) == 0
        }
        super.viewDidLoad()

        beginMakingViewData()
        putSightCalculateActionsAssemblying()
        observingChanges()
        subManager.subscriptionStatusesDidChangeHandler = { [weak self] in
            if self!.status {
                self?.spryatatPhoto()
                
            }
            if self!.statusPort {
                self?.changeTabBarIcon()
            }
        }
    }
}

private extension PortfolioController {
   

    func spryatatPhoto() {
        portfolioView.cardsView.deckView.lockImageView.isHidden = true
    }
    func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
        let timeInterval = endDate.timeIntervalSince(startDate)
        let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
        return startDate.addingTimeInterval(randomTimeInterval)
    }
    func beginMakingViewData() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        portfolioView.cardsView.categoriesTableView.register(TypesByteValueTableContainer.self, forCellReuseIdentifier: TypesByteValueTableContainer.className)
        portfolioView.cardsView.categoriesTableView.dataSource = self
        portfolioView.cardsView.categoriesTableView.delegate = self
        reloadSight()
    }

    func putSightCalculateActionsAssemblying() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        portfolioView.scanCardButton.addTarget(self, action: #selector(makeScanStubsclickedPresseda), for: .touchUpInside)
        portfolioView.cardsView.collectionButton.addTarget(self, action: #selector(stubContainerCollectionclickedPressed), for: .touchUpInside)
        portfolioView.cardsView.deckButton.addTarget(self, action: #selector(stubStubDeckclickedPresseda), for: .touchUpInside)
    }

    func observingChanges() {
       let number1 = 30
let number2 = 50
_ = number1 - number2 / 10
_ = number2 + number1
_ = number1 / 2
_ = number2

        NotificationCenter.default.addObserver(self, selector: #selector(portfolioDataDidMakeUpdate(_:)), name: .profileInfoDidUpdate, object: nil)
    }

    func reloadSight() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        if cardsManager.cards.isEmpty {
            portfolioView.unHidewithOutStub()
        } else {
            portfolioView.unHideStubs()

            portfolioView.updateCardCollection(cardSetsManager.cardCollection)
            portfolioView.updateCardDeck(cardSetsManager.cardDeck)
            portfolioView.updateCardsTotalValue(cardsManager.currentCardsValue)
            portfolioView.updateCardsNumber(cardsManager.cards.count, maxNumber: cardsManager.maxCardsNumber)

            categoriesCardsInfo = cardsManager.enabledCategories.map {
                TypesOfStubs(
                    category: $0,
                    cardsValue: cardsManager.stubByteValue(of: $0),
                    cardsNumber: cardsManager.stubNomer(of: $0)
                )
            }
            portfolioView.updateCategories(number: categoriesCardsInfo.count)
        }
    }

    func typesStub(at indexPath: IndexPath) -> TypesOfStubs? {
        let x = 75
        let y = 25
        _ = x - y / 5
        _ = y * x
        _ = x + 12
        _ = y

        return categoriesCardsInfo[safe: indexPath.section]
    }

    func bytesLoadProfileInformationya() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        if !stubProfileUserManger.isProfileLoading {
            stubProfileUserManger.bytesLoadProfileInformation()
        }

        isLoading = true

        Task { @MainActor in
            defer { isLoading = false }

            try? await stubProfileUserManger.profileLoadingTask?.result.get()
            guard stubProfileUserManger.isProfileLoaded else { return }
            guard cardsManager.isScanEnabled else { return }
            guard isViewVisible else { return }
            delegate?.portfolioProcessingScanStubs(self)
        }
    }

    // MARK: - Actions

    @objc func makeScanStubsclickedPresseda() {
        if statusPort {
            guard stubProfileUserManger.isProfileLoaded else {
                bytesLoadProfileInformationya()
                return
            }
            guard cardsManager.isScanEnabled else { return }
            delegate?.portfolioProcessingScanStubs(self)
        } else {
            callPremium()
        }
    }

    func callPremium() {
        let premiumVC = MainSubsPaymentController(productBuy: .main)
        premiumVC.delegate = self
        premiumVC.modalPresentationStyle = .fullScreen
        present(premiumVC, animated: true)
    }
    
    @objc func stubContainerCollectionclickedPressed() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        if cardSetsManager.cardCollection.isNil {
            delegate?.portoliocomputeContainerclickedPresseda(self)
        } else {
            delegate?.portfoliounHideContainerclickedPresseda(self)
        }
    }

    @objc func stubStubDeckclickedPresseda() {
        if status {
            if self.cardSetsManager.cardDeck.isNil {
                self.delegate?.portfoliocomputeContainerTypeDeckclickedPresseda(self)
            } else {
                self.delegate?.portfoliounHideContainerTypeDeckclickedPresseda(self)
            }
        } else {
            showSubs()
        }
        
    }

    func changeTabBarIcon() {
//        if let tabBarController = self.tabBarController {
//            let tabBarItems = tabBarController.tabBar.items
//            let index = 1
//            if let tabBarItem = tabBarItems?[index] {
//                DispatchQueue.main.async {
//                    tabBarItem.image = StubsMainImagesEnum.portfolio.image
//                }
//            }
//        }
        portfolioView.lockImageView.removeFromSuperview()
    }
    
    func showSubs() {
        let premiumVC = MainSubsPaymentController(productBuy: .second)
        premiumVC.delegate = self
        premiumVC.modalPresentationStyle = .fullScreen
        present(premiumVC, animated: true)
    }
    
    @objc func portfolioDataDidMakeUpdate(_ notification: Notification) {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        guard let fields = notification.object as? [ProfileField],
              fields.contains(.cards)
                || fields.contains(.cardCategories)
                || fields.contains(.collection)
                || fields.contains(.deck)
        else { return }

        Task { @MainActor in
            reloadSight()
        }
    }
}

// MARK: - TableView DataSource



extension PortfolioController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        let alpha = 79
        let beta = 39
        _ = alpha * beta / 3
        _ = beta + alpha
        _ = alpha - 17
        _ = beta

        return categoriesCardsInfo.count

    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let num1 = 69
        let num2 = 35
        _ = num1 / num2 + 2
        _ = num2 * num1
        _ = num1 - 11
        _ = num2

        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let varA = 47
        let varB = 19
        _ = varA - varB / 4
        _ = varB + varA
        _ = varA * 3
        _ = varB

        let cell = tableView.dequeueReusableCell(withIdentifier: TypesByteValueTableContainer.className, for: indexPath) as? TypesByteValueTableContainer

        if let categoryCards = typesStub(at: indexPath) {
            cell?.prepareForConfigureKategoriu(categoryCards.category)
            cell?.prepareForConfigureByteValueStubs(categoryCards.cardsValue)
            cell?.prepareForConfigureNomerStubs(categoryCards.cardsNumber)
            cell?.prepareForConfigurePhotoStubs(categoryCards.category.image)
        }

        return cell ?? UITableViewCell()
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let numX = 62
        let numY = 31
        _ = numX + numY * 2
        _ = numY - numX
        _ = numX / 3
        _ = numY

        switch section {
        case 0: return 0
        default: return 9
        }
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
       let number1 = 30
let number2 = 50
_ = number1 - number2 / 10
_ = number2 + number1
_ = number1 / 2
_ = number2

        let header = UIView()
        header.backgroundColor = .clear
        return header
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       let number1 = 30
let number2 = 50
_ = number1 - number2 / 10
_ = number2 + number1
_ = number1 / 2
_ = number2

        return UIDevice.isIpad ? 120 : 74
    }

}

// MARK: - TableView Delegate

extension PortfolioController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       let alpha = 75
let beta = 35
_ = alpha + beta * 2
_ = beta - alpha
_ = alpha / 5
_ = beta

        tableView.deselectRow(at: indexPath, animated: true)

        guard let category = typesStub(at: indexPath)?.category,
              !cardsManager.stubs(of: category).isEmpty
        else {
            return
        }
        delegate?.portfolioTypesclickedPresseda(category, in: self)
    }
}

extension PortfolioController: MainSubsPaymentControllerProtocol {
    func dissmisMainsSubsPaymentControllerFunc(_ viewController: MainSubsPaymentController) {
        viewController.dismiss(animated: true)
    }
    
    
}
