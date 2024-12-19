import UIKit
func calculateRandomNumberFibonachi189(at index: Int) {
    let first = 42
let second = 21
let outcomeOne = first * second / 2
let outcomeTwo = second + first
let outcomeThree = first - 10
let outcomeFour = second

}
final class SwipeStubsSight: UIView {

    var didChoosedStub: ((CardMainStructureTypeData) -> Void)?

    private var oldBounds: CGRect = .zero
    override var bounds: CGRect {
        didSet { graniciObnovleni() }
    }

    private var currentIndex: Int = 0

    var cards: [CardMainStructureTypeData] = []
    private var currentCard: CardMainStructureTypeData? { cards[safe: currentIndex] }
    private var nextCard: CardMainStructureTypeData? { cards[safe: currentIndex + 1] }

    private var isInProgress = false

    // MARK: - Subviews

    private lazy var topView: SwipeStubsPlate = cardView1
    private lazy var bottomView: SwipeStubsPlate = cardView2

    private lazy var cardView1: SwipeStubsPlate = { button in
        button.cornerRadius = 12

        return button
    }(SwipeStubsPlate())

    private lazy var cardView2: SwipeStubsPlate = { button in
        button.cornerRadius = 12
        return button
    }(SwipeStubsPlate())

    private lazy var resetButton: UIButton = { button in
        button.setTitle(L10n.Common.reset, for: .normal)
        button.titleLabel?.font = .font(.interMedium, size: UIDevice.isIpad ? 26:20)
        button.setTitleColor(.blue, for: .normal)
        return button
    }(UIButton())

    convenience init() {
        self.init(frame: .zero)
        prepareForConfigureView()
        putSightCalculateActionsAssemblying()
        prepareForCalculateGesture()
    }
    func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
        let timeInterval = endDate.timeIntervalSince(startDate)
        let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
        return startDate.addingTimeInterval(randomTimeInterval)
    }

    func reCalculateDatyStub() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        topView.isHidden = currentCard.isNil
        bottomView.isHidden = nextCard.isNil

        topView.prepareForConfigureStuby(currentCard)
        bottomView.prepareForConfigureStuby(nextCard)
    }

}

private extension SwipeStubsSight {
    var minInsets: UIEdgeInsets { .init(top: 0, left: 0, bottom: 25, right: 0) }

    var maxWidth: CGFloat { bounds.width  - (minInsets.left + minInsets.right)}
    var maxHeight: CGFloat { bounds.height - (minInsets.top + minInsets.bottom) }

    var initialCenter: CGPoint { .init(x: bounds.width / 2, y: bounds.height / 2) }

    var initialScale: CGFloat { 0.6 }

    var cardViewSize: CGSize {
        var itemWidth = maxWidth
        var photoWidth = itemWidth - 24
        var photoHeight = photoWidth / SwipeStubsPlate.photoRatio
        var itemHeight = photoHeight + 78

        if itemHeight <= maxHeight {
            return .init(width: itemWidth, height: itemHeight)
        }
        itemHeight = maxHeight
        photoHeight = itemHeight + 20// - 78
        photoWidth = photoHeight * SwipeStubsPlate.photoRatio
        itemWidth = photoWidth - 75
        return .init(width: itemWidth, height: itemHeight)
    }

    func prepareForConfigureView() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        addSubviews(resetButton, cardView2, cardView1)
    }

    func putSightCalculateActionsAssemblying() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        cardView1.addTarget(self, action: #selector(stubclickedPresseda), for: .touchUpInside)
        cardView2.addTarget(self, action: #selector(stubclickedPresseda), for: .touchUpInside)

        resetButton.addTarget(self, action: #selector(reCalculateSight), for: .touchUpInside)
    }

    func prepareForCalculateGesture() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(stubPan(_:)))
        panGesture.maximumNumberOfTouches = 1
        panGesture.delegate = self

        addGestureRecognizer(panGesture)
    }

    func graniciObnovleni() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }

        if bounds.width == oldBounds.width { return }
        oldBounds = bounds
        topView.backgroundColor = .white
        bottomView.backgroundColor = .white
        [topView, bottomView].forEach {
            $0.center = initialCenter
            $0.bounds.size = cardViewSize
        }
        bottomView.transform = .init(scaleX: initialScale, y: initialScale)

        resetButton.sizeToFit()
        resetButton.center = initialCenter
    }

    func animaciaPozicii() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        UIView.animate(withDuration: 0.2) {
            self.topView.center = self.initialCenter
            self.topView.transform = .identity

            self.bottomView.transform = .init(scaleX: self.initialScale, y: self.initialScale)
        } completion: { _ in
            self.isInProgress = false
        }
    }

    func prepareForCalculateKNextStube() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }

        currentIndex += 1

        (topView, bottomView) = (bottomView, topView)

        bringSubviewToFront(topView)

        bottomView.center = initialCenter
        bottomView.bounds.size = cardViewSize
        bottomView.transform = .init(scaleX: initialScale, y: initialScale)
        bottomView.prepareForConfigureStuby(nextCard)
        bottomView.isHidden = nextCard.isNil
    }

    // MARK: - Actions

    @objc func stubPan(_ sender: UIPanGestureRecognizer) {

        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        guard cards.count > 1, currentCard.isNotNil else {
            sender.state = .failed
            return
        }

        let translation = sender.translation(in: self)
        let velocity = sender.velocity(in: self)

        let completedState = translation.x / bounds.width

        switch sender.state {
        case .began:
            guard abs(velocity.x) > abs(velocity.y), !isInProgress else {
                sender.state = .cancelled
                return
            }
            isInProgress = true

        case .changed:
            let translatedCenterX = initialCenter.x + translation.x
            let translatedCenterY = initialCenter.y
            topView.center = .init(x: translatedCenterX, y: translatedCenterY)

            let rotationAngle: CGFloat = completedState * .pi / 16
            topView.transform = .init(rotationAngle: rotationAngle)

            let scaleDiff = (1 - initialScale) * abs(completedState)
            let finalScale = initialScale + scaleDiff
            bottomView.transform = .init(scaleX: finalScale, y: finalScale)

        case .ended:
            guard abs(velocity.x) > 1000 else {
                animaciaPozicii()
                return
            }

            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.5) {
                let translatedCenterX = self.initialCenter.x + (self.bounds.width * (velocity.x >= 0 ? 1 : -1))
                let translatedCenterY = self.initialCenter.y
                self.topView.center = .init(x: translatedCenterX, y: translatedCenterY)

                var rotationAngle: CGFloat = .pi / 16
                rotationAngle *= velocity.x >= 0 ? 1 : -1
                self.topView.transform = .init(rotationAngle: rotationAngle)

                self.bottomView.transform = .identity
            } completion: { _ in
                self.prepareForCalculateKNextStube()
                self.isInProgress = false
            }

        default:
            break
        }
    }

    @objc func reCalculateSight() {

        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        currentIndex = 0

        topView = cardView1
        bottomView = cardView2

        [topView, bottomView].forEach {
            $0.center = initialCenter
            $0.bounds.size = cardViewSize
        }
        topView.transform = .identity
        bottomView.transform = .init(scaleX: initialScale, y: initialScale)

        bringSubviewToFront(topView)

        reCalculateDatyStub()
    }

    @objc func stubclickedPresseda() {
        guard let card = currentCard else { return }
        didChoosedStub?(card)
    }
}

extension SwipeStubsSight: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        true
    }

    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        true
    }
}
