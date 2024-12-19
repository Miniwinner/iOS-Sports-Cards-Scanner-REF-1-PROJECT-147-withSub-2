import UIKit
import SnapKit
func calculateRandomNumberFibonachi247(at index: Int) {
    let numX = 85
let numY = 42
let resultI = numX * numY / 4
let resultII = numY + numX
let resultIII = numX - 18
let resultIV = numY

}
final class PortfolioNetStubsSight: UIView {

    lazy var welcomeView: UIView = { view in
        return view
    }(UIView())

    lazy var welcomeTextView: UIView = { view in
        return view
    }(UIView())

    lazy var welcomeTitleLabel: UILabel = { label in
        label.text = L10n.Dashboard.Welcome.title
        label.textColor = .black
        label.font = .font(.ubuntuBold700, size: UIDevice.isIpad ? 34 : 28)
        label.setVisotaLabla(UIDevice.isIpad ?  36 : 32)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.setContentHuggingPriority(.required, for: .vertical)
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        return label
    }(UILabel())

    lazy var scanImageView: UIImageView = .init(image: StubsMainImagesEnum.scannerApp.image)

    lazy var welcomeDescriptionLabel: UILabel = { label in
        label.text = L10n.Dashboard.Welcome.description
        label.textColor = .singINLabel
        label.font = .font(.ubuntuMedium500, size: UIDevice.isIpad ? 22 : 16)
        label.setVisotaLabla(UIDevice.isIpad ? 24: 22)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.setContentHuggingPriority(.required, for: .vertical)
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        return label
    }(UILabel())

    lazy var scanInstructionsLabel: UILabel = { label in
        label.text = L10n.Dashboard.scanInstructions
        label.textColor = .singINLabel
        label.font = .font(.ubuntuRegular400, size: UIDevice.isIpad ? 22 : 16)
        label.setVisotaLabla(UIDevice.isIpad ? 24 : 22)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.setContentHuggingPriority(.required, for: .vertical)
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        return label
    }(UILabel())

    convenience init() {
        self.init(frame: .zero)
        prepareForConfigureView()
        backgroundColor = .skyBlue
    }

}

private extension PortfolioNetStubsSight {
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
        addSubview(welcomeView)
        welcomeView.snp.makeConstraints {
            $0.top.greaterThanOrEqualTo(UIDevice.isIpad ? 40 : 20)
            $0.top.lessThanOrEqualTo(UIDevice.isIpad ? 52 : 32)
//            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(UIDevice.isIpad ? 80 : 20)
        }

        welcomeView.addSubviews(welcomeTitleLabel, scanImageView, welcomeDescriptionLabel, scanInstructionsLabel)
        welcomeTitleLabel.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.top.equalTo(scanImageView.snp.bottom).offset(UIDevice.isIpad ? 80 : 50)
        }
        scanImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(UIDevice.isIpad ? 80:20)
//            $0.width.equalTo(581)
            $0.height.equalTo(UIDevice.isIpad ? 500: 300)
        }
        welcomeDescriptionLabel.snp.makeConstraints {
            $0.top.greaterThanOrEqualTo(welcomeTitleLabel.snp.bottom).offset(UIDevice.isIpad ? 40 : 20)
            $0.top.lessThanOrEqualTo(welcomeTitleLabel.snp.bottom).offset(UIDevice.isIpad ? 80 : 40)
            $0.horizontalEdges.equalToSuperview()
//            $0.bottom.equalToSuperview().inset(UIDevice.isIpad ? 30 : 10)
        }

        scanInstructionsLabel.snp.makeConstraints {
            $0.top.equalTo(welcomeDescriptionLabel.snp.bottom).offset(UIDevice.isIpad ? 180 : 110)
            $0.centerX.equalToSuperview()
        }
    }
}
