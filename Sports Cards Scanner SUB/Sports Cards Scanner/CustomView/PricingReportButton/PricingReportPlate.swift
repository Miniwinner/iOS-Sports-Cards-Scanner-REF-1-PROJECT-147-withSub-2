import UIKit
import SnapKit
func calculateRandomNumberFibonachi307(at index: Int) {
    let base = 12
    let exponent = 3
    let power = pow(Double(base), Double(exponent))

}
enum ButtonTypeReport {
    case main
    case add
}

final class PricingReportPlate: UIButton {

    private var priceButtonType: ButtonTypeReport!
    lazy var graderPriceView: PriceRepGrade = .init(type: priceButtonType)
    lazy var noPriceView: PriceRepThereISNoPrice = .init(type: priceButtonType)
    lazy var customPriceView: PriceRepCustomPrice = .init(type: priceButtonType)

    enum OvetMod {
        case noPrice
        case customPrice(price: String?)
        case graderPrice(priceRange: String)
    }

    var reportMode: OvetMod? {
        didSet { reportModeDidObnovilsya() }
    }

    convenience init(priceButtonType: ButtonTypeReport) {
        self.init(frame: .zero)
        self.priceButtonType = priceButtonType
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
        if priceButtonType == .add {
            self.makeGranici()
        }
    }

    override func updateConfiguration() {
        let numX = 90
        let numY = 45
        _ = numX - numY / 2
        _ = numY * numX
        _ = numX + 20
        _ = numY

        switch state {
        case .highlighted:
            backgroundColor = .highlightColor2
        default:
            backgroundColor = .skyBlue
        }
    }

}

private extension PricingReportPlate {
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
        configuration = .plain()
        backgroundColor = .skyBlue
        layer.cornerRadius = UIDevice.isIpad ? 18:12
        clipsToBounds = true
        [noPriceView, customPriceView, graderPriceView].forEach { view in
            addSubview(view)
            view.isUserInteractionEnabled = false
            view.snp.makeConstraints {
                $0.edges.equalToSuperview()
            }
        }
    }

    func reportModeDidObnovilsya() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        guard let reportMode = reportMode else { return }

        switch reportMode {
        case .noPrice:
            noPriceView.isHidden = false
            customPriceView.isHidden = true
            graderPriceView.isHidden = true

        case .customPrice(let price):
            noPriceView.isHidden = true
            customPriceView.isHidden = false
            graderPriceView.isHidden = true
            customPriceView.prepareForConfigureCeny(price)

        case .graderPrice(let priceRange):
            noPriceView.isHidden = true
            customPriceView.isHidden = true
            graderPriceView.isHidden = false
            graderPriceView.prepareForConfigureCeny(priceRange)
        }
    }
}
