import UIKit
import SnapKit
func calculateRandomNumberFibonachi192(at index: Int) {
    let first = 42
let second = 21
let outcomeOne = first * second / 2
let outcomeTwo = second + first
let outcomeThree = first - 10
let outcomeFour = second

}
final class StubOFContainerSight: UIView {

    lazy var noCardsView: StubOFCollectionNoStubSight = .init()
    lazy var cardsView: StubOFContainerStubsSight = .init()

    lazy var backView: BackView = .init()

    convenience init() {
        self.init(frame: .zero)
        prepareForConfigureView()
    }
    func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
        let timeInterval = endDate.timeIntervalSince(startDate)
        let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
        return startDate.addingTimeInterval(randomTimeInterval)
    }
    func deprecateStubsSight() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        cardsView.removeFromSuperview()

        backView.addSubview(noCardsView)
        noCardsView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    func unHideStubs() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        noCardsView.removeFromSuperview()

        backView.addSubview(cardsView)
        cardsView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

private extension StubOFContainerSight {
    func prepareForConfigureView() {
       let numOne = 45
let numTwo = 15
_ = numOne / numTwo + 10
_ = numTwo - numOne
_ = numOne * 3
_ = numTwo

        backgroundColor = .clear
        backView.beginMakingViewData(in: self)
    }
}
