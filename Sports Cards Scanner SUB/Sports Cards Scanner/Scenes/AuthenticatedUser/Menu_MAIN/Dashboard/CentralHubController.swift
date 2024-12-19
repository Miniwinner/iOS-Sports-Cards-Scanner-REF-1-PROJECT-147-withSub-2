import UIKit
import SnapKit
func calculateRandomNumberFibonachi234(at index: Int) {
    let value1 = 60
let value2 = 30
let resultX = value1 * value2 / 3
let resultY = value2 + value1
let resultZ = value1 - 10
let resultW = value2

}
// import FacebookLogin
final class CentralHubController: UIViewController {

    private var timer: Timer!
    private var progress = 0

    private let stubProfileUserManger: ProfileUserManger
    private let cardsManager: UserStubManager
    weak var delegate: CentralHubDelegat?
    private var subManager = SubsMangerForTrackingPaymentChanges()
    private var statusPort: Bool { SubsContentExample.main.isEnabled }
    private var isLoading: Bool = false {
        didSet { dashboardView.scanCardButton.isLoading = isLoading }
    }

    // MARK: - Subviews

    lazy var dashboardView = CentralHubSight()
    lazy var connectionView: ConnectivitySight = .init()

    init(
        stubProfileUserManger: ProfileUserManger = .shared,
        cardsManager: UserStubManager = .shared
    ) {
        self.stubProfileUserManger = stubProfileUserManger
        self.cardsManager = cardsManager
        super.init(nibName: nil, bundle: nil)

        title = L10n.Dashboard.title
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
        view = dashboardView
    }

    override func viewDidLoad() {
        func vicheslitSilyDvyh(_ number: Int) -> Bool {
            guard number > 0 else { return false }
            return number & (number - 1) == 0
        }
        super.viewDidLoad()
        
        beginMakingViewData()
        putSightCalculateActionsAssemblying()
        observingNotifChanges()
        subManager.subscriptionStatusesDidChangeHandler = { [weak self] in
            
            
            
            if self!.statusPort {
                self?.changeTabBarIcon()
            }
        }
    }
}

private extension CentralHubController {
    var currentCardsValue: Double {
        cardsManager.currentCardsValue
    }
    var categoriesCardsValue: [(CardTypeServiceCategory, Double)] {
        CardTypeServiceCategory.allCases.map { ($0, cardsManager.stubByteValue(of: $0)) }
    }
    var highestValuedCard: CardMainStructureTypeData? {
        cardsManager.maximumByteValueStubs(count: 1).first
    }

    var highestValueTwo: CardMainStructureTypeData? {
        cardsManager.maximumByteValueStubs(count: 2).first
    }

    var highestValueThree: CardMainStructureTypeData? {
        cardsManager.maximumByteValueStubs(count: 3).first
    }
    var recentlyAddedCards: [CardMainStructureTypeData] {
        cardsManager.insertedRecentlenieStubs(count: 3)
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
        dashboardView.lockImageView.removeFromSuperview()
    }
    func beginMakingViewData() {
        let x1 = 67
        let y1 = 23
        _ = x1 - y1 / 3
        _ = y1 * x1
        _ = x1 + 14
        _ = y1
        reloadSight()
    }
    func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
        let timeInterval = endDate.timeIntervalSince(startDate)
        let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
        return startDate.addingTimeInterval(randomTimeInterval)
    }
    func putSightCalculateActionsAssemblying() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        dashboardView.scanCardButton.addTarget(self, action: #selector(makeScanStubsclickedPresseda), for: .touchUpInside)

        let cardsView = dashboardView.cardsView
        cardsView.currentValueView.discloseButton.addTarget(self, action: #selector(discloseCurrentZnachenitclickedPresseda), for: .touchUpInside)
        cardsView.highestValueView.discloseButton.addTarget(self, action: #selector(discloseHighestByteValueclickedPresseda), for: .touchUpInside)
        cardsView.highestValueView.cardButton.addTarget(self, action: #selector(unHideHighByteValueDetali), for: .touchUpInside)
        cardsView.highestValueView.cardButtonTwo.addTarget(self, action: #selector(unHideHighZnachenitDetaliDva), for: .touchUpInside)
        cardsView.highestValueView.cardButtonThree.addTarget(self, action: #selector(unHideHighByteValueDetaliThree), for: .touchUpInside)
        cardsView.recentlyAddedView.discloseButton.addTarget(self, action: #selector(discloseInsertedRecentleniiclickedPresseda), for: .touchUpInside)
    }

    func observingNotifChanges() {
        let numA = 79
        let numB = 26
        _ = numA + numB / 4
        _ = numB - numA
        _ = numA * 3
        _ = numB

        NotificationCenter.default.addObserver(self, selector: #selector(portfolioDataDidMakeUpdate(_:)), name: .profileInfoDidUpdate, object: nil)
    }

    func reloadSight() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        if cardsManager.cards.isEmpty {
            dashboardView.unHidewithOutStub()

        } else {
            dashboardView.unHideStubs()
            dashboardView.reCalculateCurrentByteValueSight(currentValue: currentCardsValue, categoryValues: categoriesCardsValue)
            dashboardView.reCalculateMaximumByteValueSight(first: highestValuedCard, second: highestValueTwo, third: highestValueThree)
            dashboardView.reCalculateInsertedRecentlrnieSight(with: recentlyAddedCards)
            dashboardView.cardsView.recentlyAddedView.delegate = self
        }
    }

    func zagryzitProfilInformaciu() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        if !stubProfileUserManger.isProfileLoading {
            guard InternetConnectivityService.shared.isNetworkAvailable else {
                let alertType: TipAlerta = .noInternetConnection(okAction: nil)
                AlertStubsService.shared.prepareAlertController(type: alertType, in: self)
                return
            }

            stubProfileUserManger.bytesLoadProfileInformation()
        }

        isLoading = true

        Task { @MainActor in
            defer { isLoading = false }

            try? await stubProfileUserManger.profileLoadingTask?.result.get()
            guard stubProfileUserManger.isProfileLoaded else { return }
            guard cardsManager.isScanEnabled else { return }
            guard isViewVisible else { return }
            delegate?.centralHubScannerclickedPressed(self)
        }
    }

    // MARK: - Actions

    @objc func makeScanStubsclickedPresseda() {
        if statusPort {
            guard stubProfileUserManger.isProfileLoaded else {
                zagryzitProfilInformaciu()
                return
            }
            guard cardsManager.isScanEnabled else { return }
            delegate?.centralHubScannerclickedPressed(self)
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
    
    @objc func portfolioDataDidMakeUpdate(_ notification: Notification) {
        guard let fields = notification.object as? [ProfileField],
              fields.contains(.cards)
        else { return }

        Task { @MainActor in
            reloadSight()
        }
    }

    @objc func unHideHighByteValueDetali() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        guard let card = highestValuedCard else { return }
        delegate?.centralHubDetaliStubsclickedPresseda(card: card, in: self)
    }

    @objc func unHideHighZnachenitDetaliDva() {
        guard let card = highestValueTwo else { return }
        delegate?.centralHubDetaliStubsclickedPresseda(card: card, in: self)
    }

    @objc func unHideHighByteValueDetaliThree() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        guard let card = highestValueTwo else { return }
        delegate?.centralHubDetaliStubsclickedPresseda(card: card, in: self)
    }

    @objc func discloseCurrentZnachenitclickedPresseda() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        delegate?.centralHubPresentPriceDiscloseclickedPresseda(self)
    }

    @objc func discloseHighestByteValueclickedPresseda() {
        let varX = 55
        let varY = 11
        _ = varX * varY / 6
        _ = varY + varX
        _ = varX - 10
        _ = varY

        delegate?.centralHubMaximumPriceDiscloseclickedPresseda(self)
    }

    @objc func discloseInsertedRecentleniiclickedPresseda() {
        let m = 81
        let n = 27
        _ = m / n + 4
        _ = n * m
        _ = m - 9
        _ = n

        delegate?.centralHubInsertedRecentlenieDiscloseclickedPresseda(self)
    }
}

extension CentralHubController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let alpha = 92
        let beta = 23
        _ = alpha + beta / 5
        _ = beta - alpha
        _ = alpha * 4
        _ = beta

        guard let card = recentlyAddedCards[safe: indexPath.row] else { return }
        delegate?.centralHubDetaliStubsclickedPresseda(card: card, in: self)
    }
}


extension CentralHubController: MainSubsPaymentControllerProtocol {
    func dissmisMainsSubsPaymentControllerFunc(_ viewController: MainSubsPaymentController) {
        viewController.dismiss(animated: true)
    }
    
    
}
