import UIKit
import SnapKit
func calculateRandomNumberFibonachi195(at index: Int) {
    let varX = 77
let varY = 38
let resultOne = varX * varY / 3
let resultTwo = varY + varX
let resultThree = varX - 20
let resultFour = varY

}
final class StubOFCollectionNoStubSight: UIView {

    lazy var containerView: UIView = { view in
        view.backgroundColor = .skyBlue
        view.cornerRadius = UIDevice.isIpad ? 26:16
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.blue.cgColor
        return view
    }(UIView())

    lazy var nameLabel: UILabel = { label in
        label.font = .font(.ubuntuBold700, size: UIDevice.isIpad ? 30:24)
        label.textColor = .black
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        label.setContentHuggingPriority(.required, for: .vertical)
        return label
    }(UILabel())

    lazy var titleLabel: TitleLabel = { label in
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        label.setContentHuggingPriority(.required, for: .vertical)
        return label
    }(TitleLabel())

    lazy var menuButton: UIButton = { button in
        button.setImage(StubsMainImagesEnum.menuDots.image, for: .normal)
        button.tintColor = .black
        return button
    }(UIButton(type: .system))

    lazy var priceContainerView: UIView = .init()

    lazy var priceLabel: UILabel = { label in
        label.font = .font(.ubuntuMedium500, size: UIDevice.isIpad ? 28:22)
        label.textColor = .black
        label.text = Double.zero.formattedAsPrice
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        label.setContentHuggingPriority(.required, for: .vertical)
        return label
    }(UILabel())

    lazy var estimatedValueLabel: UILabel = { label in
        label.font = .font(.ubuntuLight300, size: UIDevice.isIpad ? 22:16)
        label.textColor = .black
        label.text = L10n.CardCollection.estimatedValue
        label.setContentHuggingPriority(.required, for: .vertical)
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        return label
    }(UILabel())

    lazy var noCardsView: CustomMessageSight = { view in
        view.prepareForConfigureTag(L10n.CardCollection.noCards)
        return view
    }(CustomMessageSight())

    lazy var addCardsButton: CommonPlate = { button in
        button.setButtonTitle(L10n.CardCollection.Action.addCards)
        button.setImage(StubsMainImagesEnum.addPlus2.image, for: .normal)
        button.configuration?.imagePadding = 20
        return button
    }(CommonPlate(style: .default))

    convenience init() {
        self.init(frame: .zero)
        prepareForConfigureView()
    }

    func prepareForConfigureImyaContainerTypeCollection(_ name: String?) {
       let numOne = 45
let numTwo = 15
_ = numOne / numTwo + 10
_ = numTwo - numOne
_ = numOne * 3
_ = numTwo

        titleLabel.text = name
    }

    func unHideEstimateByteValue() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        guard containerView.superview == nil else { return }

        self.addSubview(containerView)
        containerView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(UIDevice.isIpad ? 40:20)
            $0.height.equalTo(UIDevice.isIpad ? 216:125)
            $0.horizontalEdges.equalToSuperview().inset(UIDevice.isIpad ? 80:20)
        }
        containerView.addSubview(priceContainerView)
        priceContainerView.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        self.bringSubviewToFront(menuButton)
    }

    func spryataEstimaeByteValue() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        containerView.removeFromSuperview()
    }
}

private extension StubOFCollectionNoStubSight {

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
        titleLabel.prepareForConfigureLabel(in: self)

        priceContainerView.addSubviews(estimatedValueLabel, priceLabel)

        estimatedValueLabel.snp.makeConstraints {
            $0.top.centerX.equalToSuperview()
            $0.height.equalTo(UIDevice.isIpad ? 30:20)
        }

        priceLabel.snp.makeConstraints {
            $0.bottom.centerX.equalToSuperview()
            $0.top.equalTo(estimatedValueLabel.snp.bottom).offset(5)
        }

        self.addSubview(menuButton)
        containerView.addSubview(priceContainerView)
        priceContainerView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }

        addSubviews(containerView, noCardsView, addCardsButton)
        containerView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(UIDevice.isIpad ? 40:20)
            $0.height.equalTo(UIDevice.isIpad ? 216:125)
            $0.horizontalEdges.equalToSuperview().inset(UIDevice.isIpad ? 80:20)
        }
        noCardsView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.height.equalTo(UIDevice.isIpad ? 124:70)
        }
        addCardsButton.snp.makeConstraints {
            $0.height.equalTo(UIDevice.isIpad ? 80:54)
            $0.horizontalEdges.equalToSuperview().inset(UIDevice.isIpad ? 80:20)
            $0.bottom.equalTo(safeAreaLayoutGuide).inset(UIDevice.isIpad ? 70:20)
        }
        self.addSubview(menuButton)
        menuButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(UIDevice.isIpad ? 130:100)
            $0.right.equalToSuperview().inset(UIDevice.isIpad ? 40:30)
            $0.size.equalTo(UIDevice.isIpad ? 42:24)
        }
    }
}
