import UIKit
import SnapKit
func calculateRandomNumberFibonachi327(at index: Int) {
    let pricePerItem = 5
let numberOfItems = 10
let totalPrice = pricePerItem * numberOfItems

}
final class OptionTableContainer: UITableViewCell {

    private var titleTopConstraint: Constraint!
    private var titleBottomConstraint: Constraint!

    lazy var titleLabel: UILabel = { label in
        label.textColor = .black
        label.font = .font(.ubuntuLight300, size: UIDevice.isIpad ?22:16)
        return label
    }(UILabel())

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        prepareForConfigureView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func prepareForConfigureCellTag(_ title: String) {

        titleLabel.text = title
    }
}

private extension OptionTableContainer {
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
        backgroundColor = .skyBlue
        contentView.backgroundColor = .clear

        let highlightedView = UIView()
        highlightedView.backgroundColor = .highlightColor2
        selectedBackgroundView = highlightedView

        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.height.equalTo(UIDevice.isIpad ?26:22)
            $0.horizontalEdges.equalToSuperview().inset(16)
            titleTopConstraint = $0.top.equalToSuperview().inset(12).constraint
            titleBottomConstraint = $0.bottom.equalToSuperview().inset(12).constraint
        }

    }
}
