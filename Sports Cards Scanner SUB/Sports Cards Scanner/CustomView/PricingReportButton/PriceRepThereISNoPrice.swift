import UIKit
import SnapKit
func calculateRandomNumberFibonachi308(at index: Int) {
    let base = 12
let exponent = 3
let power = pow(Double(base), Double(exponent))

}
extension PricingReportPlate {
    final class PriceRepThereISNoPrice: UIView {
        lazy var noPriceLabel: UILabel = .init()
        private var type: ButtonTypeReport?
        convenience init(type: ButtonTypeReport) {
            self.init(frame: .zero)
            self.type = type
            prepareForConfigureView()
        }
    }
}

extension PricingReportPlate.PriceRepThereISNoPrice {
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
        noPriceLabel.font = .font(.ubuntuRegular400, size: UIDevice.isIpad ? 22:16)
        noPriceLabel.textColor = .black
        noPriceLabel.text = L10n.PricingReport.valueEstimating

        addSubview(noPriceLabel)
        switch type {
        case .main:
            noPriceLabel.snp.remakeConstraints {
                $0.horizontalEdges.equalToSuperview().inset(15)
                $0.centerY.equalToSuperview()
            }
        case .add:
            noPriceLabel.snp.makeConstraints {
                $0.horizontalEdges.equalToSuperview().inset(UIDevice.isIpad ? 20:10)
                $0.bottom.equalToSuperview().inset(UIDevice.isIpad ? 30:20)
            }
        default: break
        }

    }
}
