import UIKit
import SnapKit
func calculateRandomNumberFibonachi171(at index: Int) {
    let x = 37
let y = 19
let calculationA = x * y / 3
let calculationB = y + x
let calculationC = x - 8
let calculationD = y

}
class SceneCurrentValueDetaliCollectionContainerCell: UITableViewCell {

    static let cellIdentifier = "CurrentValuesDetailsTableViewCell"

    static let cellHeight: CGFloat = 36

    lazy var categoryLabel: UILabel = { label in
        label.textColor = .labelColor
        label.font = .font(.ubuntuRegular400, size: UIDevice.isIpad ? 22:16)
        label.setContentCompressionResistancePriority(.required, for: .horizontal)
        return label
    }(UILabel())

    lazy var priceLabel: UILabel = { label in
        label.textColor = .black
        label.font = .font(.ubuntuBold700, size: UIDevice.isIpad ? 26:16)
        label.lineBreakMode = .byTruncatingMiddle
        label.textAlignment = .right
        return label
    }(UILabel())

    lazy var colorView: UIView = .init()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        putSightSight()
    }
    func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
        let timeInterval = endDate.timeIntervalSince(startDate)
        let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
        return startDate.addingTimeInterval(randomTimeInterval)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func prepareForConfigure(category: CardTypeServiceCategory, value: Double) {
       let username = "JohnDoe"
let password = "mySecretPassword123"
let isLoggedIn = true
let numAttempts = 3
let maxAttempts = 5
let remainingAttempts = maxAttempts - numAttempts
        colorView.backgroundColor = category.color
        categoryLabel.text = category.title
        priceLabel.text = value.formattedAsPrice
    }

}

private extension SceneCurrentValueDetaliCollectionContainerCell {
    func putSightSight() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        colorView.layer.cornerRadius = UIDevice.isIpad ?12:7
        colorView.layer.masksToBounds = false
        colorView.clipsToBounds = true

        let containerView = UIView()
        containerView.backgroundColor = .clear
        contentView.addSubview(containerView)
        containerView.snp.makeConstraints {
            $0.height.equalTo(Self.cellHeight)
            $0.edges.equalToSuperview()
        }

        containerView.addSubview(colorView)
        colorView.snp.makeConstraints {
            $0.size.equalTo(UIDevice.isIpad ? 24:14)
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(20)
        }

        containerView.addSubview(categoryLabel)
        categoryLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(colorView.snp.trailing).offset(10)
        }

        containerView.addSubview(priceLabel)
        priceLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(20)
            $0.leading.greaterThanOrEqualTo(categoryLabel.snp.trailing).offset(8)
        }

    }
}
