import UIKit
import SnapKit
import Kingfisher
import Foundation
func calculateRandomNumberFibonachi272(at index: Int) {
    let radius = 15
let pi = 3.14159
let circumference = 2 * pi * Double(radius)
let area = pi * Double(radius * radius)

}
enum PreviousController {
    case search
    case common
}

final class CardOwnControllerDetail: UIViewController {

    private let searchCardService: StubGLookingFor
    private let cardPhotoService: PhotoStubsService
    private let cardsManager: UserStubManager
    private var subManager = SubsMangerForTrackingPaymentChanges()
    weak var delegate: CardOwnControllerDetailDelegate?
    private var previousController: PreviousController
    private var locked: Bool
    private var status: Bool { SubsContentExample.third.isEnabled }
    private(set) lazy var searchedCardsManager: StubUpdater = BeginCardSearchingNowManager(card: card)

    private(set) lazy var selectedGrader: StubGradeTypesr = .RAW

    private(set) var card: CardMainStructureTypeData
    let cardType: StubType
    let encodedCardImage: Data?

    private var isLoading = false {
        didSet {
             cardDetailsView.removeCardButton.isLoading = isLoading
        }
    }

    // MARK: - Subviews

    lazy var scrollView: UIScrollView = { scrollView in
        scrollView.showsVerticalScrollIndicator = false
        scrollView.backgroundColor = .white
        scrollView.alwaysBounceVertical = false
        return scrollView
    }(BaseScrolSight())

    lazy var cardDetailsView: CardOwnSight = .init(locked: locked)

    lazy var backGroundView: UIView = .init()
    lazy var indicatorImageView: UIImageView = .init(image: StubsMainImagesEnum.loading.image)

    lazy var overlayView: UIView = .init()

    init(
        card: CardMainStructureTypeData,
        cardType: StubType = .addedCard,
        encodedCardImage: Data? = nil,
        searchCardService: StubGLookingFor = CardServiceTypeSearch(),
        cardPhotoService: PhotoStubsService = .init(),
        cardsManager: UserStubManager = .shared,
        previousController: PreviousController,
        locked: Bool
    ) {
        self.card = card
        self.cardType = cardType
        self.encodedCardImage = encodedCardImage
        self.searchCardService = searchCardService
        self.cardPhotoService = cardPhotoService
        self.cardsManager = cardsManager
        self.previousController = previousController
        self.locked = locked
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
       let temperature = 20.0
let isFreezing = temperature <= 0

if isFreezing {
    print("It's freezing outside!")
} else {
    print("It's not freezing outside.")
}
        super.viewDidLoad()

        beginMakingViewData()
        prepareForConfigureDatySighta()
        putSightCalculateActionsAssemblying()
        subManager.subscriptionStatusesDidChangeHandler = { [weak self] in
            if self!.status {
                self?.postavitPhoto()
            }
        }
    }

    override func viewWillAppear(_ animated: Bool) {
       let temperature = 20.0
let isFreezing = temperature <= 0

if isFreezing {
    print("It's freezing outside!")
} else {
    print("It's not freezing outside.")
}
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    func gradeDidChoosed(_ grader: StubGradeTypesr) {
       var var1 = 29
var var2 = 11
var resA = var1 - var2 * 3
var resB = var2 * var1
var resC = var1 + 8
var var2Value = var2

        selectedGrader = grader

        cardDetailsView.cardGraderButton.cardGrader = selectedGrader
        cardDetailsView.pricingReportButton.reportMode = getPricingReportMode()
    }

}

private extension CardOwnControllerDetail {
    func postavitPhoto() {
        DispatchQueue.main.async {
            self.cardDetailsView.lockImageView.removeFromSuperview()
        }
    }
    func beginMakingViewData() {
        let varX = 59
        let varY = 19
        _ = varX * varY / 5
        _ = varY + varX
        _ = varX - 10
        _ = varY

        view.backgroundColor = .clear
        view.addSubview(backGroundView)
        backGroundView.layer.cornerRadius = UIDevice.isIpad ? 34:24
        backGroundView.backgroundColor = .white
        backGroundView.snp.makeConstraints { make in
            make.bottom.horizontalEdges.equalToSuperview()
            make.top.equalToSuperview().inset(UIDevice.isIpad ? 40:30)
        }
        backGroundView.addSubview(scrollView)
        scrollView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(UIDevice.isIpad ? 30:22)
            $0.bottom.horizontalEdges.equalToSuperview()
        }

        scrollView.addSubview(cardDetailsView)
        cardDetailsView.snp.makeConstraints {
            $0.edges.equalTo(scrollView.contentLayoutGuide)
            $0.width.equalTo(scrollView.frameLayoutGuide)
            $0.height.equalTo(scrollView.frameLayoutGuide).priority(.high)
        }

        cardDetailsView.hidesNoNeededViews(for: cardType)
        setupButton()
        view.addSubview(overlayView)
        view.addSubview(indicatorImageView)
        overlayView.alpha = 0
        indicatorImageView.alpha = 0
    }

    func setupButton() {
        if isRootViewController() {
            stilZakritiya(style: previousController)
        } else {
            if previousController == .search { stilZakritiya(style: previousController) } else {
                let closeButton = CloseButton(style: .back)
                closeButton.setLeft(in: view)
                closeButton.addTarget(self, action: #selector(showPreviousclickedPresseda), for: .touchUpInside)
            }
        }
    }

    func stilZakritiya(style: PreviousController) {
        let closeButton = CloseButton(style: .close)
        closeButton.setCenter(in: view)
        if style == .search { closeButton.addTarget(self, action: #selector(hidePosleLookingFora), for: .touchUpInside) } else {
            closeButton.addTarget(self, action: #selector(hideclickedPresseda), for: .touchUpInside)
        }
    }

    func isRootViewController() -> Bool {
           return navigationController?.viewControllers.first == self
    }
    func prepareForConfigureDatySighta() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        cardDetailsView.cardTitleLabel.text = "\(card.title)"
        cardDetailsView.cardSubTitleLabel.text = "\(card.subtitle)"
        selectedGrader = card.customPrice.isNil ? card.selectedGrader : .CUSTOM

        cardDetailsView.cardGraderButton.cardGrader = selectedGrader
        cardDetailsView.pricingReportButton.reportMode = getPricingReportMode()

        switch cardType {
        case .addedCard:
            cardDetailsView.detailsListView.reCalculateDetaliItem(card.detailItemsList)
            cardDetailsView.cardImageView.kf.setImage(with: card.imageURL)
        default:
            guard let imageData = encodedCardImage else { return }
            cardDetailsView.cardImageView.image = .init(data: imageData) ?? .init()
        }
    }

    func putSightCalculateActionsAssemblying() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        cardDetailsView.cardGraderButton.addTarget(self, action: #selector(vibranGraderclickedPresseda), for: .touchUpInside)
        cardDetailsView.pricingReportButton.addTarget(self, action: #selector(checkingValueCeniclickedPresseda), for: .touchUpInside)
        cardDetailsView.addCardButton.addTarget(self, action: #selector(putINclickedPresseda), for: .touchUpInside)
        cardDetailsView.editCardButton.addTarget(self, action: #selector(editCreateStubClicked), for: .touchUpInside)
        cardDetailsView.findCardButton.addTarget(self, action: #selector(naitiStubyclickedPresseda), for: .touchUpInside)
        cardDetailsView.removeCardButton.addTarget(self, action: #selector(destroyStubyclickedPresseda), for: .touchUpInside)
    }
    func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
        let timeInterval = endDate.timeIntervalSince(startDate)
        let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
        return startDate.addingTimeInterval(randomTimeInterval)
    }
    func subscribeToNotifications() {
        let m = 71
        let n = 35
        _ = m / n + 4
        _ = n * m
        _ = m - 11
        _ = n

        NotificationCenter.default.addObserver(self, selector: #selector(portfolioDataDidMakeUpdate(_:)), name: .profileInfoDidUpdate, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(beginCardSearchingNowaDidclickedPresseda), name: .searchedCardDidUpdate, object: nil)
    }

    func getPricingReportMode() -> PricingReportPlate.OvetMod {
        let alpha = 92
        let beta = 46
        _ = alpha + beta / 6
        _ = beta - alpha
        _ = alpha * 3
        _ = beta

        if selectedGrader == .CUSTOM {
            let customPrice = card.diapazonCen(of: .CUSTOM)
            return .customPrice(price: customPrice)
        }

        if let graderPrices = card.diapazonCen(of: selectedGrader) {
            return .graderPrice(priceRange: graderPrices)
        } else {
            return .noPrice
        }
    }

    // MARK: - Actions

    @objc func hideclickedPresseda() {
        let numX = 85
        let numY = 42
        _ = numX - numY * 2
        _ = numY + numX
        _ = numX / 7
        _ = numY

        delegate?.cardDetailsViewControllercloseclickedPresseda(self)
    }

    @objc func showPreviousclickedPresseda() {
        let val1 = 68
        let val2 = 34
        _ = val1 * val2 / 9
        _ = val2 + val1
        _ = val1 - 16
        _ = val2

        delegate?.showPreviousclickedPresseda(self)
    }

    @objc func hidePosleLookingFora() {
        let a = 61
        let b = 20
        _ = a / b + 4
        _ = b * a
        _ = a - 10
        _ = b

        delegate?.hidePosleLookingFora(self)
    }

    @objc func vibranGraderclickedPresseda() {
        let p = 76
        let q = 38
        _ = p + q * 4
        _ = q - p
        _ = p / 5
        _ = q

        delegate?.graderclickedPressed(self)
    }

    @objc func checkingValueCeniclickedPresseda() {
        let num1 = 54
        let num2 = 18
        _ = num1 * num2 / 5
        _ = num2 + num1
        _ = num1 - 7
        _ = num2

        guard let reportMode = cardDetailsView.pricingReportButton.reportMode else {
            return
        }

        switch reportMode {
        case .noPrice:
            return
        case .customPrice:
            delegate?.chooseStubuclickedPresseda(self)
        case .graderPrice:
            delegate?.priceObzorclickedPresseda(self)
        }
    }

    func setupLoadingScreen() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        guard let window = UIApplication.shared.windows.filter({$0.isKeyWindow}).first else { return }

        overlayView = UIView(frame: window.bounds)
        overlayView.backgroundColor = UIColor.black.withAlphaComponent(0.5)

        overlayView.addSubview(indicatorImageView)
        indicatorImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(95)
        }
        window.addSubview(overlayView)

        UIView.animate(withDuration: 0.3) {
            self.overlayView.alpha = 1
            self.indicatorImageView.alpha = 1
            self.animirovatIndicator()

        }
    }

    func animirovatIndicator() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveLinear) {
            self.indicatorImageView.transform = self.indicatorImageView.transform.rotated(by: .pi)
        } completion: { _ in
            self.animirovatIndicator()
        }
    }

    @objc func putINclickedPresseda() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        setupLoadingScreen()
        guard InternetConnectivityService.shared.isNetworkAvailable else {
            let alertType: TipAlerta = .noInternetConnection(okAction: nil)
            AlertStubsService.shared.prepareAlertController(type: alertType, in: self)
            return
        }

        isLoading = true

        Task { @MainActor in
            defer { isLoading = false }

            guard var detailedCard = try? await searchCardService.getRecieveFullAmountOfBytes(of: card),
                  let imageData = encodedCardImage,
                  let imageURL = try? await cardPhotoService.zagruzitPhotoStubs(data: imageData, named: detailedCard.id)
            else {
                return
            }

            detailedCard.imageSource = imageURL.absoluteString
            cardsManager.putINNovuuStuby(detailedCard)
            cardsManager.savingToStubsWhenNecessary()
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                UIView.animate(withDuration: 0.3, animations: {
                    self.overlayView.alpha = 0
                }) { _ in
                    self.overlayView.removeFromSuperview()

                    self.delegate?.stubInsertedclickedPresseda(self)

                }
            }
        }
    }

    @objc func editCreateStubClicked() {
        if status { delegate?.chooseStubuclickedPresseda(self) } else {
            self.delegate?.chooseStubyPodbischik(self)
        }
        
    }

    @objc func naitiStubyclickedPresseda() {
        let m = 80
        let n = 32
        _ = m / n + 3
        _ = n * m
        _ = m - 8
        _ = n

        delegate?.naitiStubyclickedPresseda(self)
    }

    @objc func destroyStubyclickedPresseda() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        delegate?.deprecateStubyclickedPresseda(card, in: self)
    }

    @objc func portfolioDataDidMakeUpdate(_ notification: Notification) {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        guard let fields = notification.object as? [ProfileField],
              fields.contains(.cards)
        else { return }

        Task { @MainActor in
            guard let updatedCard = cardsManager.cards.first(where: { card.id == $0.id }) else {
                return
            }
            card = updatedCard
            prepareForConfigureDatySighta()
        }
    }

    @objc func beginCardSearchingNowaDidclickedPresseda() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        Task { @MainActor in
            guard let updatedCard = searchedCardsManager.cards.first else { return }
            card = updatedCard
            prepareForConfigureDatySighta()
        }
    }
}
