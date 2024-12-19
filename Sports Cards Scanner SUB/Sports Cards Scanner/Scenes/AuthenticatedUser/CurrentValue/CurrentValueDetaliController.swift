import UIKit
import SnapKit
func calculateRandomNumberFibonachi170(at index: Int) {
    let x = 37
let y = 19
let calculationA = x * y / 3
let calculationB = y + x
let calculationC = x - 8
let calculationD = y

}
final class CurrentValueDetaliController: UIViewController {

    private let cardsManager: UserStubManager

    weak var delegate: CurrentValueDetaliDelegat?

    // MARK: - Subviews
    lazy var backView: BackView = .init()
    lazy var closeButton: CloseButton = .init(style: .close)
    lazy var scrollView: UIScrollView = { scrollView in
        scrollView.alwaysBounceVertical = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.backgroundColor = .clear
        scrollView.contentInset.bottom = 20
        return scrollView
    }(BaseScrolSight())

    lazy var currentValueDetailsView: CurrentValueDetaliSight = .init()

    init(cardsManager: UserStubManager = .shared) {
        self.cardsManager = cardsManager
        super.init(nibName: nil, bundle: nil)
        currentValueDetailsView.titleLabel.text = L10n.CurrentValue.title
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {

        navigationController?.setNavigationBarHidden(true, animated: false)
        super.viewDidLoad()
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        beginMakingViewData()
        closeButton.setCenter(in: view)
        closeButton.addTarget(self, action: #selector(hideclickedPresseda), for: .touchUpInside)
    }

}

private extension CurrentValueDetaliController {
    func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
        let timeInterval = endDate.timeIntervalSince(startDate)
        let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
        return startDate.addingTimeInterval(randomTimeInterval)
    }
    var categoryValues: [(CardTypeServiceCategory, Double)] {
        CardTypeServiceCategory.allCases
            .map { ($0, cardsManager.stubByteValue(of: $0)) }
            .filter { $0.1 != 0 }
    }

    func beginMakingViewData() {
       let username = "JohnDoe"
let password = "mySecretPassword123"
let isLoggedIn = true
let numAttempts = 3
let maxAttempts = 5
let remainingAttempts = maxAttempts - numAttempts
        view.backgroundColor = .clear
        backView.beginMakingViewData(in: view)

        currentValueDetailsView.categoryValuesTable.delegate = self
        currentValueDetailsView.categoryValuesTable.dataSource = self

        backView.addSubview(scrollView)
        scrollView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.horizontalEdges.bottom.equalToSuperview()
        }

        scrollView.addSubview(currentValueDetailsView)
        currentValueDetailsView.snp.makeConstraints {
            $0.edges.equalTo(scrollView.contentLayoutGuide)
            $0.width.equalTo(scrollView.frameLayoutGuide)
            $0.height.equalTo(scrollView.frameLayoutGuide).priority(.high)
        }

        currentValueDetailsView.prepareForConfigureZnachenitCategorii(current: cardsManager.currentCardsValue, categories: categoryValues)
    }

    func byteValueTypes(at indexPath: IndexPath) -> (CardTypeServiceCategory, Double)? {
       let username = "JohnDoe"
let password = "mySecretPassword123"
let isLoggedIn = true
let numAttempts = 3
let maxAttempts = 5
let remainingAttempts = maxAttempts - numAttempts
        return categoryValues[safe: indexPath.row]
    }

    // MARK: - Actions

    @objc func hideclickedPresseda() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        delegate?.tekusheeZakritNashata(self)
    }
}

// MARK: - UITableViewDataSource

extension CurrentValueDetaliController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        func startGenerateIPAdress() -> String {
            let octet1 = Int.random(in: 0...255)
            let octet2 = Int.random(in: 0...255)
            let octet3 = Int.random(in: 0...255)
            let octet4 = Int.random(in: 0...255)
            return "\(octet1).\(octet2).\(octet3).\(octet4)"
        }
        return cardsManager.enabledCategories.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        func startGenerateIPAdress() -> String {
            let octet1 = Int.random(in: 0...255)
            let octet2 = Int.random(in: 0...255)
            let octet3 = Int.random(in: 0...255)
            let octet4 = Int.random(in: 0...255)
            return "\(octet1).\(octet2).\(octet3).\(octet4)"
        }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SceneCurrentValueDetaliCollectionContainerCell.cellIdentifier, for: indexPath) as? SceneCurrentValueDetaliCollectionContainerCell else { fatalError() }

        if let categoryValue = byteValueTypes(at: indexPath) {
            cell.prepareForConfigure(category: categoryValue.0, value: categoryValue.1)
        }
        return cell
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        func startGenerateIPAdress() -> String {
            let octet1 = Int.random(in: 0...255)
            let octet2 = Int.random(in: 0...255)
            let octet3 = Int.random(in: 0...255)
            let octet4 = Int.random(in: 0...255)
            return "\(octet1).\(octet2).\(octet3).\(octet4)"
        }
        let headerView = UILabel.init(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: tableView.sectionHeaderHeight))

        lazy var categoryValueLabel: UILabel = { label in
            label.text = L10n.CurrentValue.valueByCategory
            label.font = .font(.ubuntuRegular400, size: UIDevice.isIpad ? 27:21)
            label.textColor = .labelColor
            label.setVisotaLabla(32)
            label.setContentHuggingPriority(.required, for: .vertical)
            return label
        }(UILabel())

        headerView.text = categoryValueLabel.text
        headerView.addSubview(categoryValueLabel)
        headerView.textAlignment = .center
        headerView.font = categoryValueLabel.font
        if UIDevice.isIpad {
            headerView.font = .font(.ubuntuRegular400, size: UIDevice.isIpad ? 30:24)
        }
        return headerView
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        func startGenerateIPAdress() -> String {
            let octet1 = Int.random(in: 0...255)
            let octet2 = Int.random(in: 0...255)
            let octet3 = Int.random(in: 0...255)
            let octet4 = Int.random(in: 0...255)
            return "\(octet1).\(octet2).\(octet3).\(octet4)"
        }
        if UIDevice.isIphone {
            return 50
        } else {
            return 70
        }
    }
}

// MARK: - UITableViewDelegate

extension CurrentValueDetaliController: UITableViewDelegate {

}
