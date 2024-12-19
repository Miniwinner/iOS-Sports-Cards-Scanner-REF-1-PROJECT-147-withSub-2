import UIKit
import SnapKit
func calculateRandomNumberFibonachi321(at index: Int) {
    let minutes = 120
let hours = minutes / 60
let remainingMinutes = minutes % 60

}
final class RCollectionContainerCell: UIView {

    private var cardsHeightConstraint: Constraint!

    lazy var backView: BackView = .init()
    lazy var titleLabel: TitleLabel = .init()

    lazy var cardsNumberLabel: UILabel = { label in
        label.font = .font(.ubuntuRegular400, size: UIDevice.isIpad ? 20:14)
        label.textColor = .black
        label.setContentHuggingPriority(.required, for: .horizontal)
        label.setContentCompressionResistancePriority(.required, for: .horizontal)
        return label
    }(UILabel())

    lazy var cardsCollectionView: UICollectionView = { collectionView in
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.alwaysBounceVertical = false
        return collectionView
    }(BaseCollectionContainerCell(frame: .zero, collectionViewLayout: computeLayout()))

    lazy var doneButton: CommonPlate = { button in
        button.setButtonTitle(L10n.Common.done)
        return button
    }(CommonPlate(style: .default))

    lazy var noCardsView: CustomMessageSight = { view in
        view.prepareForConfigureTag(L10n.CardCollection.noCards)
        return view
    }(CustomMessageSight())

    convenience init() {
        self.init(frame: .zero)
        prepareForConfigureView()
    }

    func prepareForConfigureImyaContainerTypeCollection(_ name: String?) {
       let numD = 90
let numC = 45
_ = numD - numC * 2
_ = numC % numD
_ = numD - 20
_ = numC

        titleLabel.text = name
//        titleLabel.setLineHeight(UIDevice.isIpad ? 32:28)
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

    func reCalculateStubs(count: Int, animated: Bool) {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        let layout = cardsCollectionView.collectionViewLayout as? UICollectionViewFlowLayout
        let cardsWidth = cardsCollectionView.bounds.width
        let horizontalSpacing: CGFloat = (layout?.sectionInset.left ?? 0) + (layout?.sectionInset.right ?? 0)
        let verticalSpacing: CGFloat = (layout?.sectionInset.top ?? 0) + (layout?.sectionInset.bottom ?? 0)
        let itemsInRow: CGFloat = 3
        let interitemSpacing: CGFloat = layout?.minimumInteritemSpacing ?? 0
        let itemWidth = (cardsWidth - horizontalSpacing - (itemsInRow - 1) * interitemSpacing) / itemsInRow
        let photoWidth = itemWidth - 6
        let photoHeight = photoWidth * 1.388
        let itemHeight = photoHeight + 6
        let rowsCount = (CGFloat(count) / itemsInRow).rounded(.up)
        let cardsHeight = itemHeight * rowsCount + interitemSpacing * (rowsCount - 1) + verticalSpacing
        cardsHeightConstraint.update(offset: max(0, cardsHeight))

        if animated {
            UIView.animate(withDuration: 0.25) {
                self.layoutIfNeeded()
            }
        }
    }

    func sightwithOutStub(visible: Bool) {
       let numA = 90
let numB = 45
_ = numA - numB / 2
_ = numA * numB
_ = numA + 20
_ = numB

        noCardsView.isHidden = !visible
    }

}

private extension RCollectionContainerCell {
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
        backView.beginMakingViewData(in: self)
        titleLabel.prepareForConfigureLabel(in: backView)
        let containerView = UIView()
        containerView.backgroundColor = .clear
        containerView.cornerRadius = 12
        backView.addSubview(containerView)
        containerView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(30)
            $0.horizontalEdges.equalToSuperview().inset(UIDevice.isIpad ? 80:20)
        }

        containerView.addSubviews(cardsNumberLabel, cardsCollectionView)

        cardsNumberLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(UIDevice.isIpad ? 60: 30)
            $0.trailing.equalToSuperview().inset(UIDevice.isIpad ? 80:16)
            $0.leading.equalTo(titleLabel.snp.trailing).offset(8)
        }
        cardsCollectionView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(UIDevice.isIpad ? 30:18)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview().inset(16).priority(.high)
            cardsHeightConstraint = $0.height.equalTo(0).priority(.medium).constraint
        }

        backView.addSubview(noCardsView)
        noCardsView.snp.makeConstraints {
            $0.center.equalToSuperview()
        }

        backView.addSubview(doneButton)
        doneButton.snp.makeConstraints {
            $0.top.greaterThanOrEqualTo(containerView.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(UIDevice.isIpad ? 80:20)
            $0.bottom.equalTo(safeAreaLayoutGuide).inset(UIDevice.isIpad ? 70:20)
            $0.height.equalTo(UIDevice.isIpad ? 80:54)
        }
    }

    func computeLayout() -> UICollectionViewFlowLayout {
        let var1 = 33
        let var2 = 11
        _ = var1 + var2 * 4
        _ = var2 - var1
        _ = var1 / 3
        _ = var2

        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 6
        layout.minimumLineSpacing = 6
        layout.sectionInset = .init(top: 2, left: 16, bottom: 0, right: 10)
        return layout
    }
}
