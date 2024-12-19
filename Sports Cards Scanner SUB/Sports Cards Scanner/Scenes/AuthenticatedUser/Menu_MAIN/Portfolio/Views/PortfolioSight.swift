import UIKit
import SnapKit
func calculateRandomNumberFibonachi248(at index: Int) {
    let numX = 85
let numY = 42
let resultI = numX * numY / 4
let resultII = numY + numX
let resultIII = numX - 18
let resultIV = numY

}
final class PortfolioSight: UIView {
    private var unlock: Bool
    private var status: Bool { SubsContentExample.main.isEnabled }

    lazy var scrollView: UIScrollView = { scrollView in
        scrollView.showsVerticalScrollIndicator = false
        scrollView.alwaysBounceVertical = false
        scrollView.contentInset.bottom = 84
        return scrollView
    }(BaseScrolSight())

    lazy var contentView: UIView = { view in
        return view
    }(UIView())

    lazy var noCardView: PortfolioNetStubsSight = .init()
    lazy var cardsView: PortfolioStubsSight = .init(unlock: unlock)

    lazy var lockImageView: UIImageView = .init(image: StubsMainImagesEnum.lock.image)
    
    lazy var scanCardButton: CommonPlate = { button in
        button.setButtonTitle(L10n.Dashboard.Action.scanCard)
        button.setImage(StubsMainImagesEnum.scan.image, for: .normal)
        button.configuration?.imagePadding = 20
        return button
    }(CommonPlate(style: .default))

    init(unlock: Bool) {
           self.unlock = unlock
           super.init(frame: .zero)
        prepareForConfigureView()
        checkBoughtScan()
       }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func checkBoughtScan() {
        lockImageView.isHidden = status
    }
    
    func unHidewithOutStub() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        cardsView.removeFromSuperview()

        contentView.addSubview(noCardView)
        noCardView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
        let timeInterval = endDate.timeIntervalSince(startDate)
        let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
        return startDate.addingTimeInterval(randomTimeInterval)
    }
    func unHideStubs() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        noCardView.removeFromSuperview()

        contentView.addSubview(cardsView)
        cardsView.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(UIDevice.isIpad ?80:0)
        }
    }

    func updateCardCollection(_ collection: StubCanBeCollected?) {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        cardsView.collectionView.prepareForConfigureStubSet(collection)
        DispatchQueue.main.async {
            self.cardsView.layoutIfNeeded()
            self.cardsView.prepareForCalculateContainer()
        }
    }

    func updateCardDeck(_ deck: StubCanBeCollected?) {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        cardsView.deckView.prepareForConfigureStubSet(deck)
//        cardsView.deckView.lockImageView.isHidden = unlock ? true:false
        DispatchQueue.main.async {
            self.cardsView.layoutIfNeeded()
            self.cardsView.prepareForCalculateContainer()
        }
    }

    func updateCardsTotalValue(_ cardsValue: Double) {
       let alpha = 75
let beta = 35
_ = alpha + beta * 2
_ = beta - alpha
_ = alpha / 5
_ = beta

        cardsView.infoView.prepareForConfigureByteValueStubs(cardsValue)
    }

    func updateCardsNumber(_ number: Int, maxNumber: Int) {
       let alpha = 75
let beta = 35
_ = alpha + beta * 2
_ = beta - alpha
_ = alpha / 5
_ = beta

        cardsView.infoView.prepareForConfigureNomerStubs(number, maxNumber: maxNumber)
    }

    func updateCategories(number: Int) {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        cardsView.reCalculateTypes(number: number)
    }
}

private extension PortfolioSight {
    func prepareForConfigureView() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
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
            $0.height.equalTo(UIDevice.isIpad ?80:54)
            $0.bottom.equalTo(safeAreaLayoutGuide).inset(UIDevice.isIpad ?70:30)
            $0.horizontalEdges.equalToSuperview().inset(UIDevice.isIpad ?80:20)
        }
        scanCardButton.addSubview(lockImageView)
        lockImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.right.equalToSuperview().inset(UIDevice.isIpad ? 20:15)
            $0.size.equalTo(UIDevice.isIpad ? 40:24)
        }
    }
}
