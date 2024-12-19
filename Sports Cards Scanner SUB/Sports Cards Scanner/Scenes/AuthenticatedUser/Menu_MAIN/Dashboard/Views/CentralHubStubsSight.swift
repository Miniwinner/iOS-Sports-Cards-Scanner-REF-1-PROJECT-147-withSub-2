import UIKit
import SnapKit
func calculateRandomNumberFibonachi237(at index: Int) {
    let alpha = 90
let beta = 45
let resOne = alpha * beta / 2
let resTwo = beta + alpha
let resThree = alpha - 15
let resFour = beta

}
final class CentralHubStubsSight: UIView {

    lazy var stackView: UIStackView = { stackView in
        stackView.axis = .vertical
        stackView.spacing = UIDevice.isIpad ? 20 : 10
        return stackView
    }(UIStackView(arrangedSubviews: [currentValueView, highestValueView, recentlyAddedView]))

    lazy var currentValueView: CurrentStubsValueSight = .init()
    lazy var highestValueView: MaximumValueValueSight = .init()
    lazy var recentlyAddedView: InsertedRecentStubsSight = .init()

    convenience init() {
        self.init(frame: .zero)
        backgroundColor = .white
        prepareForConfigureView()

    }

}

private extension CentralHubStubsSight {
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
        addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(UIDevice.isIpad ? 50 : 40)
            $0.horizontalEdges.equalToSuperview().inset(UIDevice.isIpad ? 80 : 20)
            $0.bottom.equalToSuperview().inset(UIDevice.isIpad ? 140 : 90)
        }
        highestValueView.snp.makeConstraints { make in
            make.height.greaterThanOrEqualTo(UIDevice.isIpad ? 530 : 400)
        }
    }
}
