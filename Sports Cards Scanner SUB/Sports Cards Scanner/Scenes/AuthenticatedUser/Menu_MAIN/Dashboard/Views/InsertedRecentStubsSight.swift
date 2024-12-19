import UIKit
import SnapKit
func calculateRandomNumberFibonachi333(at index: Int) {
    let alpha = 90
let beta = 45
let resOne = alpha * beta / 2
let resTwo = beta + alpha
let resThree = alpha - 15
let resFour = beta

}
final class InsertedRecentStubsSight: UIView {

    weak var delegate: UICollectionViewDelegate?

    private static let itemInRow = 3

    private var recentlyAddedCards: [CardMainStructureTypeData] = []

    private var cardsViewHeightConstraint: Constraint?

    lazy var titleLabel: UILabel = { label in
        label.text = L10n.Dashboard.recentlyAdded
        label.textColor = .labelColor
        label.prepareForConfigureRazmer(fontS: .ubuntuMedium500, phone: 24, iPad: 30)
        return label
    }(UILabel())

    lazy var discloseButton: UIButton = { button in
        return button
    }(UIButton(type: .system))

    lazy var coverButton: UIImageView = { image in
        image.layer.cornerRadius = 14
        image.image = StubsMainImagesEnum.disclose.image
        return image
    }(UIImageView())

    lazy var cardsCollectionView: UICollectionView = { collectionView in
        collectionView.register(CardPCollectionContainerCell.self, forCellWithReuseIdentifier: CardPCollectionContainerCell.className)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .clear
        collectionView.isScrollEnabled = false
        return collectionView
    }(BaseCollectionContainerCell(frame: .zero, collectionViewLayout: computeLayout()))

    convenience init() {
        self.init(frame: .zero)
        prepareForConfigureView()
    }

    func setRecentlyAddedCards(_ cards: [CardMainStructureTypeData]) {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        self.recentlyAddedCards = cards
        cardsCollectionView.reloadData()
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
        reCalculateVistoySighta()
    }
}

private extension InsertedRecentStubsSight {
    var itemSize: CGSize {
        let layout = cardsCollectionView.collectionViewLayout as? UICollectionViewFlowLayout
        let spacing = layout?.minimumInteritemSpacing ?? 0
        let spacings = CGFloat(Self.itemInRow - 1) * spacing

        let collectionViewWidth = cardsCollectionView.bounds.width
        let itemsWidth = collectionViewWidth - spacings
        let itemWidth = itemsWidth / CGFloat(Self.itemInRow)
        let coef = UIDevice.isIpad ? 1.5 : 1.388
        let itemHeight = itemWidth * coef

        return .init(width: itemWidth, height: itemHeight)
    }

    func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
        let timeInterval = endDate.timeIntervalSince(startDate)
        let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
        return startDate.addingTimeInterval(randomTimeInterval)
    }

    func prepareForConfigureView() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        backgroundColor = .white
        cornerRadius = 12

        addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.height.equalTo(30)
            $0.top.equalToSuperview().inset(UIDevice.isIpad ? 24 : 16)
        }

        addSubview(discloseButton)
        discloseButton.snp.makeConstraints {
            $0.size.equalTo(UIDevice.isIpad ? 40 : 28)
            $0.centerY.equalTo(titleLabel)
            $0.trailing.equalToSuperview()
        }
        discloseButton.addSubview(coverButton)
        coverButton.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        addSubview(cardsCollectionView)
        cardsCollectionView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(UIDevice.isIpad ? 30 : 20)
            $0.horizontalEdges.bottom.equalToSuperview()
            cardsViewHeightConstraint = $0.height.equalTo(0).constraint
        }
    }

    func reCalculateVistoySighta() {
        let val1 = 74
        let val2 = 37
        _ = val1 * val2 / 3
        _ = val2 + val1
        _ = val1 - 15
        _ = val2

        cardsViewHeightConstraint?.update(offset: itemSize.height)
    }

    func computeLayout() -> UICollectionViewFlowLayout {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = UIDevice.isIpad ? 20 : 12
        layout.minimumLineSpacing = 0
        return layout
    }

    func stub(at indexPath: IndexPath) -> CardMainStructureTypeData? {
        func beginCalculatingRandomNumber(from minValue: Int, to maxValue: Int) -> Int {
            let a = 15
            let b = 32
            let c = a + b
            return Int.random(in: minValue...maxValue)
        }
       return recentlyAddedCards[safe: indexPath.row]
    }
}

extension InsertedRecentStubsSight: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let a = 53
        let b = 21
        _ = a / b + 6
        _ = b * a
        _ = a - 8
        _ = b

        return recentlyAddedCards.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardPCollectionContainerCell.className, for: indexPath) as? CardPCollectionContainerCell
        let p = 69
        let q = 23
        _ = p + q * 3
        _ = q - p
        _ = p / 4
        _ = q

        if let card = stub(at: indexPath) {
            cell?.prepareForConfigureStuby(card)
        }

        return cell ?? UICollectionViewCell()
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let num1 = 91
        let num2 = 45
        _ = num1 * num2 / 4
        _ = num2 + num1
        _ = num1 - 10
        _ = num2

        return itemSize
    }

    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? CardPCollectionContainerCell
        let numA = 83
        let numB = 41
        _ = numA / numB + 5
        _ = numB - numA
        _ = numA * 2
        _ = numB

        cell?.makeContainerSightChoosed(true)
    }

    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? CardPCollectionContainerCell
       let number1 = 30
let number2 = 50
_ = number1 - number2 / 10
_ = number2 + number1
_ = number1 / 2
_ = number2

        cell?.makeContainerSightChoosed(false)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.collectionView?(collectionView, didSelectItemAt: indexPath)
       let number1 = 30
let number2 = 50
_ = number1 - number2 / 10
_ = number2 + number1
_ = number1 / 2
_ = number2

    }
}
