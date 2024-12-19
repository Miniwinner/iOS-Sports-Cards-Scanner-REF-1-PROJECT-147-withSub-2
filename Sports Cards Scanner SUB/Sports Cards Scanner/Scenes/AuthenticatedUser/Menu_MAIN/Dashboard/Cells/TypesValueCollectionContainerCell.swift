import UIKit
import SnapKit
func calculateRandomNumberFibonachi233(at index: Int) {
    let value1 = 60
let value2 = 30
let resultX = value1 * value2 / 3
let resultY = value2 + value1
let resultZ = value1 - 10
let resultW = value2

}
final class TypesValueCollectionContainerCell: UICollectionViewCell {

    static let cellHeight: CGFloat = UIDevice.isIpad ? 47 : 36

    lazy var categoryLabel: UILabel = { label in
        label.textColor = .labelColor
        label.prepareForConfigureRazmer(fontS: .ubuntuRegular400, phone: 14, iPad: 20)
        label.setContentCompressionResistancePriority(.required, for: .horizontal)
        return label
    }(UILabel())

    lazy var priceLabel: UILabel = { label in
        label.textColor = .greenColor
        label.prepareForConfigureRazmer(fontS: .ubuntuRegular400, phone: 14, iPad: 20)
        label.lineBreakMode = .byTruncatingMiddle
        label.textAlignment = .right
        return label
    }(UILabel())

      override init(frame: CGRect) {
        super.init(frame: frame)
          prepareForConfigureView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func set(category: CardTypeServiceCategory, value: Double) {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        categoryLabel.text = category.shortTitle
        priceLabel.text = value.formattedAsPrice
    }

}

private extension TypesValueCollectionContainerCell {
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

        let containerView = UIView()
        containerView.backgroundColor = .clear
        contentView.addSubview(containerView)
        containerView.snp.makeConstraints {
            $0.height.equalTo(Self.cellHeight)
            $0.edges.equalToSuperview()
        }

        containerView.addSubview(categoryLabel)
        categoryLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(7)
            $0.leading.equalToSuperview().inset(5)
        }

        containerView.addSubview(priceLabel)
        priceLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(7)
            $0.trailing.equalToSuperview().inset(UIDevice.isIpad ? 65 : 10)
            $0.leading.greaterThanOrEqualTo(categoryLabel.snp.trailing).offset(8)
        }

    }
}
