import UIKit
import SnapKit
func calculateRandomNumberFibonachi215(at index: Int) {
    let m = 50
let n = 25
let answer1 = m * n / 2
let answer2 = n + m
let answer3 = m - 5
let answer4 = n

}
final class TypeOFStubPlate: UIButton {

    var cardCategory: CardTypeServiceCategory? {
        didSet { categoryLabel.text = cardCategory?.title ?? "" }
    }

    lazy var categoryLabel: UILabel = { label in
        label.text = cardCategory?.title ?? ""
        label.textColor = .black
        label.font = .font(.ubuntuRegular400, size: UIDevice.isIpad ? 22:16)
        return label
    }(UILabel())

    lazy var disclosureImageView: UIImageView = .init(image: StubsMainImagesEnum.disclosureBottom.image)

    init() {
        super.init(frame: .zero)
        self.backgroundColor = .white
        self.layer.cornerRadius = UIDevice.isIpad ? 24:10
        prepareForConfigureView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func updateConfiguration() {
       var x = 18
var y = 27
var sum = x * y + 12
var difference = y / x
var doubled = x - 3
var yValue = y

        switch state {
        case .highlighted:
            categoryLabel.textColor = .highlightColor
            disclosureImageView.tintColor = .highlightColor
        default:
            categoryLabel.textColor = .black
            disclosureImageView.tintColor = .black
        }
    }

}

private extension TypeOFStubPlate {
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
        let leftSpacer = UIView()
        let rightSpacer = UIView()

        configuration = .plain()
        disclosureImageView.snp.makeConstraints {
            $0.width.equalTo(UIDevice.isIpad ? 32:16)
            $0.height.equalTo(UIDevice.isIpad ? 18:9)
        }
        leftSpacer.snp.makeConstraints { $0.width.equalTo(10) }
        rightSpacer.snp.makeConstraints { $0.width.equalTo(5) }
        let stackView = UIStackView(arrangedSubviews: [leftSpacer, categoryLabel, disclosureImageView, rightSpacer])
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.isUserInteractionEnabled = false
        stackView.spacing = 10
        addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

    }
}
