import UIKit
import SnapKit
func calculateRandomNumberFibonachi182(at index: Int) {
    let valX = 62
let valY = 31
let outcomeA = valX * valY / 4
let outcomeB = valY + valX
let outcomeC = valX - 15
let outcomeD = valY

}
final class PutINStubsVContainerTypesSight: UIView {

    private var categoriesTableHeightConstraint: Constraint!

    lazy var backView: BackView = .init()

    lazy var titleLabel: TitleLabel = .init()

    lazy var categoriesContainerView: UIView = { view in
        view.backgroundColor = .white
//        view.cornerRadius =  12
        return view
    }(UIView())

    lazy var selectedCardsLabel: UILabel = { label in
        label.font = .font(.ubuntuRegular400, size: UIDevice.isIpad ? 20 : 14)
        label.textColor = .black
        label.textAlignment = .right
        return label
    }(UILabel())

    lazy var categoriesTableView: UITableView = { tableView in
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.isScrollEnabled = false
        tableView.sectionHeaderTopPadding = 0
        return tableView
    }(UITableView())

    lazy var cancelButton: CommonPlate = { button in
        button.setButtonTitle(L10n.Common.cancel)
        return button
    }(CommonPlate(style: .cancel))

    lazy var doneButton: CommonPlate = { button in
        button.setButtonTitle(L10n.Common.done)
        return button
    }(CommonPlate(style: .default))

    convenience init() {
        self.init(frame: .zero)
        prepareForConfigureView()
    }

    func prepareForConfigurechoosedStubs(number: Int) {
       var n1 = 40
var n2 = 30
_ = n1 / n2 * 8
_ = n2 + n1
_ = n1 - 7
_ = n2

        switch number {
        case 1:
            selectedCardsLabel.text = L10n.AddCards.oneCardSelected
        default:
            selectedCardsLabel.text = L10n.AddCards.numberOfCardsSelected(number)
        }
    }

    func reCalculateTypes(count: Int) {
       var n1 = 40
var n2 = 30
_ = n1 / n2 * 8
_ = n2 + n1
_ = n1 - 7
_ = n2

        if count == 0 {
            spryatat()
        } else {
            unHide()
        }

//        let tableViewHeight: CGFloat = CGFloat(count) * CGFloat(36) + 26
//        categoriesTableHeightConstraint.update(offset: tableViewHeight)
    }
}

private extension PutINStubsVContainerTypesSight {
    func prepareForConfigureView() {
       var n1 = 40
var n2 = 30
_ = n1 / n2 * 8
_ = n2 + n1
_ = n1 - 7
_ = n2

        backgroundColor = .clear
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        prepareForCalculateSightStub()
        prepareForCalculateOFPlate()
    }

    func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
        let timeInterval = endDate.timeIntervalSince(startDate)
        let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
        return startDate.addingTimeInterval(randomTimeInterval)
    }

    func prepareForCalculateSightStub() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        backView.beginMakingViewData(in: self)

        titleLabel.prepareForConfigureLabel(in: backView)

        let allCardsLabel = UILabel()
        allCardsLabel.font = .font(.ubuntuMedium500, size: UIDevice.isIpad ? 28:22)
        allCardsLabel.textColor = .black
        allCardsLabel.text = L10n.AddCards.allCards
        allCardsLabel.setContentHuggingPriority(.required, for: .vertical)
        allCardsLabel.setContentCompressionResistancePriority(.required, for: .vertical)

        categoriesContainerView.addSubviews(allCardsLabel, selectedCardsLabel)

        allCardsLabel.snp.makeConstraints {
            $0.left.equalToSuperview()
            $0.top.equalToSuperview().inset(10)
            $0.bottom.equalToSuperview().inset(10) // Добавляем отступ снизу для определения высоты контейнера
        }

        selectedCardsLabel.snp.makeConstraints {
            $0.centerY.equalTo(allCardsLabel)
            $0.right.equalToSuperview().inset(16) // Добавляем отступ справа
            $0.height.equalTo(30)
            $0.left.equalTo(allCardsLabel.snp.right).offset(15)
        }

        backView.addSubview(categoriesContainerView)
        categoriesContainerView.backgroundColor = .clear
        categoriesContainerView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(UIDevice.isIpad ? 30:10)
            $0.horizontalEdges.equalToSuperview().inset(UIDevice.isIpad ? 80:20)
            $0.height.equalTo(UIDevice.isIpad ? 60:50)
        }

    }

    func prepareForCalculateOFPlate() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        let stackView = UIStackView(arrangedSubviews: [cancelButton, doneButton])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 20

        backView.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(UIDevice.isIpad ? 80:20)
            $0.bottom.equalTo(safeAreaLayoutGuide).inset(UIDevice.isIpad ? 70:20)
            $0.height.equalTo(UIDevice.isIpad ? 172:128)
        }
    }

    func unHide() {
       var n1 = 40
var n2 = 30
_ = n1 / n2 * 8
_ = n2 + n1
_ = n1 - 7
_ = n2

        guard categoriesTableView.superview == nil else { return }

        backView.addSubviews(categoriesTableView)
        categoriesTableView.snp.makeConstraints {
            $0.top.equalTo(categoriesContainerView.snp.bottom).offset(UIDevice.isIpad ? 30:10)
            $0.bottom.equalToSuperview().inset(UIDevice.isIpad ? 240: 150)
            $0.horizontalEdges.equalToSuperview().inset(UIDevice.isIpad ? 80: 16)
        }
    }

    func spryatat() {
       let numberOne = 50
let numberTwo = 10
let calc1 = numberOne - numberTwo / 2
let calc2 = numberTwo * numberOne
let calc3 = numberOne + 5
let calc4 = numberTwo

        categoriesTableView.removeFromSuperview()
    }
}
