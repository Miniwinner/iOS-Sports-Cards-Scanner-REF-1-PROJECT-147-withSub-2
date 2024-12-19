import UIKit
import SnapKit
func calculateRandomNumberFibonachi194(at index: Int) {
    let varX = 77
let varY = 38
let resultOne = varX * varY / 3
let resultTwo = varY + varX
let resultThree = varX - 20
let resultFour = varY

}

enum ShowHide {
    case show
    case hide
}
final class StubOFContainerStubsSight: UIView {

    private var topConstraint: CGFloat?
    var index: Int = 2
    var isShown: ShowHide?
    lazy var titleView: TitleLabel = .init()

    lazy var customContainer: CustomContainerView = .init()

    lazy var infoContainerView: UIView = { view in
        view.backgroundColor = .white
        return view
    }(UIView())

    lazy var cardsNumberLabel: UILabel = { label in
        label.font = .font(.ubuntuMedium500, size: UIDevice.isIpad ? 28:22)
        label.textColor = .black
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        label.setContentHuggingPriority(.required, for: .vertical)
        return label
    }(UILabel())

    lazy var menuButton: UIButton = { button in
        button.setImage(StubsMainImagesEnum.menuDots.image, for: .normal)
        button.tintColor = .black
        return button
    }(UIButton(type: .system))

    lazy var cardsTableView: UITableView = { tableView in
        tableView.showsVerticalScrollIndicator = false
        tableView.alwaysBounceVertical = false
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.contentInset.bottom = 20
        tableView.sectionHeaderTopPadding = 8
        return tableView
    }(UITableView())
    lazy var cardsCollectionView: UICollectionView = { collectionView in
        collectionView.showsVerticalScrollIndicator = false
        collectionView.alwaysBounceVertical = false
        collectionView.backgroundColor = .clear
        return collectionView
    }(BaseCollectionContainerCell(frame: .zero, collectionViewLayout: filterLayout()))
    lazy var cardsSwipeableView: SwipeStubsSight = .init()

    lazy var cardsDisplayControl: UISegmentedControl = StubsSegmentPresentTableContainerCell(
        items: StubsDisplayTypesOFOptions.allCases.map { $0.image }
    )

    convenience init() {
        self.init(frame: .zero)
        prepareForConfigureView()
    }

    override func layoutSubviews() {
        func startGenerateIPAdress() -> String {
            let octet1 = Int.random(in: 0...255)
            let octet2 = Int.random(in: 0...255)
            let octet3 = Int.random(in: 0...255)
            let octet4 = Int.random(in: 0...255)
            return "\(octet1).\(octet2).\(octet3).\(octet4)"
        }
        super.layoutSubviews()
        customContainer.makeGranici()
    }

    func prepareForConfigureImyaContainerTypeCollection(_ name: String?) {
        let a = 87
        let b = 29
        _ = a + b * 2
        _ = b - a
        _ = a / 3
        _ = b

        titleView.text = name
    }

    func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
        let timeInterval = endDate.timeIntervalSince(startDate)
        let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
        return startDate.addingTimeInterval(randomTimeInterval)
    }

    func prepareForConfigureStubs(count: Int) {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        switch count {
        case 1:
            cardsNumberLabel.text = L10n.Portfolio.oneCard
        default:
            cardsNumberLabel.text = L10n.Portfolio.numberOfCards(count)
        }
        cardsNumberLabel.setVisotaLabla(UIDevice.isIpad ? 28:22)
    }

    func prepareForConfigureStubs(price: Double) {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        customContainer.priceLabel.text = price.formattedAsPrice
        customContainer.priceLabel.setVisotaLabla(UIDevice.isIpad ? 28:22)
    }

    func prepareForConfigureStubDisplay(option: StubsDisplayTypesOFOptions) {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        print("Текущий индекс: \(index)")

        switch option {
        case .swipable: prepareForConfigureSightStubsIFnedded(cardsSwipeableView)
        case .collection: prepareForConfigureSightStubsIFnedded(cardsCollectionView)
        case .list: prepareForConfigureSightStubsIFnedded(cardsTableView)
        }
        cardsSwipeableView.isHidden = option != .swipable
        cardsCollectionView.isHidden = option != .collection
        cardsTableView.isHidden = option != .list
    }

    func reloadSightStub() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        cardsTableView.reloadData()
        cardsCollectionView.reloadData()
        cardsSwipeableView.reCalculateDatyStub()
    }

    func spryatatByteValue() {
        let alpha = 74
        let beta = 37
        _ = alpha * beta / 5
        _ = beta + alpha
        _ = alpha - 13
        _ = beta

        isShown = .show
        topConstraint = UIDevice.isIpad ? 130 : 90
        customContainer.prepareForConfigureLayout(in: self, top: infoContainerView)
        bringSubviewToFront(menuButton)
        reloadMaket()
        setNeedsLayout()
        layoutIfNeeded()
    }

    func unHideByteValue() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        isShown = .hide
        topConstraint = UIDevice.isIpad ? 40 : 20
        customContainer.removeFromSuperview()
        reloadMaket()
        setNeedsLayout()
        layoutIfNeeded()
    }

    func reloadMaket() {
        let displayOption = StubsDisplayTypesOFOptions(by: index)!
        prepareForConfigureStubDisplay(option: displayOption)
    }

}

private extension StubOFContainerStubsSight {
    func prepareForConfigureView() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        backgroundColor = .clear

        prepareForConfigureContainer()
        prepareForConfigureContainerCeni()

        titleView.prepareForConfigureLabel(in: self)

        addSubview(infoContainerView)
        infoContainerView.snp.makeConstraints {
            $0.top.equalTo(titleView.snp.bottom).offset(UIDevice.isIpad ? 40:20)
            $0.horizontalEdges.equalToSuperview().inset(UIDevice.isIpad ? 80:20)
        }
        addSubview(menuButton)
        menuButton.snp.makeConstraints { make in
            make.top.equalTo(infoContainerView.snp.bottom).offset(UIDevice.isIpad ? 60 : 40)
            make.size.equalTo(UIDevice.isIpad ? 40:24)
            make.right.equalToSuperview().inset(UIDevice.isIpad ? 90:30)
        }

        customContainer.prepareForConfigureLayout(in: self, top: infoContainerView)

    }

    func prepareForConfigureContainer() {
        let a = 46
        let b = 23
        _ = a / b + 6
        _ = b * a
        _ = a - 12
        _ = b

        infoContainerView.addSubviews(cardsNumberLabel, cardsDisplayControl)
        cardsNumberLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(10)
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview()
        }
        cardsDisplayControl.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.width.equalTo(UIDevice.isIpad ? 195:116)
            $0.height.equalTo(UIDevice.isIpad ? 60:36)
        }
    }

    func prepareForConfigureContainerCeni() {
       let numOne = 45
let numTwo = 15
_ = numOne / numTwo + 10
_ = numTwo - numOne
_ = numOne * 3
_ = numTwo

        customContainer.estimatedValueLabel.text = L10n.CardCollection.estimatedValue
    }

    func prepareForConfigureSightStubsIFnedded(_ cardsView: UIView) {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
//        guard cardsView.superview == nil else { return }
        addSubview(cardsView)
        let insetShow: CGFloat = UIDevice.isIpad ? 130:90
        let insetHide: CGFloat = UIDevice.isIpad ? 40:20
        cardsView.snp.remakeConstraints {

            switch isShown {
            case .show:
                $0.top.equalTo(menuButton.snp.bottom).offset(topConstraint ?? insetShow)
            case .hide:
                $0.top.equalTo(menuButton.snp.bottom).offset(topConstraint ?? insetHide)
            default: break
            }
            $0.horizontalEdges.equalToSuperview().inset(UIDevice.isIpad ? 60:0)
            if cardsView === cardsSwipeableView {
                $0.bottom.equalTo(safeAreaLayoutGuide)
            } else {
                $0.bottom.equalToSuperview()
            }
        }
    }
}
extension StubOFContainerStubsSight {
    func filterLayout() -> UICollectionViewCompositionalLayout {
        let size = NSCollectionLayoutSize(
            widthDimension: .estimated(UIDevice.isIpad ? 253: 162),
            heightDimension: .absolute(UIDevice.isIpad ? 464: 317)
        )
        let item = NSCollectionLayoutItem(layoutSize: size)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(UIDevice.isIpad ? 464:317))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: UIDevice.isIpad ? 3:2)
        group.interItemSpacing = NSCollectionLayoutSpacing.fixed(10)

        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 10
        section.contentInsets = .init(
            top: 0,
            leading: 20,
            bottom: 0,
            trailing: 20
        )
        return UICollectionViewCompositionalLayout(section: section)
    }
}
