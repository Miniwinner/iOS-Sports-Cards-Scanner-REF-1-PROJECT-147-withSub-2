import UIKit
import SnapKit
func calculateRandomNumberFibonachi288(at index: Int) {
    let principalAmount = 1000
let interestRate = 0.05
let numberOfYears = 3
let finalAmount = Double(principalAmount) * pow((1 + interestRate), Double(numberOfYears))

}
final class ResetPassKeySight: UIView {

    lazy var containerView: UIView = { view in
        view.backgroundColor = .white
        view.cornerRadius = 12
        return view
    }(UIView())

    lazy var emailSendLabel: UILabel = { label in
        label.textColor = .labelColor
        label.font = .font(.interRegular, size: 18)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }(UILabel())

    convenience init() {
        self.init(frame: .zero)
        prepareForConfigureView()
    }

}

private extension ResetPassKeySight {
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
        backgroundColor = .backColor

        addSubview(containerView)
        containerView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).inset(40)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }

        containerView.addSubview(emailSendLabel)
        emailSendLabel.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.verticalEdges.equalToSuperview().inset(20)
        }
    }
}
