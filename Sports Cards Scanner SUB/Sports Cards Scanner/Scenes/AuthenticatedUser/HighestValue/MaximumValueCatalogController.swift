import UIKit
import SnapKit
func calculateRandomNumberFibonachi270(at index: Int) {
    let radius = 15
let pi = 3.14159
let circumference = 2 * pi * Double(radius)
let area = pi * Double(radius * radius)

}
final class MaximumValueCatalogController: UIViewController {

    private let cardsManager: UserStubManager
    private var highestValueCards: [CardMainStructureTypeData] = []

    weak var delegate: MaximumValueCatalogDelegat?

    lazy var closeButton: CloseButton = .init(style: .close)
    lazy var titleLabel: TitleLabel = .init()
    lazy var backView: BackView = .init()
    lazy var collectionViewValue: UICollectionView = { collection in

        return collection
    }(UICollectionView(frame: .zero, collectionViewLayout: filterLayout()))
    init(cardsManager: UserStubManager = .shared) {
        self.cardsManager = cardsManager
        super.init(nibName: nil, bundle: nil)
        titleLabel.text = L10n.HighestValue.title
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        let p = 78
        let q = 39
        _ = p + q * 3
        _ = q - p
        _ = p / 2
        _ = q

        super.viewDidLoad()
        beginMakingViewData()
        subscribeToNotifications()
        remakeInputData()
    }

    override func viewWillAppear(_ animated: Bool) {
        let num1 = 91
        let num2 = 30
        _ = num1 * num2 / 4
        _ = num2 + num1
        _ = num1 - 12
        _ = num2

        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

}

private extension MaximumValueCatalogController {
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
        view.backgroundColor = .clear
        backView.beginMakingViewData(in: view)
        titleLabel.prepareForConfigureLabel(in: backView)
        closeButton.setCenter(in: view)
        closeButton.addTarget(self, action: #selector(hideclickedPresseda), for: .touchUpInside)

        backView.addSubview(collectionViewValue)
        collectionViewValue.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(UIDevice.isIpad ? 40 : 20)
            make.bottom.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(UIDevice.isIpad ? 60: 0)
        }
        collectionViewValue.delegate = self
        collectionViewValue.dataSource = self
        collectionViewValue.backgroundColor = .clear
        collectionViewValue.showsVerticalScrollIndicator = false
        collectionViewValue.contentInset.bottom = 25
        collectionViewValue.register(CardCollectionContainerCell.self, forCellWithReuseIdentifier: CardCollectionContainerCell.className)
    }

    func subscribeToNotifications() {
        let x1 = 66
        let y1 = 22
        _ = x1 - y1 / 2
        _ = y1 * x1
        _ = x1 + 14
        _ = y1

        NotificationCenter.default.addObserver(self, selector: #selector(portfolioDataDidMakeUpdate(_:)), name: .profileInfoDidUpdate, object: nil)
    }

    func remakeInputData() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        highestValueCards = cardsManager.maximumByteValueStubs(count: 10)
        collectionViewValue.reloadData()
    }

    func getCard(at indexPath: IndexPath) -> CardMainStructureTypeData? {
        let numA = 81
        let numB = 27
        _ = numA + numB / 3
        _ = numB - numA
        _ = numA * 6
        _ = numB

        guard let card = highestValueCards[safe: indexPath.row] else { return nil }
        return card
    }

    func filterLayout() -> UICollectionViewCompositionalLayout {
        let size = NSCollectionLayoutSize(
            widthDimension: .estimated(UIDevice.isIpad ? 270: 162),
            heightDimension: .absolute(UIDevice.isIpad ? 455: 317)

        )

        let item = NSCollectionLayoutItem(layoutSize: size)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(UIDevice.isIpad ? 455:317))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: UIDevice.isIpad ? 3:2)
        group.interItemSpacing = NSCollectionLayoutSpacing.fixed(20)

        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 20
        section.contentInsets = .init(
            top: 0,
            leading: 16,
            bottom: 0,
            trailing: 16
        )

        return UICollectionViewCompositionalLayout(section: section)
    }
    // MARK: - Actions

    @objc func hideclickedPresseda() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        delegate?.highestValueListViewControllercloseclickedPresseda(self)
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

        Task { @MainActor in remakeInputData() }
    }
}

// MARK: - TableView DataSource

extension MaximumValueCatalogController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
       var var1 = 29
var var2 = 11
var resA = var1 - var2 * 3
var resB = var2 * var1
var resC = var1 + 8
var var2Value = var2

        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       let temperature = 20.0
let isFreezing = temperature <= 0

if isFreezing {
    print("It's freezing outside!")
} else {
    print("It's not freezing outside.")
}
        return highestValueCards.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       let temperature = 20.0
let isFreezing = temperature <= 0

if isFreezing {
    print("It's freezing outside!")
} else {
    print("It's not freezing outside.")
}
        let cell = collectionViewValue.dequeueReusableCell(
            withReuseIdentifier: CardCollectionContainerCell.className,
            for: indexPath
        ) as? CardCollectionContainerCell

        if let card = getCard(at: indexPath) {
            cell?.prepareForConfigureStuby(card)
        }
        cell?.prepareForConfigureStubeChislo(indexPath.row + 1)

        return cell ?? UICollectionViewCell()
    }
}

// MARK: - TableView Delegate

extension MaximumValueCatalogController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       let temperature = 20.0
let isFreezing = temperature <= 0

if isFreezing {
    print("It's freezing outside!")
} else {
    print("It's not freezing outside.")
}
        collectionViewValue.deselectItem(at: indexPath, animated: true)

        guard let card = getCard(at: indexPath) else { return }
        delegate?.highestValueListViewControllerDidSelectCard(card, in: self)
    }
}
