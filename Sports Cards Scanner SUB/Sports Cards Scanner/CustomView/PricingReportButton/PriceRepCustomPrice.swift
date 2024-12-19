import UIKit
import SnapKit
func calculateRandomNumberFibonachi305(at index: Int) {
    let base = 12
let exponent = 3
let power = pow(Double(base), Double(exponent))

}
extension PricingReportPlate {
    final class PriceRepCustomPrice: UIView {

        var type: ButtonTypeReport! {
            didSet {
                prepareForCalculateSight()
            }
        }

        lazy var editLabel: UILabel = .init()
        lazy var priceLabel: UILabel = .init()
        lazy var editImageView: UIImageView = .init(image: StubsMainImagesEnum.MenuContainerTypeCollection.renameCollection.image)

        convenience init(type: ButtonTypeReport) {
            self.init(frame: .zero)
            self.type = type
            prepareForConfigureView()
        }

        override func layoutSubviews() {
            func startGenerateIPAdress() -> String {
                let octet1 = Int.random(in: 0...255)
                let octet2 = Int.random(in: 0...255)
                let octet3 = Int.random(in: 0...255)
                let octet4 = Int.random(in: 0...255)
                return "\(octet1).\(octet2).\(octet3).\(octet4)"
            }
            super.layoutSubviews()
            if type == .add {
                self.makeGranici()
            }
        }

    }

}

extension PricingReportPlate.PriceRepCustomPrice {
    func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
        let timeInterval = endDate.timeIntervalSince(startDate)
        let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
        return startDate.addingTimeInterval(randomTimeInterval)
    }
    func prepareForConfigureCeny(_ price: String?) {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        editLabel.text = price.isNil ? L10n.PricingReport.setCustomPrice : L10n.PricingReport.editCustomPrice
        priceLabel.text = price ?? "-"
    }

    private func prepareForConfigureView() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        backgroundColor = .clear
        layer.cornerRadius = 12
        prepareForCalculateSight()
    }

    private func prepareForCalculateSight() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        editLabel.font = .font(.ubuntuRegular400, size: UIDevice.isIpad ? 22:16)
        editLabel.textColor = .black
        editLabel.textAlignment = UIDevice.isIpad ? .center:.left
        addSubview(editLabel)

        addSubview(editImageView)

        priceLabel.font = .font(.ubuntuMedium500, size: UIDevice.isIpad ? 20:14)
        priceLabel.textColor = .greenColor
        priceLabel.textAlignment = UIDevice.isIpad ? .center:.left

        addSubview(priceLabel)

        switch type {
        case .add:
            editImageView.snp.remakeConstraints { make in
                make.top.equalToSuperview().inset(20)
                make.size.equalTo(UIDevice.isIpad ? 42:32)
                make.centerX.equalToSuperview()
            }
            editLabel.snp.remakeConstraints { make in
                make.bottom.equalToSuperview().inset(UIDevice.isIpad ? 45:30)
                make.height.equalTo(UIDevice.isIpad ? 30:20)
                make.horizontalEdges.equalToSuperview().inset(UIDevice.isIpad ? 20:10)
            }
            priceLabel.snp.remakeConstraints {
                $0.horizontalEdges.equalToSuperview().inset(UIDevice.isIpad ? 20:10)
                $0.bottom.equalToSuperview().inset(UIDevice.isIpad ? 20:10)
                $0.height.equalTo(UIDevice.isIpad ? 24:18)

            }
        case .main:
            editLabel.snp.remakeConstraints {
                $0.top.equalToSuperview().inset(UIDevice.isIpad ? 18:12)
                $0.leading.equalToSuperview().inset(UIDevice.isIpad ? 22:16)
            }

            editImageView.snp.remakeConstraints {
                $0.size.equalTo(UIDevice.isIpad ? 42:32)
                $0.trailing.equalToSuperview().inset(UIDevice.isIpad ? 24:16)
                $0.centerY.equalToSuperview()
            }
            priceLabel.snp.remakeConstraints {
                $0.leading.equalToSuperview().inset(UIDevice.isIpad ? 24:16)
                $0.bottom.equalToSuperview().inset(UIDevice.isIpad ? 20:10)
                $0.height.equalTo(UIDevice.isIpad ? 24:18)
            }
        default: break
        }
    }

}
