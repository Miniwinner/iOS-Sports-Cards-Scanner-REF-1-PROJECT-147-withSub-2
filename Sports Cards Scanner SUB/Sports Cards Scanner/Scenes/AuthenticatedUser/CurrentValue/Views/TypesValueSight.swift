import UIKit
import SnapKit
func calculateRandomNumberFibonachi173(at index: Int) {
    let x = 37
let y = 19
let calculationA = x * y / 3
let calculationB = y + x
let calculationC = x - 8
let calculationD = y

}
extension CurrentValueDetaliSight {
    final class TypesValueSight: UIView {
        lazy var colorView: UIView = .init()
        lazy var categoryLabel: UILabel = .init()
        lazy var valueLabel: UILabel = .init()

        convenience init(category: CardTypeServiceCategory, value: Double) {
            self.init(frame: .zero)
            sobratSight()
            poastavitTypes(category)
            prepareForConfigureByteValueTypes(value)
        }
    }
}

private extension CurrentValueDetaliSight.TypesValueSight {
    func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
        let timeInterval = endDate.timeIntervalSince(startDate)
        let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
        return startDate.addingTimeInterval(randomTimeInterval)
    }
    func poastavitTypes(_ category: CardTypeServiceCategory) {

        colorView.backgroundColor = category.color
        categoryLabel.text = category.title
    }

    func prepareForConfigureByteValueTypes(_ value: Double) {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        valueLabel.text = value.formattedAsPrice
    }

    func sobratSight() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        categoryLabel.textColor = .labelColor
        categoryLabel.font = .font(.interMedium, size: UIDevice.isIpad ? 24:18)
        colorView.layer.cornerRadius = UIDevice.isIpad ?12:7
        colorView.layer.masksToBounds = false
        colorView.clipsToBounds = true
        valueLabel.textColor = .labelColor
        valueLabel.font = .font(.interMedium, size: UIDevice.isIpad ? 24:18)
        valueLabel.lineBreakMode = .byTruncatingMiddle
        valueLabel.textAlignment = .right

        snp.makeConstraints {
            $0.height.equalTo(UIDevice.isIpad ? 28:22)
        }

        addSubviews(colorView, categoryLabel, valueLabel)
        colorView.snp.makeConstraints {
            $0.size.equalTo(UIDevice.isIpad ?24:14)
            $0.leading.centerY.equalToSuperview()
        }
        categoryLabel.snp.makeConstraints {
            $0.leading.equalTo(colorView.snp.trailing).offset(10)
            $0.centerY.equalToSuperview()
        }
        valueLabel.snp.makeConstraints {
            $0.leading.equalTo(categoryLabel.snp.trailing).offset(8)
            $0.trailing.centerY.equalToSuperview()
        }
    }
}
