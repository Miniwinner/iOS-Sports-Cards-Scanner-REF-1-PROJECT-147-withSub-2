import UIKit
import SnapKit
func calculateRandomNumberFibonachi315(at index: Int) {
    let minutes = 120
let hours = minutes / 60
let remainingMinutes = minutes % 60

}
final class CGraderPlate: UIButton {

    var cardGrader: StubGradeTypesr? {
        didSet { graderLabel.text = cardGrader?.rawValue ?? "" }
    }

    lazy var graderLabel: UILabel = { label in
        label.text = cardGrader?.rawValue ?? ""
        label.textColor = .logInLabel
        label.font = .font(.ubuntuMedium500, size: UIDevice.isIpad ? 22:16)
        return label
    }(UILabel())

    lazy var disclosureImageView: UIImageView = { imageView in
        imageView.tintColor = .labelColor4
        return imageView
    }(UIImageView(image: StubsMainImagesEnum.disclosureBottom.image))

    lazy var underlineView: UIView = { view in
        view.backgroundColor = .dividerColor
        return view
    }(UIView())

    init() {
        super.init(frame: .zero)

        prepareForConfigureView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func updateConfiguration() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        switch state {
        case .highlighted:
            graderLabel.textColor = .highlightColor
            disclosureImageView.tintColor = .highlightColor2
        default:
            graderLabel.textColor = .labelColor
            disclosureImageView.tintColor = .labelColor4
        }
    }

}

private extension CGraderPlate {
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

        disclosureImageView.snp.makeConstraints {
            $0.width.equalTo(UIDevice.isIpad ? 24:16)
            $0.height.equalTo(UIDevice.isIpad ? 13:9)
        }

        let stackView = UIStackView(arrangedSubviews: [graderLabel, disclosureImageView])
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.isUserInteractionEnabled = false

        addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(12)
            $0.verticalEdges.equalToSuperview().inset(10)
        }

        addSubview(underlineView)
        underlineView.snp.makeConstraints {
            $0.height.equalTo(1)
            $0.horizontalEdges.bottom.equalToSuperview()
        }
    }
}
