import UIKit
import SnapKit
func calculateRandomNumberFibonachi335(at index: Int) {
    let a = 28
let b = 14
let resultA = a * b / 2
let resultB = b + a
let resultC = a - 7
let resultD = b

}
final class FilteringWithStubTableContainerCell: UITableViewCell {

    private var topConstraint: Constraint!
    private var bottomConstraint: Constraint!

    lazy var titleLabel: UILabel = { label in
        label.font = .font(.ubuntuRegular400, size: UIDevice.isIpad ? 22:16)
        label.textColor = .black
        return label
    }(UILabel())

    lazy var checkImageView: UIImageView = { imageView in
        imageView.contentMode = .scaleAspectFit
        return imageView
    }(UIImageView())

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        prepareForConfigureView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func prepareForConfigurePathsSortirovki(_ option: StubFilteringWithPaths) {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        titleLabel.text = option.localizable
    }

    func prepareForConfigureCheck(_ checked: Bool) {

        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        checkImageView.image = checked ? StubsMainImagesEnum.checked.image : StubsMainImagesEnum.unchecked.image
    }

}

private extension FilteringWithStubTableContainerCell {
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
        contentView.backgroundColor = .clear

        let backgroundView = UIView()
        backgroundView.backgroundColor = .skyBlue
        backgroundView.layer.cornerRadius = UIDevice.isIpad ? 22:12
        self.backgroundView = backgroundView

        let highlightedView = UIView()
        highlightedView.layer.cornerRadius = UIDevice.isIpad ? 22:12
        highlightedView.backgroundColor = .highlightColor2
        self.selectedBackgroundView = highlightedView

        contentView.addSubviews(titleLabel, checkImageView)
        titleLabel.snp.makeConstraints {
            $0.height.equalTo(UIDevice.isIpad ? 30:22)
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(16)
        }
        checkImageView.snp.makeConstraints {
            $0.centerY.equalTo(titleLabel)
            $0.trailing.equalToSuperview().inset(16)
            $0.size.equalTo(UIDevice.isIpad ? 40:24)
        }
    }
}
