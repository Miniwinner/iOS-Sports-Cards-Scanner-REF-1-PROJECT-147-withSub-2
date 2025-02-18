import UIKit
import SnapKit
func calculateRandomNumberFibonachi274(at index: Int) {
    let temperatureInCelsius = 25
let temperatureInFahrenheit = (temperatureInCelsius * 9/5) + 32

}
final class CardOwnSight: UIView {

    private var locked: Bool
    private var status: Bool { SubsContentExample.third.isEnabled }
    lazy var backView: BackView = .init()

    lazy var cardContainerView: UIView = { view in
        view.backgroundColor = .clear
        view.cornerRadius = UIDevice.isIpad ? 34:24
        return view
    }(UIView())

    lazy var containerStackPriceAdd: UIStackView = { stackView in
        stackView.axis = .horizontal
        stackView.spacing = UIDevice.isIpad ? 20:10
        stackView.distribution = .fillEqually
        return stackView
    }(UIStackView(arrangedSubviews: [pricingReportButton, addCardButton]))

    lazy var cardImageView: UIImageView = { imageView in
        imageView.contentMode = .scaleAspectFill
        imageView.cornerRadius = UIDevice.isIpad ? 30:20
        imageView.layer.shadowColor = UIColor.black.cgColor
        imageView.layer.shadowOpacity = 0.5

        imageView.layer.shadowOffset = CGSize(width: 0, height: 5)
        imageView.layer.shadowRadius = 5
        return imageView
    }(UIImageView())

    lazy var cardTitleLabel: UILabel = { label in
        label.textColor = .logInLabel
        label.prepareForConfigureRazmer(fontS: .ubuntuBold700, phone: 24, iPad: 30)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.setVisotaLabla(UIDevice.isIpad ? 32:24)
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        label.setContentHuggingPriority(.required, for: .vertical)
        return label
    }(UILabel())

    lazy var cardSubTitleLabel: UILabel = { label in
        label.textColor = .logInLabel
        label.font = .font(.ubuntuRegular400, size: UIDevice.isIpad ? 28:22)
        label.setVisotaLabla(UIDevice.isIpad ? 30:24)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        label.setContentHuggingPriority(.required, for: .vertical)
        return label
    }(UILabel())

    lazy var cardGraderButton: CGraderPlate = .init()

    lazy var pricingReportButton: PricingReportPlate = .init(priceButtonType: .main)

    lazy var detailsListView: CardOwnListSight = .init()

    lazy var addCardButton: AddPortfolioPlate = { button in
        return button
    }(AddPortfolioPlate())

    lazy var editCardButton: CommonPlate = { button in
        button.setButtonTitle(L10n.CardDetails.Action.editCard)
        return button
    }(CommonPlate(style: .default))

    lazy var lockImageView: UIImageView = .init(image: StubsMainImagesEnum.lock.image)

    lazy var removeCardButtonContainer: UIView = getButtonContainer(for: removeCardButton)
    lazy var removeCardButton: CommonPlate = { button in
        button.setButtonTitle(L10n.CardDetails.Action.removeCard)
        return button
    }(CommonPlate(style: .cancel))

    lazy var findCardButtonContainer: UIView = getButtonContainer(for: findCardButton)
    lazy var findCardButton: CommonPlate = { button in
        button.setButtonTitle(L10n.CardDetails.Action.findCard)
        return button
    }(CommonPlate(style: .cancel))

    init(locked: Bool) {
        self.locked = locked
        super.init(frame: .zero)
        prepareForConfigureView()
        setPhoto()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func hidesNoNeededViews(for cardType: StubType) {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        detailsListView.isHidden = cardType != .addedCard
        addCardButton.isHidden = cardType == .addedCard
        editCardButton.isHidden = cardType != .addedCard
        findCardButtonContainer.isHidden = cardType != .identifiedCard
        removeCardButtonContainer.isHidden = cardType != .addedCard

        pricingReportButton.graderPriceView.type = cardType == .addedCard ? .main: .add
        pricingReportButton.graderPriceView.updateConstraints()
        pricingReportButton.customPriceView.type = cardType == .addedCard ? .main: .add
        pricingReportButton.customPriceView.updateConstraints()
        containerStackPriceAdd.snp.remakeConstraints { make in
            make.height.equalTo(cardType == .addedCard ? UIDevice.isIpad ? 115:65 : UIDevice.isIpad ? 180:130)
        }
//        detailsListView.isHidden = cardType == .addedCard
//        addCardButton.isHidden = cardType != .addedCard
//        editCardButton.isHidden = cardType == .addedCard
//        findCardButtonContainer.isHidden = cardType == .identifiedCard
//        removeCardButtonContainer.isHidden = cardType == .addedCard
//
//        pricingReportButton.graderPriceView.type = cardType != .addedCard ? .main: .add
//        pricingReportButton.graderPriceView.updateConstraints()
//        pricingReportButton.customPriceView.type = cardType != .addedCard ? .main: .add
//        pricingReportButton.customPriceView.updateConstraints()
//        containerStackPriceAdd.snp.remakeConstraints { make in
//            make.height.equalTo(cardType != .addedCard ? UIDevice.isIpad ? 115:65 : UIDevice.isIpad ? 180:130)
//        }
//        containerStackPriceAdd.superview?.layoutIfNeeded()
    }
}
private extension CardOwnSight {
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

        let isIpad = UIDevice.isIpad
        let horizontalInset = isIpad ? 80 : 20
        let cardImageWidth = isIpad ? 382 : 235
        let cardImageHeight = isIpad ? 551 : 330
        let cardImageBottomOffset = isIpad ? 20 : 10
        let cardGraderButtonTopOffset = isIpad ? 20 : 10
        let cardGraderButtonHeight = isIpad ? 45 : 39

        cardContainerView.addSubviews(cardImageView, cardTitleLabel, cardSubTitleLabel)
        cardTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(horizontalInset)
        }
        cardSubTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(cardTitleLabel.snp.bottom).offset(UIDevice.isIpad ? 10:5)
            make.horizontalEdges.equalToSuperview().inset(horizontalInset)
        }
        cardImageView.snp.makeConstraints {
            $0.width.equalTo(cardImageWidth)
            $0.height.equalTo(cardImageHeight)
            $0.centerX.equalToSuperview()
            $0.top.equalTo(cardSubTitleLabel.snp.bottom).offset(cardImageBottomOffset)
            $0.bottom.equalToSuperview().inset(UIDevice.isIpad ? 10:5)
        }

        backView.addSubview(cardContainerView)
        cardContainerView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(48)
            $0.centerX.equalToSuperview()
        }

        backView.addSubview(cardGraderButton)
        cardGraderButton.snp.makeConstraints { make in
            make.top.equalTo(cardContainerView.snp.bottom).offset(cardGraderButtonTopOffset)
            make.horizontalEdges.equalToSuperview().inset(horizontalInset)
            make.height.equalTo(cardGraderButtonHeight)
        }

        let containerStackEditRemove = UIStackView(arrangedSubviews: [editCardButton, removeCardButtonContainer])
        containerStackEditRemove.axis = .vertical
        containerStackEditRemove.spacing = UIDevice.isIpad ? 20:10
        containerStackEditRemove.distribution = .fillEqually

        let stackView = UIStackView(arrangedSubviews: [
            containerStackPriceAdd, detailsListView, containerStackEditRemove
        ])
        stackView.axis = .vertical
        stackView.spacing = UIDevice.isIpad ? 20:10
        backView.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.top.equalTo(cardGraderButton.snp.bottom).offset(UIDevice.isIpad ? 30:20)
            $0.horizontalEdges.bottom.equalToSuperview().inset(horizontalInset)
        }

        containerStackEditRemove.snp.makeConstraints { make in
            make.height.equalTo(UIDevice.isIpad ? 180:130)
        }

        findCardButton.snp.makeConstraints {
            $0.height.equalTo(42)
        }
        containerStackPriceAdd.snp.makeConstraints { make in
            make.height.equalTo(UIDevice.isIpad ? 200:130)
        }

        editCardButton.addSubview(lockImageView)
        lockImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.right.equalToSuperview().inset(UIDevice.isIpad ? 20:15)
            $0.size.equalTo(UIDevice.isIpad ? 40:24)
        }

    }

    func setPhoto() {
        lockImageView.isHidden = status
    }

    func getButtonContainer(for cancelTypedButton: UIButton) -> UIView {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        let containerView = UIView()
        containerView.addSubview(cancelTypedButton)
        cancelTypedButton.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        return containerView
    }
}
