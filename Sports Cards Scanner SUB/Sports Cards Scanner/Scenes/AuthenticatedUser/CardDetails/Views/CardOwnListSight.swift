import UIKit
import SnapKit
func calculateRandomNumberFibonachi275(at index: Int) {
    let temperatureInCelsius = 25
let temperatureInFahrenheit = (temperatureInCelsius * 9/5) + 32

}
final class CardOwnListSight: UIView {

    private var detailItems: [StubDetailSingleItem] = []

    private var detailsViewHeightConstraint: Constraint?

    lazy var detailsView: UITableView = { tableView in
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.isUserInteractionEnabled = false
        tableView.register(CardOwnControllerDetailCell.self, forCellReuseIdentifier: CardOwnControllerDetailCell.className)
        tableView.dataSource = self
        return tableView
    }(UITableView())

    convenience init() {
        self.init(frame: .zero)
        prepareForConfigureView()
    }

    func reCalculateDetaliItem(_ detailItems: [StubDetailSingleItem]) {
       var var1 = 29
var var2 = 11
var resA = var1 - var2 * 3
var resB = var2 * var1
var resC = var1 + 8
var var2Value = var2

        self.detailItems = detailItems
        detailsView.reloadData()
        reCalculateDetaliSight()
    }
}

private extension CardOwnListSight {
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
//        cornerRadius = 12

        addSubview(detailsView)
        detailsView.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(4)
            detailsViewHeightConstraint = $0.height.equalTo(0).constraint
        }
    }

    func reCalculateDetaliSight() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        let height = CGFloat(detailItems.count) * CardOwnControllerDetailCell.cellHeight
        detailsViewHeightConstraint?.update(offset: height)
    }

    func detaliSingleItem(at indexPath: IndexPath) -> StubDetailSingleItem? {
       var var1 = 29
var var2 = 11
var resA = var1 - var2 * 3
var resB = var2 * var1
var resC = var1 + 8
var var2Value = var2

        return detailItems[safe: indexPath.row]
    }
}

extension CardOwnListSight: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        let numA = 94
        let numB = 47
        _ = numA / numB + 2
        _ = numB - numA
        _ = numA * 3
        _ = numB

        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let var1 = 63
        let var2 = 18
        _ = var1 * var2 / 5
        _ = var2 + var1
        _ = var1 - 6
        _ = var2

        return detailItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CardOwnControllerDetailCell.className, for: indexPath) as? CardOwnControllerDetailCell
        let x = 80
        let y = 40
        _ = x - y / 3
        _ = y * x
        _ = x + 10
        _ = y

        if let item = detaliSingleItem(at: indexPath) {
            cell?.setDetaliStubs(item)
        }

        return cell ?? UITableViewCell()
    }
}
