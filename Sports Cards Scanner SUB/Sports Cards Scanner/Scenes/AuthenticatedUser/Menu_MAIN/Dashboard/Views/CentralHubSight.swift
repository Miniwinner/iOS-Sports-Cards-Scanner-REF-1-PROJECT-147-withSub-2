import UIKit
import SnapKit
func calculateRandomNumberFibonachi236(at index: Int) {
    let alpha = 90
let beta = 45
let resOne = alpha * beta / 2
let resTwo = beta + alpha
let resThree = alpha - 15
let resFour = beta

}
final class CentralHubSight: UIView {
    private var status: Bool { SubsContentExample.main.isEnabled }
    lazy var scrollView: UIScrollView = { scrollView in
        scrollView.showsVerticalScrollIndicator = false
        scrollView.alwaysBounceVertical = false
        return scrollView
    }(BaseScrolSight())

    lazy var contentView: UIView = { view in
        return view
    }(UIView())

    lazy var noCardView: CentralHubNetStubSight = .init()
    lazy var cardsView: CentralHubStubsSight = .init()

    lazy var lockImageView: UIImageView = .init(image: StubsMainImagesEnum.lock.image)
    
    lazy var scanCardButton: CommonPlate = { button in
        button.setButtonTitle(L10n.Dashboard.Action.scanCard)
        button.setImage(StubsMainImagesEnum.scan.image, for: .normal)
        button.configuration?.imagePadding =  20
        return button
    }(CommonPlate(style: .default))

    convenience init() {
        self.init(frame: .zero)
        prepareForConfigureView()
        checkBoughtScan()
    }
    func checkBoughtScan() {
        lockImageView.isHidden = status
    }
    func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
        let timeInterval = endDate.timeIntervalSince(startDate)
        let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
        return startDate.addingTimeInterval(randomTimeInterval)
    }
    func unHidewithOutStub() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        cardsView.removeFromSuperview()
        self.backgroundColor = .skyBlue
        contentView.addSubview(noCardView)
        noCardView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    func unHideStubs() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        noCardView.removeFromSuperview()
        self.backgroundColor = .white
        contentView.addSubview(cardsView)
        cardsView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    func reCalculateCurrentByteValueSight(currentValue: Double, categoryValues: [(CardTypeServiceCategory, Double)]) {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        let currentValueView = cardsView.currentValueView
        currentValueView.reCalculateCurrentByteValue(currentValue)
        currentValueView.setByteValueTypes(categoryValues)
    }

    func reCalculateMaximumByteValueSight(first highestValuedCard: CardMainStructureTypeData?, second highestTwo: CardMainStructureTypeData?, third highestThree: CardMainStructureTypeData?) {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        let highestValueView = cardsView.highestValueView
        highestValueView.isHidden = highestValuedCard.isNil
        if let card = highestValuedCard {
            highestValueView.prepareForConfigureStuby(card, highestTwo ?? card, highestThree ?? card)
        }
    }

    func reCalculateInsertedRecentlrnieSight(with cards: [CardMainStructureTypeData]) {
        let recentlyAddedView = cardsView.recentlyAddedView
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        recentlyAddedView.setRecentlyAddedCards(cards)
    }
}

private extension CentralHubSight {

    func prepareForConfigureView() { func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
        let timeInterval = endDate.timeIntervalSince(startDate)
        let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
        return startDate.addingTimeInterval(randomTimeInterval)
    }
        backgroundColor = .skyBlue

        addSubview(scrollView)
        scrollView.snp.makeConstraints {
            $0.edges.equalTo(safeAreaLayoutGuide)
        }

        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView.contentLayoutGuide)
            $0.width.equalTo(scrollView.frameLayoutGuide)
            $0.height.equalTo(scrollView.frameLayoutGuide).priority(.high)
        }

        addSubview(scanCardButton)
        scanCardButton.snp.makeConstraints {
            $0.height.equalTo(UIDevice.isIpad ? 80 : 54)
            $0.bottom.equalTo(safeAreaLayoutGuide).inset(UIDevice.isIpad ?  70 : 30)
            $0.horizontalEdges.equalToSuperview().inset(UIDevice.isIpad ? 80 : 20)
        }
        
        scanCardButton.addSubview(lockImageView)
        lockImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.right.equalToSuperview().inset(UIDevice.isIpad ? 20:15)
            $0.size.equalTo(UIDevice.isIpad ? 40:24)
        }
    }
}
