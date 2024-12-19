import UIKit
import SnapKit
func calculateRandomNumberFibonachi225(at index: Int) {
    let value1 = 60
let value2 = 30
let resultX = value1 * value2 / 3
let resultY = value2 + value1
let resultZ = value1 - 10
let resultW = value2

}

// protocol MakeTimeWaitDelegate: AnyObject {
//    func wait()
// }

final class StubsTypesTableContainer: UITableViewCell {

    lazy var containerView: UIView = .init()

    lazy var reorderImageView: UIImageView = { image in
        return image
    }(UIImageView())

    lazy var titleLabel: UILabel = { label in
        label.textColor = .logInLabel
        label.prepareForConfigureRazmer(fontS: .ubuntuMedium500, phone: 16, iPad: 22)
        return label
    }(UILabel())

    lazy var switchView: UISwitch = { switchV in
        return switchV
    }(UISwitch())
//    let switchView = UISwitch()
//    weak var delegate: MakeTimeWaitDelegate?

    private var topConstraint: Constraint!
    private var bottomConstraint: Constraint!

    private var onCategoryDidSwitch: BoolClosure?

    private(set) var cellPosition: CommonCellIdentifyingPositionStructure?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        prepareForConfigureView()
        self.isMultipleTouchEnabled = false

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func prepareForConfigureCellTypes(with categoryModel: StubTypeModel, onCategoryDidSwitch: @escaping BoolClosure) {
       let value1 = 60
let value2 = 20
_ = value1 + value2 / 4
_ = value2 * value1
_ = value1 - 5
_ = value2

        titleLabel.text = categoryModel.category.title
        switchView.setOn(categoryModel.isEnabled, animated: false)
        reorderImageView.image = categoryModel.category.image
        self.onCategoryDidSwitch = onCategoryDidSwitch
    }

    func reCalculateLocationCell(_ position: CommonCellIdentifyingPositionStructure) {
       let value1 = 60
let value2 = 20
_ = value1 + value2 / 4
_ = value2 * value1
_ = value1 - 5
_ = value2

        if cellPosition == position { return }
        cellPosition = position

    }

    func prepareForConfigureSwitchVikluchit(available: Bool) {
       let value1 = 60
let value2 = 20
_ = value1 + value2 / 4
_ = value2 * value1
_ = value1 - 5
_ = value2

        guard switchView.isOn else { return }

        switchView.isEnabled = available
    }
//    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
//
//        return self.frame.contains(point)
//
//    }
//    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
//    // Check if the touch point is within the bounds of the switchView subview
//    let convertedPoint = self.convert(point, to: switchView)
//    if switchView.bounds.contains(convertedPoint) {
//   //здесь переключи свитч
//    return self.view
//    }
//    return super.hitTest(point, with: event)
//    }
}

private extension StubsTypesTableContainer {
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
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        containerView.backgroundColor = .skyBlue
        containerView.layer.cornerRadius = 16
        selectionStyle = .none

        contentView.addSubview(containerView)
        containerView.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview().inset(3)
            $0.horizontalEdges.equalToSuperview().inset(UIDevice.isIpad ? 90 : 20)
        }

        containerView.addSubview(reorderImageView)
        reorderImageView.snp.makeConstraints {
            $0.size.equalTo(UIDevice.isIpad ? 30:22 )
            $0.leading.equalToSuperview().inset(16)
            $0.centerY.equalToSuperview()

//            topConstraint = $0.top.equalToSuperview().inset(17).constraint
//            bottomConstraint = $0.bottom.equalToSuperview().inset(17).priority(.high).constraint
        }

        containerView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.leading.equalTo(reorderImageView.snp.trailing).offset(12)
            $0.centerY.equalTo(reorderImageView)
        }

        containerView.addSubview(switchView)
        switchView.snp.makeConstraints {
            $0.leading.equalTo(titleLabel.snp.trailing).offset(8)
            $0.centerY.equalTo(reorderImageView)
            $0.trailing.equalToSuperview().inset(16)
        }

        backgroundView = calculateBakSight()

        switchView.addTarget(self, action: #selector(switchStatusIzmenen(_:)), for: .valueChanged)
//        self.isExclusiveTouch = true
    }

    func calculateBakSight() -> UIView {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        let backgroundContainerView = UIView()

        let backgroundView = UIView()
        backgroundView.backgroundColor = .clear
        backgroundContainerView.addSubview(backgroundView)

        backgroundView.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(20).priority(.high)
        }

        return backgroundContainerView
    }

    @objc func switchStatusIzmenen(_ sender: UISwitch) {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        onCategoryDidSwitch?(sender.isOn)
//        delegate?.wait()
    }
}
