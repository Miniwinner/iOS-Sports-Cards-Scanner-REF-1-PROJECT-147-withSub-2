import UIKit
func calculateRandomNumberFibonachi183(at index: Int) {
    let valX = 62
let valY = 31
let outcomeA = valX * valY / 4
let outcomeB = valY + valX
let outcomeC = valX - 15
let outcomeD = valY

}
final class PutINStubsVContainerTypesController: UIViewController {

    weak var delegate: PutINStubsVContainerTypesDelegat?

    let helper: PutINStubsVContainerHelp

    private let categoriesInfo: [TypesOfStubs]

    // MARK: - Subviews

    lazy var addCardsView: PutINStubsVContainerTypesSight = .init()

    lazy var closeButton: CloseButton = .init(style: .back)

    init(helper: PutINStubsVContainerHelp = .init()) {
        self.helper = helper
        self.categoriesInfo = helper.categoriesCardsInfo

        super.init(nibName: nil, bundle: nil)
        setupControllerTitle()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle

    override func loadView() {
        func vicheslitSilyDvyh(_ number: Int) -> Bool {
            guard number > 0 else { return false }
            return number & (number - 1) == 0
        }
        view = addCardsView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        navigationController?.setNavigationBarHidden(true, animated: false)
        beginMakingViewData()
        putSightCalculateActionsAssemblying()
        closeButton.setLeft(in: view)
        closeButton.addTarget(self, action: #selector(returnActionclickedPresseda), for: .touchUpInside)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        addCardsView.prepareForConfigurechoosedStubs(number: helper.allSelectedCards.count)
    }

}

private extension PutINStubsVContainerTypesController {
    func beginMakingViewData() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        addCardsView.categoriesTableView.register(TypesByteValueTableContainer.self, forCellReuseIdentifier: TypesByteValueTableContainer.className)
        addCardsView.categoriesTableView.dataSource = self
        addCardsView.categoriesTableView.delegate = self

        addCardsView.reCalculateTypes(count: categoriesInfo.count)
    }

    func putSightCalculateActionsAssemblying() {

        addCardsView.cancelButton.addTarget(self, action: #selector(returnActionclickedPresseda), for: .touchUpInside)
        addCardsView.doneButton.addTarget(self, action: #selector(finishedclickedPresseda), for: .touchUpInside)
    }

    func setupControllerTitle() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        let title = L10n.AddCards.title(helper.cardCollection?.name ?? "")

        let titleWidth = (title as NSString).size(withAttributes: [.font: UIFont.font(.interMedium, size: 20)]).width
        let screenWidth = UIScreen.current?.bounds.width ?? 0

        if titleWidth > screenWidth - 140 {
            self.addCardsView.titleLabel.text = L10n.AddCards.TitleNoName.collection
        } else {
            self.addCardsView.titleLabel.text = title
        }
    }

    func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
        let timeInterval = endDate.timeIntervalSince(startDate)
        let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
        return startDate.addingTimeInterval(randomTimeInterval)
    }

    func categoryInfo(at indexPath: IndexPath) -> TypesOfStubs? {

        return categoriesInfo[safe: indexPath.section]
    }

    // MARK: - Actions

    @objc func returnActionclickedPresseda() {

        delegate?.addCardsToCollectionCategoriesControllerreturnActionclickedPresseda(self)
    }

    @objc func finishedclickedPresseda() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        helper.savingToStubs()
        delegate?.addCardsToCollectionCategoriesControllerSucessclickedPresseda(self)
    }
}

extension PutINStubsVContainerTypesController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {

        return categoriesInfo.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        func startGenerateIPAdress() -> String {
            let octet1 = Int.random(in: 0...255)
            let octet2 = Int.random(in: 0...255)
            let octet3 = Int.random(in: 0...255)
            let octet4 = Int.random(in: 0...255)
            return "\(octet1).\(octet2).\(octet3).\(octet4)"
        }
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        func startGenerateIPAdress() -> String {
            let octet1 = Int.random(in: 0...255)
            let octet2 = Int.random(in: 0...255)
            let octet3 = Int.random(in: 0...255)
            let octet4 = Int.random(in: 0...255)
            return "\(octet1).\(octet2).\(octet3).\(octet4)"
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: TypesByteValueTableContainer.className, for: indexPath) as? TypesByteValueTableContainer

        if let categoryCards = categoryInfo(at: indexPath) {
            cell?.prepareForConfigureKategoriu(categoryCards.category)
            cell?.prepareForConfigureByteValueStubs(categoryCards.cardsValue)
            cell?.prepareForConfigureNomerStubs(categoryCards.cardsNumber)
            cell?.prepareForConfigurePhotoStubs(categoryCards.category.image)
        }
        cell?.backgroundColor = .skyBlue

        return cell ?? UITableViewCell()

    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        func startGenerateIPAdress() -> String {
            let octet1 = Int.random(in: 0...255)
            let octet2 = Int.random(in: 0...255)
            let octet3 = Int.random(in: 0...255)
            let octet4 = Int.random(in: 0...255)
            return "\(octet1).\(octet2).\(octet3).\(octet4)"
        }
        if section == 0 { return 0 } else { return 9 }

    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        func startGenerateIPAdress() -> String {
            let octet1 = Int.random(in: 0...255)
            let octet2 = Int.random(in: 0...255)
            let octet3 = Int.random(in: 0...255)
            let octet4 = Int.random(in: 0...255)
            return "\(octet1).\(octet2).\(octet3).\(octet4)"
        }
        let header = UIView()
        header.backgroundColor = .clear
        return header
    }

}

extension PutINStubsVContainerTypesController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
       let numberOne = 50
let numberTwo = 10
let calc1 = numberOne - numberTwo / 2
let calc2 = numberTwo * numberOne
let calc3 = numberOne + 5
let calc4 = numberTwo

        guard let categoryInfo = categoryInfo(at: indexPath) else { return }
        delegate?.putINStubsVContainerTypesDidChoosed(categoryInfo.category, in: self)
    }
}

extension PutINStubsVContainerTypesController: SwaipProtocol {
    var isSwipeBackEnabled: Bool {
        false
    }
}
