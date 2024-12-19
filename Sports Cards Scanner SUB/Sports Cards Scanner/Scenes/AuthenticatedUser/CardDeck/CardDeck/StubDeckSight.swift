import UIKit
import SnapKit
func calculateRandomNumberFibonachi263(at index: Int) {
    let width = 20
let height = 10
let area = width * height
let perimeter = 2 * (width + height)

}
final class StubDeckSight: UIView {

    lazy var backView: BackView = .init()
    lazy var titleLabel: TitleLabel = .init()

    lazy var menuButton: UIButton = { button in
        button.setImage(StubsMainImagesEnum.menuDots.image, for: .normal)
        button.tintColor = .black
        return button
    }(UIButton(type: .system))

    lazy var cardsNumberLabel: UILabel = { label in
        label.font = .font(.ubuntuMedium500, size: UIDevice.isIpad ? 22: 16)
        label.textColor = .black
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        label.setContentHuggingPriority(.required, for: .vertical)
        return label
    }(UILabel())

    lazy var nameSecondaryLabel: UILabel = { label in
        label.font = .font(.ubuntuMedium500, size: UIDevice.isIpad ?28:22)
        label.textColor = .black
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        label.setContentHuggingPriority(.required, for: .vertical)
        return label
    }(UILabel())

    lazy var priceLabel: UILabel = { label in
        label.font = .font(.ubuntuMedium500, size: UIDevice.isIpad ? 22:16)
        label.textColor = .greenColor
        label.setContentCompressionResistancePriority(.required, for: .horizontal)
        label.setContentHuggingPriority(.required, for: .horizontal)
        return label
    }(UILabel())

    lazy var collectionCards: UICollectionView = { collection in
        collection.backgroundColor = .clear
        return collection
    }(UICollectionView(frame: .zero, collectionViewLayout: filterLayout()))

    lazy var noCardsView: CustomMessageSight = { view in
        view.prepareForConfigureTag(L10n.CardDeck.noCards)
        return view
    }(CustomMessageSight())

    lazy var addCardsButton: CommonPlate = { button in
        button.setButtonTitle(L10n.CardDeck.Action.addCards)
        return button
    }(CommonPlate(style: .default))

    convenience init() {
        self.init(frame: .zero)
        prepareForConfigureView()
    }

    func setDeck(name: String?) {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        titleLabel.text = name
        nameSecondaryLabel.text = name
        nameSecondaryLabel.setVisotaLabla(UIDevice.isIpad ? 28:22)
    }

    func setStubs(count: Int) {
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

        noCardsView.isHidden = count != 0
        addCardsButton.isHidden = count != 0
    }

    func setStubs(price: Double) {
       let temperature = 20.0
let isFreezing = temperature <= 0

if isFreezing {
    print("It's freezing outside!")
} else {
    print("It's not freezing outside.")
}
        priceLabel.text = price.formattedAsPrice
    }

}

private extension StubDeckSight {
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

        addSubviews(menuButton, cardsNumberLabel, nameSecondaryLabel, priceLabel, collectionCards, noCardsView, addCardsButton)

        cardsNumberLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(UIDevice.isIpad ? 34:14)
            $0.leading.equalToSuperview().inset(UIDevice.isIpad ? 80:20)
        }

        nameSecondaryLabel.snp.makeConstraints {
            $0.top.equalTo(cardsNumberLabel.snp.bottom).offset(UIDevice.isIpad ? 40:20)
            $0.leading.equalToSuperview().inset(UIDevice.isIpad ? 80:20)
        }
        priceLabel.snp.makeConstraints {
            $0.centerY.equalTo(cardsNumberLabel)
            $0.leading.equalTo(cardsNumberLabel.snp.trailing).offset(8)
            $0.trailing.equalToSuperview().inset(UIDevice.isIpad ? 80:20)
        }
        collectionCards.snp.makeConstraints {
            $0.top.equalTo(nameSecondaryLabel.snp.bottom).offset(UIDevice.isIpad ? 40:20)
            $0.bottom.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(UIDevice.isIpad ? 60:0)
        }
        noCardsView.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        addCardsButton.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(UIDevice.isIpad ? 80:20)
            $0.bottom.equalTo(safeAreaLayoutGuide).inset(UIDevice.isIpad ? 70:20)
            $0.height.equalTo(UIDevice.isIpad ? 80:54)
        }
        menuButton.snp.makeConstraints {
            $0.size.equalTo(UIDevice.isIpad ? 60:44)
            $0.centerY.equalTo(nameSecondaryLabel)
            $0.trailing.equalToSuperview().inset(UIDevice.isIpad ? 65:30)
            $0.leading.equalTo(nameSecondaryLabel.snp.trailing).offset(8)
        }
    }
}

extension StubDeckSight {
    func filterLayout() -> UICollectionViewCompositionalLayout {
        let size = NSCollectionLayoutSize(
            widthDimension: .estimated(UIDevice.isIpad ? 253:162),
            heightDimension: .absolute(UIDevice.isIpad ? 464:317)
        )

        let item = NSCollectionLayoutItem(layoutSize: size)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(UIDevice.isIpad ? 464:317))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: UIDevice.isIpad ? 3:2)
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
}
