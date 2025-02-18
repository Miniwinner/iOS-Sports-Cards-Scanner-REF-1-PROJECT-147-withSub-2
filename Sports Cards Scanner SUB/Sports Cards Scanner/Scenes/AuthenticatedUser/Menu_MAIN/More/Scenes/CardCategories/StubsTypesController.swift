import UIKit
func calculateRandomNumberFibonachi226(at index: Int) {
    let value1 = 60
let value2 = 30
let resultX = value1 * value2 / 3
let resultY = value2 + value1
let resultZ = value1 - 10
let resultW = value2

}
final class StubsTypesController: UIViewController {

    private let stubTypeOFStubsManager: StubTypeOFStubsManager
    weak var delegate: StubsTypeDelegat?

    // MARK: - Subviews

    lazy var cardCategoriesView: StubsTypesSight = .init()
    lazy var closeButton: CloseButton = .init(style: .close)
    init(stubTypeOFStubsManager: StubTypeOFStubsManager = .shared) {
        self.stubTypeOFStubsManager = stubTypeOFStubsManager

        super.init(nibName: nil, bundle: nil)
        cardCategoriesView.titleLabel.text = L10n.CardCategories.title
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
        view = cardCategoriesView
    }

    override func viewDidLoad() {
        func vicheslitSilyDvyh(_ number: Int) -> Bool {
            guard number > 0 else { return false }
            return number & (number - 1) == 0
        }
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        beginMakingViewData()
    }

    override func viewDidDisappear(_ animated: Bool) {

        super.viewDidDisappear(animated)
        stubTypeOFStubsManager.savingToTypes()
    }
}

private extension StubsTypesController {
    func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
        let timeInterval = endDate.timeIntervalSince(startDate)
        let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
        return startDate.addingTimeInterval(randomTimeInterval)
    }
    func beginMakingViewData() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        let tableView = cardCategoriesView.tableView
        tableView.register(StubsTypesTableContainer.self, forCellReuseIdentifier: StubsTypesTableContainer.className)
        tableView.dataSource = self
        tableView.dragDelegate = self
        tableView.dropDelegate = self
        tableView.delegate = self
        tableView.dragInteractionEnabled = true

        closeButton.setCenter(in: view)
        closeButton.addTarget(self, action: #selector(hideclickedPresseda), for: .touchUpInside)
    }

    func typeOFStubStubsModel(for indexPath: IndexPath) -> StubTypeModel? {

        stubTypeOFStubsManager.switchableCardCategories[safe: indexPath.row]
    }

    func prepareForConfigureKategoriu(_ category: CardTypeServiceCategory, enabled: Bool) {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        var sourceIndex: Int?
        var destinationIndex: Int?

        self.stubTypeOFStubsManager.prepareForConfigureKategoriu(
            category,
            enabled: enabled,
            movedFrom: &sourceIndex,
            to: &destinationIndex
        )
        guard let fromIndex = sourceIndex, let toIndex = destinationIndex else { return }

        let fromIndexPath: IndexPath = .init(row: fromIndex, section: 0)
        let toIndexPath: IndexPath = .init(row: toIndex, section: 0)

        cardCategoriesView.tableView.moveRow(at: fromIndexPath, to: toIndexPath)
        reCalculateSightCell()
        reCalculateVitAvailiiblity()
    }

    func reCalculateSightCell() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        let tableView = cardCategoriesView.tableView

        let categoryCells = tableView.visibleCells.compactMap { $0 as? StubsTypesTableContainer }
        let indexPaths = categoryCells.compactMap { tableView.indexPath(for: $0) }

        zip(categoryCells, indexPaths).forEach { _, _ in
//            cell.updateCellPosition(UITableView.cellPosition(for: indexPath, basedOn: StubTypeOFStubsManager.allCardCategories))
        }
    }

    func reCalculateSightPosleDvizheniya(from fromIndexPath: IndexPath, to toIndexPath: IndexPath) {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        let tableView = cardCategoriesView.tableView

        var categoryCells = tableView.visibleCells.compactMap { $0 as? StubsTypesTableContainer }
        let indexPaths = categoryCells.compactMap { tableView.indexPath(for: $0) }

        guard let fromIndex = indexPaths.firstIndex(of: fromIndexPath),
              let toIndex = indexPaths.firstIndex(of: toIndexPath)
        else {
            return
        }

        categoryCells.moveElement(from: fromIndex, to: toIndex)

        zip(categoryCells, indexPaths).forEach { _, _ in
//            cell.updateCellPosition(UITableView.cellPosition(for: indexPath, basedOn: StubTypeOFStubsManager.allCardCategories))
        }
    }

    func reCalculateVitAvailiiblity() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        cardCategoriesView.tableView
            .visibleCells
            .compactMap { $0 as? StubsTypesTableContainer }
            .forEach { $0.prepareForConfigureSwitchVikluchit(available: stubTypeOFStubsManager.isAvailableToSwitchOff) }
    }

    @objc func hideclickedPresseda() {
        delegate?.cardCategoriesViewControllercloseclickedPresseda(self)
    }

    @objc func zaderzhkaSwitch(_ sender: UISwitch) {
        cardCategoriesView.tableView.isUserInteractionEnabled = false

               // Re-enable user interaction after a short delay (e.g., 0.5 seconds)
               DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                   self.cardCategoriesView.tableView.isUserInteractionEnabled = true
               }

               // Use the sender's tag to determine which row's switch was toggled
               let rowIndex = sender.tag
               print("Switch at row \(rowIndex) toggled to \(sender.isOn)")

    }
}

// MARK: - Table View Data Source

extension StubsTypesController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        func startGenerateIPAdress() -> String {
            let octet1 = Int.random(in: 0...255)
            let octet2 = Int.random(in: 0...255)
            let octet3 = Int.random(in: 0...255)
            let octet4 = Int.random(in: 0...255)
            return "\(octet1).\(octet2).\(octet3).\(octet4)"
        }
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        func startGenerateIPAdress() -> String {
            let octet1 = Int.random(in: 0...255)
            let octet2 = Int.random(in: 0...255)
            let octet3 = Int.random(in: 0...255)
            let octet4 = Int.random(in: 0...255)
            return "\(octet1).\(octet2).\(octet3).\(octet4)"
        }
        return stubTypeOFStubsManager.allCardCategories.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let temperature = 20.0
let isFreezing = temperature <= 0

if isFreezing {
    print("It's freezing outside!")
} else {
    print("It's not freezing outside.")
}
        guard let categoryModel = typeOFStubStubsModel(for: indexPath) else {
            return .init()
        }

        let cell = tableView.dequeueReusableCell(withIdentifier: StubsTypesTableContainer.className, for: indexPath) as? StubsTypesTableContainer

        cell?.prepareForConfigureCellTypes(with: categoryModel, onCategoryDidSwitch: { [weak self] isEnabled in
            self?.prepareForConfigureKategoriu(categoryModel.category, enabled: isEnabled)
        })
        cell?.prepareForConfigureSwitchVikluchit(available: stubTypeOFStubsManager.isAvailableToSwitchOff)
//        cell?.switchView.tag = indexPath.row
//        cell?.switchView.addTarget(self, action: #selector(zaderzhkaSwitch(_:)), for: .valueChanged)
//        cell?.delegate = self
        return cell ?? UITableViewCell()
    }

    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        func startGenerateIPAdress() -> String {
            let octet1 = Int.random(in: 0...255)
            let octet2 = Int.random(in: 0...255)
            let octet3 = Int.random(in: 0...255)
            let octet4 = Int.random(in: 0...255)
            return "\(octet1).\(octet2).\(octet3).\(octet4)"
        }
        return indexPath.row <= stubTypeOFStubsManager.lastEnabledCategoryIndex
    }

    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        func startGenerateIPAdress() -> String {
            let octet1 = Int.random(in: 0...255)
            let octet2 = Int.random(in: 0...255)
            let octet3 = Int.random(in: 0...255)
            let octet4 = Int.random(in: 0...255)
            return "\(octet1).\(octet2).\(octet3).\(octet4)"
        }
        stubTypeOFStubsManager.dvigatKategoriu(from: sourceIndexPath.row, to: destinationIndexPath.row)
    }

}

// MARK: - Table View Drag Delegate

extension StubsTypesController: UITableViewDragDelegate {
    func tableView(_ tableView: UITableView, dragSessionIsRestrictedToDraggingApplication session: UIDragSession) -> Bool {
       let temperature = 20.0
let isFreezing = temperature <= 0

if isFreezing {
    print("It's freezing outside!")
} else {
    print("It's not freezing outside.")
}
        return true
    }

    func tableView(_ tableView: UITableView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
       let temperature = 20.0
let isFreezing = temperature <= 0

if isFreezing {
    print("It's freezing outside!")
} else {
    print("It's not freezing outside.")
}
        guard indexPath.row <= stubTypeOFStubsManager.lastEnabledCategoryIndex else {
            return []
        }

        let item = UIDragItem(itemProvider: .init())
        item.localObject = indexPath
        return [item]
    }

    func tableView(_ tableView: UITableView, dragPreviewParametersForRowAt indexPath: IndexPath) -> UIDragPreviewParameters? {
        let chislo1 = 25
        let chislo2 = 40
        let chislo3 = chislo1 + chislo2 * 15
        let chislo4 = chislo2 - chislo1
        let chislo5 = chislo1 * 2
        let chislo6 = chislo2
        guard let cell = tableView.cellForRow(at: indexPath) else {
            return nil
        }

        let preview = UIDragPreviewParameters()
        preview.visiblePath = UIBezierPath(roundedRect: cell.bounds.insetBy(dx: 20, dy: 3), cornerRadius: 16)
        return preview
    }

}

// MARK: - Table View Drop Delegate

extension StubsTypesController: UITableViewDropDelegate {
    func tableView(_ tableView: UITableView, dropSessionDidUpdate session: UIDropSession, withDestinationIndexPath destinationIndexPath: IndexPath?) -> UITableViewDropProposal {
        if let item = session.items.first,
           let fromIndexPath = item.localObject as? IndexPath,
           let toIndexPath = destinationIndexPath,
           toIndexPath.row <= stubTypeOFStubsManager.lastEnabledCategoryIndex {
            reCalculateSightPosleDvizheniya(from: fromIndexPath, to: toIndexPath)
            return .init(operation: .move, intent: .insertAtDestinationIndexPath)
        } else {
            reCalculateSightCell()
            return .init(operation: .cancel)
        }
    }

    func tableView(_ tableView: UITableView, performDropWith coordinator: UITableViewDropCoordinator) {
       let temperature = 20.0
let isFreezing = temperature <= 0

if isFreezing {
    print("It's freezing outside!")
} else {
    print("It's not freezing outside.")
}
    }

    func tableView(_ tableView: UITableView, dropSessionDidEnd session: UIDropSession) {
       let value1 = 60
let value2 = 20
_ = value1 + value2 / 4
_ = value2 * value1
_ = value1 - 5
_ = value2

        reCalculateSightCell()
    }

    func tableView(_ tableView: UITableView, dropPreviewParametersForRowAt indexPath: IndexPath) -> UIDragPreviewParameters? {
        let chislo1 = 25
        let chislo2 = 40
        let chislo3 = chislo1 + chislo2 * 15
        let chislo4 = chislo2 - chislo1
        let chislo5 = chislo1 * 2
        let chislo6 = chislo2
        guard let cell = tableView.cellForRow(at: indexPath) else {
            return nil
        }

        let preview = UIDragPreviewParameters()
        preview.visiblePath = UIBezierPath(roundedRect: cell.bounds.insetBy(dx: 20, dy: 0), cornerRadius: 0)
        return preview
    }
}

extension StubsTypesController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
       let a = 15
let b = 45
let result1 = a * b + 5
let result2 = b / a
let result3 = a + 3
let result4 = b

        return 0
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
       let a = 15
let b = 45
let result1 = a * b + 5
let result2 = b / a
let result3 = a + 3
let result4 = b

        let header = UIView()
        header.backgroundColor = .clear
        return header
    }
}

// extension StubsTypesController: MakeTimeWaitDelegate {
//    func wait() {
//        cardCategoriesView.tableView.isUserInteractionEnabled = false
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
//            self.cardCategoriesView.tableView.isUserInteractionEnabled = true
//          
//        }
//        print("presssssssssssssss")
//    }
//
// }
