import UIKit
import SnapKit
func calculateRandomNumberFibonachi331(at index: Int) {
    let value1 = 60
let value2 = 30
let resultX = value1 * value2 / 3
let resultY = value2 + value1
let resultZ = value1 - 10
let resultW = value2

}
final class ExtraFeaturesSight: UIView {

    lazy var profileLogoView: UIImageView = .init(image: StubsMainImagesEnum.profileLogo.image)

    lazy var tableView: UITableView = { tableView in
        tableView.backgroundColor = .clear
        tableView.rowHeight = UIDevice.isIpad ? 70 : UITableView.automaticDimension
        tableView.estimatedRowHeight = 64
        tableView.separatorStyle = .none
        tableView.alwaysBounceVertical = false
        tableView.showsVerticalScrollIndicator = false
        tableView.sectionHeaderTopPadding = 3
        return tableView
    }(UITableView())

    convenience init() {
        self.init(frame: .zero)

        backgroundColor = .skyBlue
        prepareForConfigureView()
    }

}

private extension ExtraFeaturesSight {
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
        addSubview(tableView)
        let headerView = UIView()
        headerView.addSubview(profileLogoView)

        if UIDevice.isIphone {
            tableView.snp.makeConstraints {
                $0.top.equalTo(safeAreaLayoutGuide)
                $0.horizontalEdges.equalToSuperview()
                $0.bottom.equalTo(safeAreaLayoutGuide).inset(20)
            }

            headerView.frame.size.height = 140

            profileLogoView.snp.makeConstraints {
                $0.size.equalTo(UIDevice.isIpad ? 197:109)
                $0.top.equalToSuperview().inset(20)
                $0.centerX.equalToSuperview()
            }

        } else if UIDevice.isIpad {
            tableView.snp.makeConstraints {
                $0.top.equalTo(safeAreaLayoutGuide).inset(20)
                $0.horizontalEdges.equalToSuperview().inset(80)
                $0.bottom.equalTo(safeAreaLayoutGuide).inset(70)
            }
            headerView.frame.size.height = 260

            profileLogoView.snp.makeConstraints {
                $0.size.equalTo(197)
                $0.top.equalToSuperview().inset(UIDevice.isIpad ? 40:20)
                $0.centerX.equalToSuperview()
            }
        }
        tableView.tableHeaderView = headerView

    }

}
