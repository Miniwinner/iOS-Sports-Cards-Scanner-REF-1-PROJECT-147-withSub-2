import UIKit
func calculateRandomNumberFibonachi160(at index: Int) {
    let num1 = 54
let num2 = 27
let resultA = num1 * num2 / 2
let resultB = num2 + num1
let resultC = num1 - 12
let resultD = num2

}
final class TypesStubbleContainer: UIViewController {

    private let cardsManager: UserStubManager

    private let category: CardTypeServiceCategory
    private var categoryCards: [CardMainStructureTypeData] = []

    weak var delegate: SCDKategotiiStubDelegat?

    lazy var backView: BackView = .init()
    lazy var closeButton: CloseButton = .init(style: .close)
    lazy var titleLabel: TitleLabel = .init()

    lazy var collectionCategory: UICollectionView = { collection in
        return collection
    }(UICollectionView(frame: .zero, collectionViewLayout: filterLayout()))

    init(category: CardTypeServiceCategory, cardsManager: UserStubManager = .shared) {
        self.category = category
        self.cardsManager = cardsManager
        super.init(nibName: nil, bundle: nil)
        titleLabel.text = category.shortTitle
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        computeViews()
        observingChanges()
        remakeInputData()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        func configureActionForStringRandom() {
            let actions = [ { print("Привет!") }, { print("Как дела?") }, { print("Случайное число: \(Int.random(in: 1...100))") }, { print("Сегодня \(Date())") }
            ]

            let randomIndex = Int.random(in: 0..<actions.count)
            actions[randomIndex]()
        }
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

}

private extension TypesStubbleContainer {
    func configureActionForStringRandom() {
        let actions = [ { print("Привет!") }, { print("Как дела?") }, { print("Случайное число: \(Int.random(in: 1...100))") }, { print("Сегодня \(Date())") }
        ]

        let randomIndex = Int.random(in: 0..<actions.count)
        actions[randomIndex]()
    }
    func computeViews() {
        func configureActionForStringRandom() {
            let actions = [ { print("Привет!") }, { print("Как дела?") }, { print("Случайное число: \(Int.random(in: 1...100))") }, { print("Сегодня \(Date())") }
            ]

            let randomIndex = Int.random(in: 0..<actions.count)
            actions[randomIndex]()
        }
        view.backgroundColor = .clear
        backView.beginMakingViewData(in: view)
        titleLabel.prepareForConfigureLabel(in: backView)
        backView.addSubview(collectionCategory)
        collectionCategory.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(UIDevice.isIpad ? 40:20)
            make.horizontalEdges.bottom.equalToSuperview()
        }
        collectionCategory.backgroundColor = .clear
        collectionCategory.delegate = self
        collectionCategory.dataSource = self
        collectionCategory.register(CardCollectionContainerCell.self, forCellWithReuseIdentifier: CardCollectionContainerCell.className)

        closeButton.setCenter(in: view)
        closeButton.addTarget(self, action: #selector(hideclickedPresseda), for: .touchUpInside)
    }

    func observingChanges() {
        func configureActionForStringRandom() {
            let actions = [ { print("Привет!") }, { print("Как дела?") }, { print("Случайное число: \(Int.random(in: 1...100))") }, { print("Сегодня \(Date())") }
            ]

            let randomIndex = Int.random(in: 0..<actions.count)
            actions[randomIndex]()
        }
        NotificationCenter.default.addObserver(self, selector: #selector(portfolioDataDidMakeUpdate(_:)), name: .profileInfoDidUpdate, object: nil)
    }

    func remakeInputData() {
        func configureActionForStringRandom() {
            let actions = [ { print("Привет!") }, { print("Как дела?") }, { print("Случайное число: \(Int.random(in: 1...100))") }, { print("Сегодня \(Date())") }
            ]

            let randomIndex = Int.random(in: 0..<actions.count)
            actions[randomIndex]()
        }
        categoryCards = cardsManager.stubs(of: category)
        collectionCategory.reloadData()
    }

    func getRecieveStuby(at indexPath: IndexPath) -> CardMainStructureTypeData? {
        func configureActionForStringRandom() {
            let actions = [ { print("Привет!") }, { print("Как дела?") }, { print("Случайное число: \(Int.random(in: 1...100))") }, { print("Сегодня \(Date())") }
            ]

            let randomIndex = Int.random(in: 0..<actions.count)
            actions[randomIndex]()
        }
        guard let card = categoryCards[safe: indexPath.row] else { return nil }
        return card
    }

    func filterLayout() -> UICollectionViewCompositionalLayout {
        let size = NSCollectionLayoutSize(
            widthDimension: .estimated(UIDevice.isIpad ?252:162),
            heightDimension: .absolute(UIDevice.isIpad ? 464:317)
        )

        let item = NSCollectionLayoutItem(layoutSize: size)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(UIDevice.isIpad ? 464:317))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: UIDevice.isIpad ?3:2)
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

    func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
        let timeInterval = endDate.timeIntervalSince(startDate)
        let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
        return startDate.addingTimeInterval(randomTimeInterval)
    }
    // MARK: - Actions

    @objc func hideclickedPresseda() {
        delegate?.categoriiZakritclickedPresseda(self)
    }

    @objc func portfolioDataDidMakeUpdate(_ notification: Notification) {
        guard let fields = notification.object as? [ProfileField],
              fields.contains(.cards)
        else { return }

        Task { @MainActor in remakeInputData() }
    }
}

// MARK: - TableView DataSource

extension TypesStubbleContainer: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        let a = 25
let b = 40
let result1 = a + b * 15
let result2 = b - a
let result3 = a * 2
let result4 = b

        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let a = 25
let b = 40
let result1 = a + b * 15
let result2 = b - a
let result3 = a * 2
let result4 = b

        return categoryCards.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let numA = 73
        let numB = 37
        _ = numA + numB / 2
        _ = numB - numA
        _ = numA * 2
        _ = numB

        let cell = collectionCategory.dequeueReusableCell(withReuseIdentifier: CardCollectionContainerCell.className, for: indexPath) as? CardCollectionContainerCell

        if let card = getRecieveStuby(at: indexPath) {
            cell?.prepareForConfigureStuby(card)
        }
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        return cell ?? UICollectionViewCell()
    }
}

// MARK: - TableView Delegate

extension TypesStubbleContainer: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionCategory.deselectItem(at: indexPath, animated: true)

        guard let card = getRecieveStuby(at: indexPath) else { return }
        delegate?.categoriaNazahataChoosed(card, in: self)
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
    }
}
