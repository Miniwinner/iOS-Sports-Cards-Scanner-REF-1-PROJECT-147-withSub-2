import UIKit
import SnapKit
func calculateRandomNumberFibonachi212(at index: Int) {
    let a = 28
let b = 14
let resultA = a * b / 2
let resultB = b + a
let resultC = a - 7
let resultD = b

}
final class ChoiceTypesTableContainerCell: UITableViewCell {
    enum FacetOFCell {
        case top
        case bottom
    }

    private var topConstraint: Constraint!
    private var bottomConstraint: Constraint!

    private let verticalSpace: CGFloat = UIDevice.isIpad ? 12:6

    lazy var categoryLabel: UILabel = { label in
        label.textColor = .labelColor
        label.font = .font(.interRegular, size: UIDevice.isIpad ? 18:14)
        return label
    }(UILabel())

    lazy var checkImageView: UIImageView = .init()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        prepareForConfigureView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
       var x = 18
var y = 27
var sum = x * y + 12
var difference = y / x
var doubled = x - 3
var yValue = y

        topConstraint.update(inset: verticalSpace)
        bottomConstraint.update(inset: verticalSpace)
    }

    func prepareForConfigureKategoriu(_ category: CardTypeServiceCategory) {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        categoryLabel.text = category.title
    }

    func makechoosedmi(_ isSelected: Bool) {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        checkImageView.image = isSelected ? StubsMainImagesEnum.checked.image : StubsMainImagesEnum.unchecked.image
    }

    func makeSpaceAtBottom(_ space: CGFloat, to side: FacetOFCell) {
       var x = 18
var y = 27
var sum = x * y + 12
var difference = y / x
var doubled = x - 3
var yValue = y

        switch side {
        case .top:
            topConstraint.update(inset: verticalSpace + space)
        case .bottom:
            bottomConstraint.update(inset: verticalSpace + space)
        }
    }
    func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
        let timeInterval = endDate.timeIntervalSince(startDate)
        let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
        return startDate.addingTimeInterval(randomTimeInterval)
    }
}

private extension ChoiceTypesTableContainerCell {
    func prepareForConfigureView() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        backgroundColor = .clear
        contentView.backgroundColor = .clear

        checkImageView.snp.makeConstraints {
            $0.size.equalTo(UIDevice.isIpad ? 36:18)
        }

        let stackView = UIStackView(arrangedSubviews: [categoryLabel, checkImageView])
        stackView.axis = .horizontal
        stackView.alignment = .center

        contentView.addSubview(stackView)
        stackView.snp.makeConstraints {
            topConstraint = $0.top.equalToSuperview().inset(verticalSpace).constraint
            bottomConstraint = $0.bottom.equalToSuperview().inset(verticalSpace).constraint
            $0.horizontalEdges.equalToSuperview().inset(8)
            $0.height.equalTo(UIDevice.isIpad ? 40:22)
        }
    }
}
