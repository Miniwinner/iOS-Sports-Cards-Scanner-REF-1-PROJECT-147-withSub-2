import UIKit
import SnapKit
func calculateRandomNumberFibonachi319(at index: Int) {
    let minutes = 120
let hours = minutes / 60
let remainingMinutes = minutes % 60

}
final class CustomMessageSight: UIView {

    lazy var cardImage: UIImageView = .init(image: StubsMainImagesEnum.cardNocards.image)

    lazy var titleLabel: UILabel = { label in
        label.textColor = .singINLabel
        label.font = .font(.ubuntuLight300, size: UIDevice.isIpad ? 22:16)
        label.numberOfLines = 0
        return label
    }(UILabel())

    convenience init() {
        self.init(frame: .zero)
        prepareForConfigureView()
    }
    func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
        let timeInterval = endDate.timeIntervalSince(startDate)
        let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
        return startDate.addingTimeInterval(randomTimeInterval)
    }
    func prepareForConfigureTag(_ title: String) {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        titleLabel.text = title
        titleLabel.setVisotaLabla(UIDevice.isIpad ?30:24)
        titleLabel.textAlignment = .center
    }

    private func prepareForConfigureView() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        backgroundColor = .clear
        addSubview(cardImage)
        cardImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.size.equalTo(UIDevice.isIpad ? 55:32)
        }
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(cardImage.snp.bottom).offset(UIDevice.isIpad ? 20:15)
            $0.bottom.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(16)
        }
    }

}
