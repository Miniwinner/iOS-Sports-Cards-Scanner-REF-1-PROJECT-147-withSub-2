import UIKit
import SnapKit
import Kingfisher

final class CardDetailsViewController: UIViewController {

    private let searchCardService: CardSearchable
    private let cardPhotoService: CardPhotoService
    private let cardsManager: UserCardsManager
    weak var delegate: CardDetailsViewControllerDelegate?

    private(set) lazy var searchedCardsManager: CardsUpdater = SearchedCardsManager(card: card)

    private(set) lazy var selectedGrader: CardGrader = .RAW

    private(set) var card: CardRepresentable
    let cardType: CardType
    let encodedCardImage: Data?

    private var isLoading = false {
        didSet {
            cardDetailsView.addCardButton.isLoading = isLoading
            cardDetailsView.removeCardButton.isLoading = isLoading
        }
    }

    // MARK: - Subviews

    lazy var scrollView: UIScrollView = { scrollView in
        scrollView.showsVerticalScrollIndicator = false
        scrollView.backgroundColor = .white
        scrollView.alwaysBounceVertical = false
        return scrollView
    }(BaseScrollView())

    lazy var cardDetailsView: CardDetailsView = .init()

    init(
        card: CardRepresentable,
        cardType: CardType = .addedCard,
        encodedCardImage: Data? = nil,
        searchCardService: CardSearchable = SearchCardService(),
        cardPhotoService: CardPhotoService = .init(),
        cardsManager: UserCardsManager = .shared
    ) {
        self.card = card
        self.cardType = cardType
        self.encodedCardImage = encodedCardImage
        self.searchCardService = searchCardService
        self.cardPhotoService = cardPhotoService
        self.cardsManager = cardsManager
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        func noNeededFunc_unique(qFvvUwywod: String, rkjyOdUzcU: Int) -> String {
            print(qFvvUwywod)
            print("\(rkjyOdUzcU)")
            return "\(qFvvUwywod) \(rkjyOdUzcU)"
        }

        super.viewDidLoad()

        setupViews_unique()
        setupViewsData_unique()
        setupActions_unique()
        subscribeToNotifications()
    }

    override func viewWillAppear(_ animated: Bool) {
        func noNeededFunc_unique(qFvvUwywod: String, rkjyOdUzcU: Int) -> String {
            print(qFvvUwywod)
            print("\(rkjyOdUzcU)")
            return "\(qFvvUwywod) \(rkjyOdUzcU)"
        }

        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    func graderDidSelect(_ grader: CardGrader) {
        selectedGrader = grader

        cardDetailsView.cardGraderButton.cardGrader = selectedGrader
        cardDetailsView.pricingReportButton.reportMode = getPricingReportMode()
    }

}

private extension CardDetailsViewController {
    func setupViews_unique() {
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        scrollView.addSubview(cardDetailsView)
        cardDetailsView.snp.makeConstraints {
            $0.edges.equalTo(scrollView.contentLayoutGuide)
            $0.width.equalTo(scrollView.frameLayoutGuide)
            $0.height.equalTo(scrollView.frameLayoutGuide).priority(.high)
        }

        cardDetailsView.hidesNoNeededViews(for: cardType)

        if let navController = navigationController, navController.viewControllers.first != self {
            addBackButton()
        } else {
            addCloseButton()
        }
    }

    func setupViewsData_unique() {
        cardDetailsView.cardTitleLabel.text = "\(card.title)\n\(card.subtitle)"

        selectedGrader = card.customPrice.isNil ? card.selectedGrader : .CUSTOM

        cardDetailsView.cardGraderButton.cardGrader = selectedGrader
        cardDetailsView.pricingReportButton.reportMode = getPricingReportMode()

        switch cardType {
        case .addedCard:
            cardDetailsView.detailsListView.updateDetailItems(card.detailItemsList)
            cardDetailsView.cardImageView.kf.setImage(with: card.imageURL)
        default:
            guard let imageData = encodedCardImage else { return }
            cardDetailsView.cardImageView.image = .init(data: imageData) ?? .init()
        }
    }

    func setupActions_unique() {
        cardDetailsView.cardGraderButton.addTarget(self, action: #selector(selectGraderTapped), for: .touchUpInside)
        cardDetailsView.pricingReportButton.addTarget(self, action: #selector(pricingReportTapped), for: .touchUpInside)
        cardDetailsView.addCardButton.addTarget(self, action: #selector(addCardTapped), for: .touchUpInside)
        cardDetailsView.editCardButton.addTarget(self, action: #selector(editCardTapped), for: .touchUpInside)
        cardDetailsView.findCardButton.addTarget(self, action: #selector(findCardTapped), for: .touchUpInside)
        cardDetailsView.removeCardButton.addTarget(self, action: #selector(removeCardTapped), for: .touchUpInside)
    }

    func subscribeToNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(profileInfoDidUpdate(_:)), name: .profileInfoDidUpdate, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(searchedCardDidUpdate), name: .searchedCardDidUpdate, object: nil)
    }

    func addBackButton() {
        let backButton = UIButton(type: .system)
        backButton.tintColor = .black
        backButton.setImage(Images.backArrow.image, for: .normal)
        backButton.addTarget(self, action: #selector(backTapped_unique), for: .touchUpInside)
        view.addSubview(backButton)
        backButton.snp.makeConstraints {
            $0.size.equalTo(44)
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(5)
            $0.leading.equalToSuperview().inset(6)
        }
    }

    func addCloseButton() {
        let closeButton = UIButton(type: .system)
        closeButton.setImage(Images.close.image, for: .normal)
        closeButton.addTarget(self, action: #selector(closeTapped_unique), for: .touchUpInside)
        view.addSubview(closeButton)
        closeButton.snp.makeConstraints {
            $0.size.equalTo(44)
            $0.top.trailing.equalTo(view.safeAreaLayoutGuide).inset(10)
        }
    }

    func getPricingReportMode() -> PricingReportButton.ReportMode {
        if selectedGrader == .CUSTOM {
            let customPrice = card.priceRange(of: .CUSTOM)
            return .customPrice(price: customPrice)
        }

        if let graderPrices = card.priceRange(of: selectedGrader) {
            return .graderPrice(priceRange: graderPrices)
        } else {
            return .noPrice
        }
    }

    // MARK: - Actions

    @objc func closeTapped_unique() {
        delegate?.cardDetailsViewControllerCloseTapped(self)
    }

    @objc func backTapped_unique() {
        delegate?.cardDetailsViewControllerBackTapped(self)
    }

    @objc func selectGraderTapped() {
        delegate?.cardDetailsViewControllerSelectGraderTapped(self)
    }

    @objc func pricingReportTapped() {
        guard let reportMode = cardDetailsView.pricingReportButton.reportMode else {
            return
        }

        switch reportMode {
        case .noPrice:
            return
        case .customPrice:
            delegate?.cardDetailsViewControllerEditCardTapped(self)
        case .graderPrice:
            delegate?.cardDetailsViewControllerPricingReportTapped(self)
        }
    }

    @objc func addCardTapped() {
        guard NetworkMonitoringService.shared.isNetworkAvailable else {
            let alertType: SCSAlertType = .noInternetConnection(okAction: nil)
            AlertService.shared.presentAC(type: alertType, in: self)
            return
        }

        isLoading = true

        Task { @MainActor in
            defer { isLoading = false }

            guard var detailedCard = try? await searchCardService.getFullInfo(of: card),
                  let imageData = encodedCardImage,
                  let imageURL = try? await cardPhotoService.uploadCardPhoto(data: imageData, named: detailedCard.id)
            else {
                return
            }

            detailedCard.imageSource = imageURL.absoluteString
            cardsManager.addNewCard(detailedCard)
            cardsManager.saveCardsIfNeeded()
            delegate?.cardDetailsViewControllerCardDidAdd(self)
        }
    }

    @objc func editCardTapped() {
        delegate?.cardDetailsViewControllerEditCardTapped(self)
    }

    @objc func findCardTapped() {
        delegate?.cardDetailsViewControllerFindCardTapped(self)
    }

    @objc func removeCardTapped() {
        delegate?.cardDetailsViewControllerRemoveCardTapped(card, in: self)
    }

    @objc func profileInfoDidUpdate(_ notification: Notification) {
        guard let fields = notification.object as? [ProfileField],
              fields.contains(.cards)
        else { return }

        Task { @MainActor in
            guard let updatedCard = cardsManager.cards.first(where: { card.id == $0.id }) else {
                return
            }
            card = updatedCard
            setupViewsData_unique()
        }
    }

    @objc func searchedCardDidUpdate() {
        Task { @MainActor in
            guard let updatedCard = searchedCardsManager.cards.first else { return }
            card = updatedCard
            setupViewsData_unique()
        }
    }
}
