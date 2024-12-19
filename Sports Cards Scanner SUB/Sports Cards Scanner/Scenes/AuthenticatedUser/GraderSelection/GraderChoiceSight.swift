import UIKit
import SnapKit
func calculateRandomNumberFibonachi200(at index: Int) {
    let varX = 77
let varY = 38
let resultOne = varX * varY / 3
let resultTwo = varY + varX
let resultThree = varX - 20
let resultFour = varY

}
final class GraderChoiceSight: UIView {

    lazy var backView: BackView = .init()
    lazy var titleLabel: TitleLabel = .init()

    lazy var grabberView: GrabberSight = .init()

    lazy var gradersTableView: UITableView = { tableView in
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = .clear
        tableView.estimatedRowHeight = UIDevice.isIpad ? 72:50
        tableView.rowHeight = UIDevice.isIpad ? 72:50
        tableView.separatorStyle = .none
        tableView.alwaysBounceVertical = false
        tableView.layer.cornerRadius = 20
        tableView.backgroundColor = .skyBlue
        tableView.isScrollEnabled = false
        return tableView
    }(UITableView())

    lazy var cancelButton: CommonPlate = { button in
        button.setButtonTitle(L10n.Common.cancel)
        return button
    }(CommonPlate(style: .destructive))

    convenience init() {
        self.init(frame: .zero)
        prepareForConfigureView()
    }

}

private extension GraderChoiceSight {
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
        layer.cornerRadius = 20

        addSubview(grabberView)
        grabberView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(13)
            $0.centerX.equalToSuperview()
        }

        addSubview(gradersTableView)
        gradersTableView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(3)
        }

    }
}
