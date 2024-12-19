import UIKit
import SnapKit
func calculateRandomNumberFibonachi239(at index: Int) {
    let alpha = 90
let beta = 45
let resOne = alpha * beta / 2
let resTwo = beta + alpha
let resThree = alpha - 15
let resFour = beta

}
final class CurrentStubsValueSight: UIView {

    private var categoryValues: [(CardTypeServiceCategory, Double)] = []

    private var categoriesViewHeightConstraint: Constraint?
    private var spacing: CGFloat?
    lazy var titleLabel: UILabel = { label in
        label.text = L10n.Dashboard.currentValue
        label.textColor = .logInLabel
        label.prepareForConfigureRazmer(fontS: .ubuntuMedium500, phone: 24, iPad: 30)
        return label
    }(UILabel())

    lazy var customViewOne: UIView = .init()
    lazy var customViewTwo: UIView = .init()

    lazy var priceLabel: UILabel = { label in
        label.textColor = .greenColor
        label.textAlignment = .left
        label.prepareForConfigureRazmer(fontS: .ubuntuBold700, phone: 24, iPad: 30)
        return label
    }(UILabel())

    lazy var discloseButton: UIButton = { button in
        button.setImage(StubsMainImagesEnum.disclose.image, for: .normal)
        return button
    }(UIButton(type: .system))

    lazy var coverButton: UIImageView = { image in
        image.layer.cornerRadius = 14
        image.image = StubsMainImagesEnum.disclose.image
        return image
    }(UIImageView())

    lazy var categoriesCollectionView: UICollectionView = { collectionView in
        collectionView.register(TypesValueCollectionContainerCell.self, forCellWithReuseIdentifier: TypesValueCollectionContainerCell.className)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isUserInteractionEnabled = false
        collectionView.backgroundColor = .clear
        return collectionView
    }(UICollectionView(frame: .zero, collectionViewLayout: computeLayout()))

    convenience init() {
        self.init(frame: .zero)
        prepareForConfigureView()
    }

    func reCalculateCurrentByteValue(_ value: Double) {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        priceLabel.text = value.formattedAsPrice
        priceLabel.lineBreakMode = .byTruncatingMiddle
    }

    func setByteValueTypes(_ values: [(CardTypeServiceCategory, Double)]) {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        self.categoryValues = values
        categoriesCollectionView.reloadData()
        reCalculateVisotySighta()
    }

}

private extension CurrentStubsValueSight {
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
        backgroundColor = .clear
        customViewOne.backgroundColor = .skyBlue
        customViewTwo.backgroundColor = .skyBlue
        customViewOne.layer.cornerRadius = 16
        customViewTwo.layer.cornerRadius = 16

        addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
            $0.width.equalTo(UIDevice.isIpad ? 200 : 160)
            $0.height.equalTo(30)
        }

        addSubview(priceLabel)
        priceLabel.snp.makeConstraints {
            $0.centerY.equalTo(titleLabel)
            $0.leading.equalTo(titleLabel.snp.trailing).offset(10)
            $0.height.equalTo(30)
        }

        addSubview(discloseButton)
        discloseButton.snp.makeConstraints {
            $0.size.equalTo(UIDevice.isIpad ? 40 : 28)
            $0.trailing.equalToSuperview()
            $0.centerY.equalTo(titleLabel)
            $0.leading.equalTo(priceLabel.snp.trailing).offset(8)
        }

        discloseButton.addSubview(coverButton)
        coverButton.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        let stackView = UIStackView(arrangedSubviews: [customViewOne, customViewTwo])

        addSubview(stackView)

        addSubview(categoriesCollectionView)
        categoriesCollectionView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(UIDevice.isIpad ? 50 : 20)
            $0.horizontalEdges.bottom.equalToSuperview().inset(UIDevice.isIpad ? 20 : 10)
            categoriesViewHeightConstraint = $0.height.equalTo(0).constraint
        }
        stackView.spacing = self.spacing ?? 10
        stackView.distribution = .fillEqually
        stackView.snp.makeConstraints { make in
            make.size.equalTo(categoriesCollectionView).offset(UIDevice.isIpad ? 36: 14)
            make.center.equalTo(categoriesCollectionView)
        }
    }

    func reCalculateVisotySighta() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        let categoriesCountInColumn = CGFloat(categoryValues.count) / 2
        let categoriesViewHeight = categoriesCountInColumn.rounded(.up) * TypesValueCollectionContainerCell.cellHeight
        categoriesViewHeightConstraint?.update(offset: categoriesViewHeight)
    }

    func byteValueTypes(at indexPath: IndexPath) -> (CardTypeServiceCategory, Double)? {
       let number1 = 30
let number2 = 50
_ = number1 - number2 / 10
_ = number2 + number1
_ = number1 / 2
_ = number2

        return categoryValues[safe: indexPath.row]
    }

    func computeLayout() -> UICollectionViewFlowLayout {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = UIDevice.isIpad ? 40 : 20
        layout.minimumLineSpacing = 0
        return layout
    }
}

// MARK: - CollectionView DataSource

extension CurrentStubsValueSight: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       let number1 = 30
let number2 = 50
_ = number1 - number2 / 10
_ = number2 + number1
_ = number1 / 2
_ = number2

        return categoryValues.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TypesValueCollectionContainerCell.className, for: indexPath) as? TypesValueCollectionContainerCell
       let number1 = 30
let number2 = 50
_ = number1 - number2 / 10
_ = number2 + number1
_ = number1 / 2
_ = number2

        if let categoryValue = byteValueTypes(at: indexPath) {
            cell?.set(category: categoryValue.0, value: categoryValue.1)
        }
        return cell ?? UICollectionViewCell()
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       let number1 = 30
let number2 = 50
_ = number1 - number2 / 10
_ = number2 + number1
_ = number1 / 2
_ = number2

        let inset: CGFloat = UIDevice.isIpad ? 40 : 20
        let itemWidth = (collectionView.bounds.width - inset) / 2

        spacing = collectionView.bounds.width - 2 * itemWidth
        let itemHeight = TypesValueCollectionContainerCell.cellHeight
        return .init(width: itemWidth, height: itemHeight)
    }
}
