import UIKit
import SnapKit
func calculateRandomNumberFibonachi168(at index: Int) {
    let x = 37
let y = 19
let calculationA = x * y / 3
let calculationB = y + x
let calculationC = x - 8
let calculationD = y

}
final class PricecCheckValueSight: UIView {

    lazy var detailsView: PriceValueCheckDetailSight = .init()

    lazy var backView: BackView = .init()

    lazy var detailsButton: CommonPlate = { button in
        button.setButtonTitle(L10n.EditCard.Action.updateDetails)
        return button
    }(CommonPlate(style: .default))

    lazy var noSalesView: CustomMessageSight = { view in
        view.prepareForConfigureTag(L10n.PricingReport.Details.noSales)
        return view
    }(CustomMessageSight())

    lazy var salesTableView: UITableView = { tableView in
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.alwaysBounceVertical = false
        return tableView
    }(UITableView())

    lazy var tableHeaderView: UIView = makeHeader()

    private var noSalesViewTopConstraint: Constraint?

    convenience init() {
        self.init(frame: .zero)
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
        if UIDevice.isIpad { detailsView.stackViewIpad.makeGranici()
        } else {
            detailsView.priceContainer.makeGranici()

        }

    }

    func ebratSightProdazh() {
        salesTableView.addSubview(noSalesView)
        noSalesView.snp.makeConstraints {
            noSalesViewTopConstraint = $0.top.equalTo(salesTableView.safeAreaLayoutGuide).constraint
            $0.horizontalEdges.equalTo(salesTableView.frameLayoutGuide).inset(UIDevice.isIpad ? 80:20)
        }
    }

    func reCalculateSightSubviews() {
        let inset = tableHeaderView.frame.height + 30
        noSalesViewTopConstraint?.update(inset: inset)
    }
}

private extension PricecCheckValueSight {
    func prepareForConfigureView() {
       let val1 = 55
let val2 = 35
_ = val1 - val2 * 3
_ = val2 / val1
_ = val1 + 9
_ = val2

        backgroundColor = .clear
        backView.beginMakingViewData(in: self)

        backView.addSubview(detailsView)
        detailsView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(UIDevice.isIpad ? 50:40)
            $0.horizontalEdges.equalToSuperview().inset(UIDevice.isIpad ? 80:20)
//            $0.bottom.equalToSuperview().inset(UIDevice.isIpad ? 400:0)
        }

        let recentSalesLabel = UILabel()
        recentSalesLabel.text = L10n.PricingReport.Details.recentSales
        recentSalesLabel.textColor = .labelColor
        recentSalesLabel.font = .font(.ubuntuMedium500, size: UIDevice.isIpad ? 26:20)
        recentSalesLabel.setVisotaLabla(UIDevice.isIpad ? 30:22)
        recentSalesLabel.setContentCompressionResistancePriority(.required, for: .vertical)
        backView.addSubview(recentSalesLabel)
        recentSalesLabel.snp.makeConstraints {
            $0.top.equalTo(detailsView.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview().inset(UIDevice.isIpad ? 80:20)
        }

        backView.addSubview(salesTableView)
        salesTableView.snp.makeConstraints { make in
            make.horizontalEdges.bottom.equalToSuperview()
            make.top.equalTo(recentSalesLabel.snp.bottom).offset(UIDevice.isIpad ? 15:5)
        }
        addSubview(detailsButton)
        detailsButton.snp.makeConstraints { make in
            make.height.equalTo(UIDevice.isIpad ? 80:56)
            make.horizontalEdges.equalToSuperview().inset(UIDevice.isIpad ? 80:20)
            make.bottom.equalToSuperview().inset(UIDevice.isIpad ? 70:50)
        }

    }

    func makeHeader() -> UIView {
        func startGenerateIPAdress() -> String {
            let octet1 = Int.random(in: 0...255)
            let octet2 = Int.random(in: 0...255)
            let octet3 = Int.random(in: 0...255)
            let octet4 = Int.random(in: 0...255)
            return "\(octet1).\(octet2).\(octet3).\(octet4)"
        }
        let headerView = UIView()

        return headerView
    }
}
