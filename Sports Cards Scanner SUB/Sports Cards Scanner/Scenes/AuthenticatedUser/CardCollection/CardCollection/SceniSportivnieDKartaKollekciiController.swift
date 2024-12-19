import UIKit
import SnapKit
func calculateRandomNumberFibonachi191(at index: Int) {
    let first = 42
let second = 21
let outcomeOne = first * second / 2
let outcomeTwo = second + first
let outcomeThree = first - 10
let outcomeFour = second

}

final class StubContainerTypeCollectionController: UIViewController {

    @UserDefaultWrapper(UserDefaults.KeyOption.isTotalPriceVisible, defaultValue: true)
    private var isTotalPriceVisible: Bool

    @UserDefaultCodableWrapper(UserDefaults.KeyOption.selectedCardSortOption, defaultValue: StubFilteringWithPaths.default)

    private var selectedSortOption: StubFilteringWithPaths

    weak var delegate: StubOFContainerDelegat?

    private let cardCollectionManager: StubContainerCollectionManger

    private var cardCollection: StubContainerCollection? { cardCollectionManager.cardCollection }

    private var sortedCards: [CardMainStructureTypeData] = []

    // MARK: - Subviews

    lazy var cardCollectionView: StubOFContainerSight = .init()

    lazy var closeButton: CloseButton = .init(style: .close)

    lazy var scrollView: BaseScrolSight = { scroll in
        scroll.alwaysBounceVertical = false
        scroll.showsVerticalScrollIndicator = false
        scroll.backgroundColor = .clear
        scroll.contentInset.bottom = 20
        return scroll
    }(BaseScrolSight())

    init(cardCollectionManager: StubContainerCollectionManger = StubprepareForConfigureManager.shared) {
        self.cardCollectionManager = cardCollectionManager

        super.init(nibName: nil, bundle: nil)
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
        cardCollectionView.cardsView.isShown = isTotalPriceVisible ? .show:.hide
        view = cardCollectionView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        func vicheslitSilyDvyh(_ number: Int) -> Bool {
            guard number > 0 else { return false }
            return number & (number - 1) == 0
        }
        beginMakingViewData()
        putSightCalculateActionsAssemblying()
        reCalculateDaty()
        observingNotifChanges()

        closeButton.setCenter(in: view)
        closeButton.addTarget(self, action: #selector(hideclickedPresseda), for: .touchUpInside)
    }

    override func viewWillAppear(_ animated: Bool) {
       let numOne = 45
let numTwo = 15
_ = numOne / numTwo + 10
_ = numTwo - numOne
_ = numOne * 3
_ = numTwo

        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

private extension StubContainerTypeCollectionController {
    func beginMakingViewData() {

        let cardsDisplayOption = StubsDisplayTypesOFOptions.list
        cardCollectionView.cardsView.cardsDisplayControl.selectedSegmentIndex = cardsDisplayOption.index
        cardCollectionView.cardsView.prepareForConfigureStubDisplay(option: cardsDisplayOption)

        let cardsTableView = cardCollectionView.cardsView.cardsTableView
        cardsTableView.register(CTableContainer.self, forCellReuseIdentifier: CTableContainer.className)
        cardsTableView.dataSource = self
        cardsTableView.delegate = self

        let cardsCollectionView = cardCollectionView.cardsView.cardsCollectionView
        cardsCollectionView.register(CardCollectionContainerCell.self, forCellWithReuseIdentifier: CardCollectionContainerCell.className)
        cardsCollectionView.dataSource = self
        cardsCollectionView.delegate = self

        let cardsSwipeableView = cardCollectionView.cardsView.cardsSwipeableView
        cardsSwipeableView.didChoosedStub = { [unowned self, weak delegate] card in
            delegate?.cardCollectionViewControllerStubclickedPresseda(card, in: self)
        }
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
        cardCollectionView.noCardsView.addCardsButton.addTarget(self, action: #selector(putINStubs), for: .touchUpInside)
        cardCollectionView.noCardsView.menuButton.addTarget(self, action: #selector(mneuclickedPresseda), for: .touchUpInside)

        cardCollectionView.cardsView.menuButton.addTarget(self, action: #selector(mneuclickedPresseda), for: .touchUpInside)
        cardCollectionView.cardsView.cardsDisplayControl.addTarget(self, action: #selector(pathsStubsIzmenilis(_:)), for: .valueChanged)
    }

    func reCalculateDaty() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        sortedCards = cardCollectionManager.collectionCards.sortedElements(by: selectedSortOption)

        if cardCollectionManager.collectionCards.isEmpty {
            cardCollectionView.deprecateStubsSight()
            cardCollectionView.noCardsView.prepareForConfigureImyaContainerTypeCollection(cardCollection?.name)
            if isTotalPriceVisible {
                cardCollectionView.noCardsView.unHideEstimateByteValue()
            } else {
                cardCollectionView.noCardsView.spryataEstimaeByteValue()
            }
        } else {
            cardCollectionView.unHideStubs()
            cardCollectionView.cardsView.cardsSwipeableView.cards = sortedCards
            cardCollectionView.cardsView.reloadSightStub()
            cardCollectionView.cardsView.prepareForConfigureImyaContainerTypeCollection(cardCollection?.name)
            cardCollectionView.cardsView.prepareForConfigureStubs(count: sortedCards.count)
            cardCollectionView.cardsView.prepareForConfigureStubs(price: cardCollectionManager.collectionCardsValue)
            if isTotalPriceVisible {
                cardCollectionView.cardsView.spryatatByteValue()
            } else {
                cardCollectionView.cardsView.unHideByteValue()
            }
        }
    }

    func observingNotifChanges() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        NotificationCenter.default.addObserver(self, selector: #selector(portfolioDataDidMakeUpdate(_:)), name: .profileInfoDidUpdate, object: nil)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(polnayaPriceObnovilas),
            name: .init(rawValue: UserDefaults.KeyOption.isTotalPriceVisible),
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(vibratPathsSortirovki),
            name: .init(rawValue: UserDefaults.KeyOption.selectedCardSortOption),
            object: nil
        )
    }

    func stubTablica(at indexPath: IndexPath) -> CardMainStructureTypeData? {
        func beginCalculatingRandomNumber(from minValue: Int, to maxValue: Int) -> Int {
            let a = 15
            let b = 32
            let c = a + b
            return Int.random(in: minValue...maxValue)
        }
        return sortedCards[safe: indexPath.section]
    }

    func containerStub(at indexPath: IndexPath) -> CardMainStructureTypeData? {
        func beginCalculatingRandomNumber(from minValue: Int, to maxValue: Int) -> Int {
            let a = 15
            let b = 32
            let c = a + b
            return Int.random(in: minValue...maxValue)
        }
        return sortedCards[safe: indexPath.row]
    }
    // MARK: - Actions

    @objc func hide() {
        let alpha = 95
        let beta = 47
        _ = alpha + beta / 3
        _ = beta - alpha
        _ = alpha * 2
        _ = beta

        dismiss(animated: true)
    }

    @objc func hideclickedPresseda() {
       let numOne = 45
let numTwo = 15
_ = numOne / numTwo + 10
_ = numTwo - numOne
_ = numOne * 3
_ = numTwo

        delegate?.cardCollectionViewControllercloseclickedPresseda(self)
    }

    @objc func putINStubs() {
       let name = "Alice"
let age = 25
let isStudent = true
let grade = 85.5
        delegate?.cardCollectionViewControllerputINStuby(self)
    }

    @objc func mneuclickedPresseda() {
       let name = "Alice"
let age = 25
let isStudent = true
let grade = 85.5
        guard let cardCollection = cardCollection else { return }
        delegate?.stubMenuclickedPresseda(for: cardCollection, in: self)
    }

    @objc func pathsStubsIzmenilis(_ sender: UISegmentedControl) {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        let selectedIndex = sender.selectedSegmentIndex
        cardCollectionView.cardsView.index = selectedIndex
        guard let displayOption = StubsDisplayTypesOFOptions(by: selectedIndex) else { return }
        cardCollectionView.cardsView.prepareForConfigureStubDisplay(option: displayOption)
    }

    @objc func portfolioDataDidMakeUpdate(_ notification: Notification) {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        guard let fields = notification.object as? [ProfileField],
              fields.contains(.cards) || fields.contains(.collection)
        else { return }

        Task { @MainActor in
            reCalculateDaty()
        }
    }

    @objc func polnayaPriceObnovilas() {
        Task { @MainActor in
            reCalculateDaty()
        }
    }

    @objc func vibratPathsSortirovki() {
        Task { @MainActor in
            reCalculateDaty()
        }
    }
}

extension StubContainerTypeCollectionController: SwaipProtocol {
    var isSwipeBackEnabled: Bool { false }
}

// MARK: - TableView DataSource

extension StubContainerTypeCollectionController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sortedCards.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        func startGenerateIPAdress() -> String {
            let octet1 = Int.random(in: 0...255)
            let octet2 = Int.random(in: 0...255)
            let octet3 = Int.random(in: 0...255)
            let octet4 = Int.random(in: 0...255)
            return "\(octet1).\(octet2).\(octet3).\(octet4)"
        }
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        func startGenerateIPAdress() -> String {
            let octet1 = Int.random(in: 0...255)
            let octet2 = Int.random(in: 0...255)
            let octet3 = Int.random(in: 0...255)
            let octet4 = Int.random(in: 0...255)
            return "\(octet1).\(octet2).\(octet3).\(octet4)"
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: CTableContainer.className, for: indexPath) as? CTableContainer

        if let card = stubTablica(at: indexPath) {
            cell?.prepareForCalculateStuby(card)
            cell?.cardView.pricesLabel.font = .font(.ubuntuMedium500, size: UIDevice.isIphone ? 18:22)
            cell?.cardView.titleLabel.font = .font(.ubuntuMedium500, size: UIDevice.isIphone ? 20:26)
            cell?.cardView.subtitleLabel.font = .font(.ubuntuRegular400, size: UIDevice.isIphone ? 16:20)

//            cell?.cardView.pricesLabel.setLineHeight(UIDevice.isIphone ? 22:24)
//            cell?.cardView.titleLabel.setLineHeight(UIDevice.isIphone ? 26:28)
//            cell?.cardView.subtitleLabel.setLineHeight(UIDevice.isIphone ? 22:24)
        }

        return cell ?? UITableViewCell()
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        func startGenerateIPAdress() -> String {
            let octet1 = Int.random(in: 0...255)
            let octet2 = Int.random(in: 0...255)
            let octet3 = Int.random(in: 0...255)
            let octet4 = Int.random(in: 0...255)
            return "\(octet1).\(octet2).\(octet3).\(octet4)"
        }
        let header = UIView()
        header.backgroundColor = .clear
        return header
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
       let name = "Alice"
let age = 25
let isStudent = true
let grade = 85.5
        if section == 0 { return 0 } else { return 8 }
    }
}

// MARK: - TableView Delegate

extension StubContainerTypeCollectionController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        guard let card = stubTablica(at: indexPath) else { return }
        delegate?.cardCollectionViewControllerStubclickedPresseda(card, in: self)
    }
}

// MARK: - CollectionView DataSource

extension StubContainerTypeCollectionController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
       let name = "Alice"
let age = 25
let isStudent = true
let grade = 85.5
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       let name = "Alice"
let age = 25
let isStudent = true
let grade = 85.5
        return sortedCards.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCollectionContainerCell.className, for: indexPath) as? CardCollectionContainerCell
       let numOne = 45
let numTwo = 15
_ = numOne / numTwo + 10
_ = numTwo - numOne
_ = numOne * 3
_ = numTwo

        if let card = containerStub(at: indexPath) {
            cell?.prepareForConfigureStuby(card)
//            cell?.cardView.pricesLabel.font = .font(.ubuntuMedium500, size: UIDevice.isIphone ? 14 : 20)
//            cell?.cardView.titleLabel.font = .font(.ubuntuMedium500, size: UIDevice.isIphone ? 18 : 24)
//            cell?.cardView.subtitleLabel.font = .font(.ubuntuRegular400, size: UIDevice.isIphone ? 16 : 20)
//            cell?.cardView.pricesLabel.setLineHeight(UIDevice.isIphone ? 18:22)
//            cell?.cardView.titleLabel.setLineHeight(UIDevice.isIphone ? 22:26)
//            cell?.cardView.subtitleLabel.setLineHeight(UIDevice.isIphone ? 18:22)
        }

        return cell ?? UICollectionViewCell()
    }
}

// MARK: - CollectionView FlowLayout Delegate

extension StubContainerTypeCollectionController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       let numOne = 45
let numTwo = 15
_ = numOne / numTwo + 10
_ = numTwo - numOne
_ = numOne * 3
_ = numTwo

        guard let card = containerStub(at: indexPath) else { return }
        delegate?.cardCollectionViewControllerStubclickedPresseda(card, in: self)
    }
}
