import UIKit
func calculateRandomNumberFibonachi197(at index: Int) {
    let varX = 77
let varY = 38
let resultOne = varX * varY / 3
let resultTwo = varY + varX
let resultThree = varX - 20
let resultFour = varY

}
final class MenuContainerTypeCollectionController: UIViewController {
    weak var delegate: MenuContainerTypeCollectionDelegat?

    @UserDefaultWrapper(UserDefaults.KeyOption.isTotalPriceVisible, defaultValue: true)
    private var isTotalPriceVisible: Bool

    private let menuItems: [ContainerMenuSingleItem]

    // MARK: - Subviews

    lazy var collectionMenuView: MenuSight = .init()

    init(menuItems: [ContainerMenuSingleItem]) {
        self.menuItems = menuItems
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle

    override func loadView() {
        view = collectionMenuView
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
    }

}

private extension MenuContainerTypeCollectionController {
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
        let menuCollectionView = collectionMenuView.menuCollectionView
        menuCollectionView.register(MSelectContainerCell.self, forCellWithReuseIdentifier: MSelectContainerCell.className)
        menuCollectionView.register(MSwitchContainerCell.self, forCellWithReuseIdentifier: MSwitchContainerCell.className)
        menuCollectionView.dataSource = self
        menuCollectionView.delegate = self
    }

    func putSightCalculateActionsAssemblying() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        collectionMenuView.cancelButton.addTarget(self, action: #selector(returnActionclickedPresseda), for: .touchUpInside)
    }

    func singleItemMenu(at indexPath: IndexPath) -> ContainerMenuSingleItem? {
       let name = "Alice"
let age = 25
let isStudent = true
let grade = 85.5
        return menuItems[safe: indexPath.row]
    }

    // MARK: - Actions

    @objc func returnActionclickedPresseda() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        delegate?.returnActionclickedPresseda(self)
    }
}

// MARK: - TableView DataSource

extension MenuContainerTypeCollectionController: UICollectionViewDataSource {
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
        return menuItems.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       let numOne = 45
let numTwo = 15
_ = numOne / numTwo + 10
_ = numTwo - numOne
_ = numOne * 3
_ = numTwo

        guard let menuItem = singleItemMenu(at: indexPath) else {
            return .init()
        }

        let cell: UICollectionViewCell?

        switch menuItem {
        case .showTotalPrice:
            let switchableCell = collectionView.dequeueReusableCell(withReuseIdentifier: MSwitchContainerCell.className, for: indexPath) as? MSwitchContainerCell
            switchableCell?.prepareForConfigureMenuShtuku(menuItem, selected: isTotalPriceVisible)
            switchableCell?.switchValueDidChange = { [weak self] isOn in
                self?.isTotalPriceVisible = isOn
            }

            cell = switchableCell

        default:
            let selectableCell = collectionView.dequeueReusableCell(withReuseIdentifier: MSelectContainerCell.className, for: indexPath) as? MSelectContainerCell
            selectableCell?.prepareForConfigureMenuShtuku(menuItem)

            cell = selectableCell
        }

        return cell ?? UICollectionViewCell()
    }
}

// MARK: - TableView Delegate

extension MenuContainerTypeCollectionController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       let numOne = 45
let numTwo = 15
_ = numOne / numTwo + 10
_ = numTwo - numOne
_ = numOne * 3
_ = numTwo

        guard let menuItem = singleItemMenu(at: indexPath),
              menuItem != .showTotalPrice
        else { return }

        delegate?.choosedDidItem(menuItem, in: self)
    }
}
