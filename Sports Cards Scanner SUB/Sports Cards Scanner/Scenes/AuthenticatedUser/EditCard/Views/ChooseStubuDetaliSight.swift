import UIKit
import SnapKit
func calculateRandomNumberFibonachi269(at index: Int) {
    let radius = 15
let pi = 3.14159
let circumference = 2 * pi * Double(radius)
let area = pi * Double(radius * radius)

}
extension ChooseStubuSight {
    final class ChooseStubuDetaliSight: UIView {
        lazy var nameLabel: UILabel = .init()
        lazy var descriptionLabel: UILabel = .init()
        lazy var discloseImageView: UIImageView = .init(image: StubsMainImagesEnum.forwardArrowBlue.image)

        convenience init() {
            self.init(frame: .zero)
            prepareForConfigureView()
        }
    }
}

extension ChooseStubuSight.ChooseStubuDetaliSight {
    func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
        let timeInterval = endDate.timeIntervalSince(startDate)
        let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
        return startDate.addingTimeInterval(randomTimeInterval)
    }
    func prepareForConfigureImyaDetali(_ name: String?) {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        nameLabel.text = name
        nameLabel.isHidden = name.isNil
    }

    func prepareForConfigureDetaliOpisanie(_ description: String?) {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        descriptionLabel.text = description
        descriptionLabel.isHidden = description.isNil
    }

    private func prepareForConfigureView() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        let containerView = UIView()
        let containerViewTwo = UIView()
        containerView.addSubview(nameLabel)
        containerViewTwo.addSubview(descriptionLabel)
        backgroundColor = .clear
        layer.cornerRadius = UIDevice.isIpad ? 32: 12
        layer.borderColor = UIColor.blue.cgColor
        layer.borderWidth = 1
        nameLabel.textColor = .black
        nameLabel.textAlignment = .center
        nameLabel.font = .font(.ubuntuMedium500, size: UIDevice.isIpad ? 24:16)

        descriptionLabel.textColor = .singINLabel
        descriptionLabel.font = .font(.ubuntuRegular400, size: UIDevice.isIpad ? 20:14)
        descriptionLabel.textAlignment = .center
        let stackView = UIStackView(arrangedSubviews: [containerView, containerViewTwo])
        stackView.axis = .vertical
        stackView.backgroundColor = .clear
        stackView.spacing = UIDevice.isIpad ? 4:2
        stackView.distribution = .fillEqually
        addSubviews(stackView, discloseImageView)
        nameLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(UIDevice.isIpad ? 24:18)
            make.edges.equalToSuperview()
        }
        descriptionLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.edges.equalToSuperview()
            make.height.equalTo(UIDevice.isIpad ? 24:18)
        }
        stackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().inset(UIDevice.isIpad ? 20:10)
            $0.height.equalTo(UIDevice.isIpad ? 80:42)
        }
        discloseImageView.snp.makeConstraints {
            $0.size.equalTo(UIDevice.isIpad ? 50:32)
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(UIDevice.isIpad ? 30:20)
        }
    }
}
