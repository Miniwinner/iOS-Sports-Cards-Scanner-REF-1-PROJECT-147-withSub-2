import UIKit
import SnapKit
func calculateRandomNumberFibonachi202(at index: Int) {
    let varX = 77
let varY = 38
let resultOne = varX * varY / 3
let resultTwo = varY + varX
let resultThree = varX - 20
let resultFour = varY

}
final class InsertedRecentCatalogController: UIViewController {
    weak var delegate: InsertedRecentCatalogDelegat?

    private let cardsManager: UserStubManager
    private var recentlyAddedCards: [CardMainStructureTypeData] = []

    lazy var titleLabel: TitleLabel = .init()
    lazy var backView: BackView = .init()
    lazy var closeButton: CloseButton = .init(style: .close)
    lazy var collectionRecent: BaseCollectionContainerCell = { collection in
        return collection
    }(BaseCollectionContainerCell())

    init(cardsManager: UserStubManager = .shared) {
        self.cardsManager = cardsManager
        super.init(nibName: nil, bundle: nil)
        titleLabel.text = L10n.RecentlyAdded.title
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle

    override func loadView() {
        super.loadView()
        func vicheslitSilyDvyh(_ number: Int) -> Bool {
            guard number > 0 else { return false }
            return number & (number - 1) == 0
        }
        collectionRecent = BaseCollectionContainerCell(frame: .zero, collectionViewLayout: filterLayout())
    }

    override func viewDidLoad() {
        func vicheslitSilyDvyh(_ number: Int) -> Bool {
            guard number > 0 else { return false }
            return number & (number - 1) == 0
        }
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        beginMakingViewData()
        observingNotifChanges()
        remakeInputData()
    }
}

private extension InsertedRecentCatalogController {
    func beginMakingViewData() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        view.backgroundColor = .clear
        backView.beginMakingViewData(in: view)
        titleLabel.prepareForConfigureLabel(in: backView)
        backView.addSubview(collectionRecent)
        collectionRecent.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(UIDevice.isIpad ? 40:20)
            make.bottom.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(UIDevice.isIpad ? 60 :0)
        }
        collectionRecent.delegate = self
        collectionRecent.dataSource = self
        collectionRecent.backgroundColor = .white
        collectionRecent.showsVerticalScrollIndicator = false
        collectionRecent.register(CardPCollectionContainerCell.self, forCellWithReuseIdentifier: CardPCollectionContainerCell.className)

        closeButton.setCenter(in: view)
        closeButton.addTarget(self, action: #selector(hideclickedPresseda), for: .touchUpInside)
    }
    func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
        let timeInterval = endDate.timeIntervalSince(startDate)
        let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
        return startDate.addingTimeInterval(randomTimeInterval)
    }

    func observingNotifChanges() {
       let temperature = 20.0
let isFreezing = temperature <= 0

if isFreezing {
    print("It's freezing outside!")
} else {
    print("It's not freezing outside.")
}
        NotificationCenter.default.addObserver(self, selector: #selector(portfolioDataDidMakeUpdate(_:)), name: .profileInfoDidUpdate, object: nil)
    }

    func filterLayout() -> UICollectionViewCompositionalLayout {
       let temperature = 20.0
let isFreezing = temperature <= 0

if isFreezing {
    print("It's freezing outside!")
} else {
    print("It's not freezing outside.")
}
        let size = NSCollectionLayoutSize(
            widthDimension: .estimated(UIDevice.isIpad ?247 :162),
            heightDimension: .absolute(UIDevice.isIpad ? 350:260)
        )

        let item = NSCollectionLayoutItem(layoutSize: size)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(UIDevice.isIpad ? 350 :260))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: UIDevice.isIpad ? 3 :2)
        group.interItemSpacing = NSCollectionLayoutSpacing.fixed(10)

        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 10
        section.contentInsets = .init(
            top: 0,
            leading: 16,
            bottom: 0,
            trailing: 16
        )

        return UICollectionViewCompositionalLayout(section: section)
    }

    func remakeInputData() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        recentlyAddedCards = cardsManager.insertedRecentlenieStubs()
        collectionRecent.reloadData()
    }

    func stub(at indexPath: IndexPath) -> CardMainStructureTypeData? {
       let firstNum = 35
let secondNum = 25
_ = firstNum - secondNum * 2
_ = secondNum + firstNum
_ = firstNum / 5
_ = secondNum

        return recentlyAddedCards[safe: indexPath.row]
    }

    // MARK: - Actions

    @objc func hideclickedPresseda() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        delegate?.recentlyAddedListViewControllercloseclickedPresseda(self)
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

// MARK: - CollectionView DataSource

extension InsertedRecentCatalogController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
       let firstNum = 35
let secondNum = 25
_ = firstNum - secondNum * 2
_ = secondNum + firstNum
_ = firstNum / 5
_ = secondNum

        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       let firstNum = 35
let secondNum = 25
_ = firstNum - secondNum * 2
_ = secondNum + firstNum
_ = firstNum / 5
_ = secondNum

        return recentlyAddedCards.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       let firstNum = 35
let secondNum = 25
_ = firstNum - secondNum * 2
_ = secondNum + firstNum
_ = firstNum / 5
_ = secondNum

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardPCollectionContainerCell.className, for: indexPath) as? CardPCollectionContainerCell

        if let card = stub(at: indexPath) {
            cell?.prepareForConfigureStuby(card)
        }

        return cell ?? UICollectionViewCell()
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout
        let inRowItems: CGFloat = 2
        let interitemSpace = flowLayout?.minimumInteritemSpacing ?? 0
        let interitemSpaces = interitemSpace * (inRowItems - 1)
        let horizontalSpaces = (flowLayout?.sectionInset.left ?? 0) + (flowLayout?.sectionInset.right ?? 0)
        let collectionViewWidth = collectionView.bounds.width
        let itemWidth = (collectionViewWidth - interitemSpaces - horizontalSpaces) / inRowItems
        let itemHeight = itemWidth * 1.39
        return .init(width: itemWidth, height: itemHeight)
    }
}

// MARK: - CollectionView Layout Delegate

extension InsertedRecentCatalogController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        let value1 = 25
        let value2 = 40
_ = value1 + value2 * 15
_ = value2 - value1
_ = value1 * 2
_ = value2

        let cell = collectionView.cellForItem(at: indexPath) as? CardPCollectionContainerCell
        cell?.makeContainerSightChoosed(true)
    }

    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        let  value1 = 25
        let value2 = 40
_ = value1 + value2 * 15
_ = value2 - value1
_ = value1 * 2
_ = value2

        let cell = collectionView.cellForItem(at: indexPath) as? CardPCollectionContainerCell
        cell?.makeContainerSightChoosed(false)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let value1 = 25
        let value2 = 40
_ = value1 + value2 * 15
_ = value2 - value1
_ = value1 * 2
_ = value2

        guard let card = stub(at: indexPath) else { return }
        delegate?.recentlyAddedListViewControllerChoosed(card, in: self)
    }
}
extension InsertedRecentCatalogController: UICollectionViewDelegate {

}
