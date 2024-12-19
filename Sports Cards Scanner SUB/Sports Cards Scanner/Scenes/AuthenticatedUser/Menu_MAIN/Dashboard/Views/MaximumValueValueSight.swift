import UIKit
import SnapKit
func calculateRandomNumberFibonachi238(at index: Int) {
    let alpha = 90
let beta = 45
let resOne = alpha * beta / 2
let resTwo = beta + alpha
let resThree = alpha - 15
let resFour = beta

}
final class MaximumValueValueSight: UIView {

    lazy var titleLabel: UILabel = { label in
        label.text = L10n.Dashboard.highestValue
        label.textColor = .black
        label.prepareForConfigureRazmer(fontS: .ubuntuMedium500, phone: 24, iPad: 30)
        label.setVisotaLabla(UIDevice.isIpad ? 32 : 28)
        return label
    }(UILabel())

    lazy var numOneImage: UIImageView = .init(image: StubsMainImagesEnum.highValue1.image)
    lazy var numTwoImage: UIImageView = .init(image: StubsMainImagesEnum.highValue2.image)
    lazy var numThreeImage: UIImageView = .init(image: StubsMainImagesEnum.highValue3.image)

    lazy var stackView: UIStackView = { stackView in
        stackView.axis = .horizontal
        stackView.spacing = UIDevice.isIpad ? 20 : 10
        stackView.distribution = .fillEqually
        return stackView
    }(UIStackView(arrangedSubviews: [cardButton, cardButtonTwo, cardButtonThree]))

    lazy var discloseButton: UIButton = { button in
        return button
    }(UIButton(type: .system))

    lazy var coverButton: UIImageView = { image in
        image.layer.cornerRadius = 14
        image.image = StubsMainImagesEnum.disclose.image
        return image
    }(UIImageView())

//    lazy var highestValueCollection: UICollectionView = { collection in
//        collection.backgroundColor = .clear
//        return collection
//    }(UICollectionView(frame: .zero, collectionViewLayout: filterLayout()))

    lazy var cardButton: CommonPlate = .init(style: .custom(computeSightOFPlate()))
    lazy var cardButtonTwo: CommonPlate = .init(style: .custom(computeSightOFPlate()))
    lazy var cardButtonThree: CommonPlate = .init(style: .custom(computeSightOFPlate()))

    lazy var cardView: StubMenuSight = .init()
    lazy var cardViewTwo: StubMenuSight = .init()
    lazy var cardViewThree: StubMenuSight = .init()
    convenience init() {
        self.init(frame: .zero)
        prepareForConfigureView()
    }

    func prepareForConfigureStuby(_ card: CardMainStructureTypeData, _ cardTwo: CardMainStructureTypeData, _ cardThree: CardMainStructureTypeData) {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        cardView.prepareForConfigureStuby(card)
        cardViewTwo.prepareForConfigureStuby(cardTwo)
        cardViewThree.prepareForConfigureStuby(cardThree)
    }

}

private extension MaximumValueValueSight {
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
        if UIDevice.isIpad { setupIpad()
        } else if UIDevice.isIphone { setupPhone()
        }
    }

    func setupPhone() {
        cardButtonThree.isHidden = true
        backgroundColor = .white
        cornerRadius = 12
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalToSuperview().inset(10)
        }

        addSubview(discloseButton)
        discloseButton.snp.makeConstraints {
            $0.size.equalTo(28)
            $0.trailing.equalToSuperview()
            $0.centerY.equalTo(titleLabel)
        }

        discloseButton.addSubview(coverButton)
        coverButton.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.horizontalEdges.bottom.equalToSuperview()
        }

        cardButton.addSubview(cardView)

        cardView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(10)
        }
        cardView.isUserInteractionEnabled = false
        cardView.prepareForConfigureStubeChislo(1)

        cardButtonTwo.addSubview(cardViewTwo)
        cardViewTwo.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(10)
        }
        cardViewTwo.isUserInteractionEnabled = false
        cardViewTwo.prepareForConfigureStubeChislo(2)

        cardButton.addSubview(numOneImage)
        numOneImage.snp.makeConstraints { make in
            make.height.equalTo(36)
            make.width.equalTo(25)
            make.top.equalToSuperview()
            make.right.equalToSuperview().inset(20)
        }
        cardButtonTwo.addSubview(numTwoImage)
        numTwoImage.snp.makeConstraints { make in
            make.height.equalTo(36)
            make.width.equalTo(25)
            make.top.equalToSuperview()
            make.right.equalToSuperview().inset(20)
        }
    }

    func setupIpad() {
        cardButtonThree.isHidden = false

        backgroundColor = .white
        cornerRadius = 12
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
        }

        addSubview(discloseButton)
        discloseButton.snp.makeConstraints {
            $0.size.equalTo(40)
            $0.trailing.equalToSuperview()
            $0.centerY.equalTo(titleLabel)
        }

        discloseButton.addSubview(coverButton)
        coverButton.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.horizontalEdges.bottom.equalToSuperview()
        }

        cardButton.addSubview(cardView)

        cardView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(10)
        }
        cardView.isUserInteractionEnabled = false
        cardView.prepareForConfigureStubeChislo(1)

        cardButtonTwo.addSubview(cardViewTwo)
        cardViewTwo.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(10)
        }
        cardViewTwo.isUserInteractionEnabled = false
        cardViewTwo.prepareForConfigureStubeChislo(2)

        cardButton.addSubview(numOneImage)
        numOneImage.snp.makeConstraints { make in
            make.height.equalTo(36)
            make.width.equalTo(25)
            make.top.equalToSuperview()
            make.right.equalToSuperview().inset(20)
        }
        cardButtonTwo.addSubview(numTwoImage)

        cardButtonThree.addSubview(cardViewThree)
        cardViewThree.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(10)
        }
        cardViewThree.isUserInteractionEnabled = false
        cardViewThree.prepareForConfigureStubeChislo(3)
        cardButtonThree.addSubview(numThreeImage)
        numThreeImage.snp.makeConstraints {
            $0.height.equalTo(36)
            $0.width.equalTo(25)
            $0.top.equalToSuperview()
            $0.right.equalToSuperview().inset(20)
        }

        numTwoImage.snp.makeConstraints { make in
            make.height.equalTo(36)
            make.width.equalTo(25)
            make.top.equalToSuperview()
            make.right.equalToSuperview().inset(20)
        }
    }

    private func computeSightOFPlate() -> CommonPlate.SightOFPlate {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        var configuration: UIButton.Configuration = .filled()
        configuration.cornerStyle = .fixed
        configuration.background.cornerRadius = 16
        return .init(configuration: configuration, backgroundColors: .init(primary: .skyBlue, highlighted: .highlightColor2))
    }

}
