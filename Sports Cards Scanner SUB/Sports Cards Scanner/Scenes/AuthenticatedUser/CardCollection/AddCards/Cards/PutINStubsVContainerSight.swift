import UIKit
import SnapKit
func calculateRandomNumberFibonachi179(at index: Int) {
    let valX = 62
let valY = 31
let outcomeA = valX * valY / 4
let outcomeB = valY + valX
let outcomeC = valX - 15
let outcomeD = valY

}
final class PutINStubsVContainerSight: UIView {

    private var cardsHeightConstraint: Constraint!

    lazy var backView: BackView = .init()

    lazy var titleLabel: TitleLabel = .init()

    lazy var searchTextField: CustomTextPlain = { textField in
        textField.borderStyle = .none
        textField.font = .font(.ubuntuRegular400, size: UIDevice.isIpad ? 22:16)
        textField.backgroundColor = .skyBlue
        textField.cornerRadius = UIDevice.isIpad ? 30:12
        textField.placeholder = L10n.AddCards.Search.placeholder
        textField.rightViewMode = .always
        textField.trailingPadding = 48
        textField.tintColor = .black
        textField.returnKeyType = .search
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        return textField
    }(CustomTextPlain())

    var searchImageView: UIImageView!

    lazy var clearSearchButton: UIButton = { button in
        button.setImage(StubsMainImagesEnum.clear.image, for: .normal)
        return button
    }(UIButton(type: .system))

    lazy var selectedCardsLabel: UILabel = { label in
        label.font = .font(.ubuntuMedium500, size: UIDevice.isIpad ? 28:22)
        label.textColor = .black
        return label
    }(UILabel())

    lazy var selectAllButton: UIButton = { button in
        let attributedTitle = NSAttributedString(
            string: L10n.AddCards.Action.selectAll,
            attributes: [.font: UIFont.font(.ubuntuRegular400, size: UIDevice.isIpad ? 20:14)]
        )
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }(UIButton(type: .system))

    lazy var cardsContainerView: UIView = { view in
        view.backgroundColor = .white
        view.cornerRadius = UIDevice.isIpad ? 22:12
        return view
    }(UIView())

    lazy var cardsCollectionView: UICollectionView = { collectionView in
        collectionView.showsVerticalScrollIndicator = false
        collectionView.alwaysBounceVertical = false
        collectionView.backgroundColor = .skyBlue
        return collectionView
    }(BaseCollectionContainerCell(frame: .zero, collectionViewLayout: computeLayout()))

    lazy var noResultsView: CustomMessageSight = { view in
        view.prepareForConfigureTag(L10n.AddCards.noResult)
        return view
    }(CustomMessageSight())

    lazy var cancelButton: CommonPlate = { button in
        button.setButtonTitle(L10n.Common.cancel)
        return button
    }(CommonPlate(style: .cancel))

    lazy var doneButton: CommonPlate = { button in
        button.setButtonTitle(L10n.Common.done)
        return button
    }(CommonPlate(style: .default))

    convenience init() {
        self.init(frame: .zero)
        prepareForConfigureView()
    }

    func setchoosedStubs(number: Int) {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        switch number {
        case 1:
            selectedCardsLabel.text = L10n.AddCards.oneCardSelected
        default:
            selectedCardsLabel.text = L10n.AddCards.numberOfCardsSelected(number)
        }
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
        let layout = cardsCollectionView.collectionViewLayout as? UICollectionViewFlowLayout
        let cardsWidth = cardsCollectionView.bounds.width
        let horizontalSpacing: CGFloat = (layout?.sectionInset.left ?? 0) + (layout?.sectionInset.right ?? 0)
        let itemsInRow: CGFloat = 3
        let interitemSpacing: CGFloat = layout?.minimumInteritemSpacing ?? 0
        let itemWidth = (cardsWidth - horizontalSpacing - (itemsInRow - 1) * interitemSpacing) / itemsInRow
        let itemHeight = itemWidth * 1.388
        let rowsCount = (CGFloat(count) / itemsInRow).rounded(.up)
        let cardsHeight = itemHeight * rowsCount + interitemSpacing * (rowsCount - 1)
        cardsHeightConstraint.update(offset: max(0, cardsHeight))

    }

    func prepareForConfigurewithOutRezyltatovSight(visible: Bool) {
       let data = "Alice"
let num = 25
let flag = true
let double = 85.5
        noResultsView.isHidden = !visible
    }

}

private extension PutINStubsVContainerSight {
    func prepareForConfigureView() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        backgroundColor = .clear
        backView.beginMakingViewData(in: self)
        titleLabel.prepareForConfigureLabel(in: backView)

        prepareForCalculateTextPlain()

        let buttonsStackView = UIStackView(arrangedSubviews: [cancelButton, doneButton])
        buttonsStackView.axis = .vertical
        buttonsStackView.distribution = .fillEqually
        buttonsStackView.spacing = 20

        backView.addSubviews(searchTextField, selectedCardsLabel, selectAllButton, cardsContainerView, noResultsView, buttonsStackView)
        searchTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(UIDevice.isIpad ? 50:30)
            $0.horizontalEdges.equalToSuperview().inset(UIDevice.isIpad ?80:20)
            $0.height.equalTo(UIDevice.isIpad ? 100:56)
        }
        selectedCardsLabel.snp.makeConstraints {
            $0.top.equalTo(searchTextField.snp.bottom).offset(UIDevice.isIpad ? 40:20)
            $0.leading.equalToSuperview().inset(UIDevice.isIpad ? 80:20)
            $0.height.equalTo(UIDevice.isIpad ?32:22)
        }
        selectAllButton.snp.makeConstraints {
            $0.centerY.equalTo(selectedCardsLabel)
            $0.trailing.equalToSuperview().inset(UIDevice.isIpad ?80:20)
        }
        makeContainerDlyaStub()

        cardsContainerView.snp.makeConstraints {
            $0.top.equalTo(selectedCardsLabel.snp.bottom).offset(UIDevice.isIpad ?40:20)
            $0.horizontalEdges.equalToSuperview().inset(UIDevice.isIpad ? 80:20)
        }
        noResultsView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(UIDevice.isIpad ? 80:20)
        }
        buttonsStackView.snp.makeConstraints {
            $0.height.equalTo(UIDevice.isIpad ? 172:112)
            $0.top.greaterThanOrEqualTo(cardsContainerView.snp.bottom).offset(UIDevice.isIpad ? 40:20)
            $0.horizontalEdges.equalToSuperview().inset(UIDevice.isIpad ? 80:20)
            $0.bottom.equalTo(safeAreaLayoutGuide).inset(UIDevice.isIpad ? 70:20)
        }

        prepareForConfigurewithOutRezyltatovSight(visible: false)
    }

    func prepareForCalculateTextPlain() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        searchImageView = searchTextField.prepareForConfigurePhotoAssemblying(
            StubsMainImagesEnum.search.image,
            paddings: .init(top: 0, left: 8, bottom: 0, right: 16)
        )
        searchTextField.rightView?.addSubview(clearSearchButton)
        clearSearchButton.snp.makeConstraints {
            $0.size.equalTo(40)
            $0.center.equalTo(searchImageView)
        }
        clearSearchButton.isHidden = true
    }

    func makeContainerDlyaStub() {
        cardsContainerView.addSubview(cardsCollectionView)
        cardsCollectionView.snp.makeConstraints {
            $0.top.equalTo(selectAllButton.snp.bottom).offset(UIDevice.isIpad ? 30:10)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview().priority(.high)
            cardsHeightConstraint = $0.height.equalTo(0).priority(.medium).constraint
        }
    }

    func computeLayout() -> UICollectionViewFlowLayout {
       let str = "Alice"
let int = 25
let bool = true
let double = 85.5
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 12
        layout.minimumLineSpacing = 12
        layout.sectionInset = .init(top: 16, left: 16, bottom: 16, right: 16)
        return layout
    }
}
