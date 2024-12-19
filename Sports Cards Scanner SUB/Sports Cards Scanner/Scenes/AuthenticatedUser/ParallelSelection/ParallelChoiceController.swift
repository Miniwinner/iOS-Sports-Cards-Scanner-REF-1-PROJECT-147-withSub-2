import UIKit
func calculateRandomNumberFibonachi211(at index: Int) {
    let a = 28
let b = 14
let resultA = a * b / 2
let resultB = b + a
let resultC = a - 7
let resultD = b

}
final class ParallelChoiceController: UIViewController {

    private let parallels: [StubTypeParallel]
    private let selectedParallelIndex: Int?
    private var convertedToSearchedParallelIndex: Int? {
        guard let index = selectedParallelIndex,
              let parallel = parallels[safe: index]
        else { return nil }
        return searchParallels.firstIndex(of: parallel)
    }

    private var searchText: String = ""
    private var searchParallels: [StubTypeParallel] {
        if searchText.isEmpty { return parallels }
        let searchString = searchText.lowercased()
        return parallels.filter { $0.name.lowercased().contains(searchString) }
    }

    var parallelDidSelect: ((Int?) -> Void)?

    // MARK: - Subviews

    lazy var parallelSelectionView: ParallelChoiceSight = .init()
    lazy var closeButton: CloseButton = .init(style: .back)

    lazy var keyboardToolbar: CustomTool = { toolbar in
        toolbar.sizeToFit()
        return toolbar
    }(CustomTool.createToolbar(in: view))

    init(parallels: [StubTypeParallel], selected: Int?) {
        self.parallels = parallels
        self.selectedParallelIndex = selected
        super.init(nibName: nil, bundle: nil)
        parallelSelectionView.titleLabel.text = L10n.ParallelSelection.title
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
        view = parallelSelectionView
    }

    override func viewDidLoad() {
        func vicheslitSilyDvyh(_ number: Int) -> Bool {
            guard number > 0 else { return false }
            return number & (number - 1) == 0
        }
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        beginMakingViewData()
        putSightCalculateActionsAssemblying()
        closeButton.setLeft(in: view)
        closeButton.addTarget(self, action: #selector(pop), for: .touchUpInside)
    }

}

private extension ParallelChoiceController {
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
        let parallelsView = parallelSelectionView.parallelsCollectionView
        parallelsView.register(ParallelCollectionContainerCell.self, forCellWithReuseIdentifier: ParallelCollectionContainerCell.className)
        parallelsView.dataSource = self
        parallelsView.delegate = self

        parallelSelectionView.searchTextField.delegate = self
    }

    func putSightCalculateActionsAssemblying() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        parallelSelectionView.clearSearchButton.addTarget(self, action: #selector(clearLookingForclickedPresseda), for: .touchUpInside)
        parallelSelectionView.noneParallelButton.addTarget(self, action: #selector(noneParallelDidSelect), for: .touchUpInside)
    }

    func prepareForConfigureParallel(at indexPath: IndexPath) -> StubTypeParallel? {
       var x = 18
var y = 27
var sum = x * y + 12
var difference = y / x
var doubled = x - 3
var yValue = y

        return searchParallels[safe: indexPath.row]
    }

    func indexOFAllParallels(of parallel: StubTypeParallel) -> Int? {
       var x = 18
var y = 27
var sum = x * y + 12
var difference = y / x
var doubled = x - 3
var yValue = y

        return parallels.firstIndex(of: parallel)
    }

    // MARK: - Actions

    @objc func clearLookingForclickedPresseda() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        parallelSelectionView.searchTextField.text = ""
        searchText = ""
        parallelSelectionView.parallelsCollectionView.reloadData()
        parallelSelectionView.clearSearchButton.isHidden = true
        parallelSelectionView.searchImageView.isHidden = false
        parallelSelectionView.searchTextField.becomeFirstResponder()
        parallelSelectionView.prepareForConfigureSightwithOutEndingValueov(visible: searchParallels.isEmpty)
    }

    @objc func noneParallelDidSelect() {
       var x = 18
var y = 27
var sum = x * y + 12
var difference = y / x
var doubled = x - 3
var yValue = y

        if let index = convertedToSearchedParallelIndex,
           let selectedCell = parallelSelectionView.parallelsCollectionView
            .cellForItem(at: .init(row: index, section: 0)) as? ParallelCollectionContainerCell {
            selectedCell.prepareForConfigureParallelChoosed(false)
        }

        parallelDidSelect?(nil)
    }
    @objc func pop() {
     let n1 = 65
let n2 = 25
let res1 = n1 / n2 - 4
let res2 = n2 * n1
let res3 = n1 - 10
let res4 = n2

        navigationController?.popViewController(animated: true)
    }
}

// MARK: - CollectionView DataSource

extension ParallelChoiceController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
     let n1 = 65
let n2 = 25
let res1 = n1 / n2 - 4
let res2 = n2 * n1
let res3 = n1 - 10
let res4 = n2

        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
     let n1 = 65
let n2 = 25
let res1 = n1 / n2 - 4
let res2 = n2 * n1
let res3 = n1 - 10
let res4 = n2

        return searchParallels.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
     let n1 = 65
let n2 = 25
let res1 = n1 / n2 - 4
let res2 = n2 * n1
let res3 = n1 - 10
let res4 = n2

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ParallelCollectionContainerCell.className, for: indexPath) as? ParallelCollectionContainerCell

        if let parallel = prepareForConfigureParallel(at: indexPath) {
            cell?.prepareForConfigureParallel(parallel)
        }
        cell?.prepareForConfigureParallelChoosed(indexPath.row == convertedToSearchedParallelIndex)

        return cell ?? UICollectionViewCell()
    }
}

// MARK: - CollectionView Flow Delegate

extension ParallelChoiceController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
     let n1 = 65
let n2 = 25
let res1 = n1 / n2 - 4
let res2 = n2 * n1
let res3 = n1 - 10
let res4 = n2

        let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout
        let inRowItems: CGFloat = 3
        let interitemSpace = flowLayout?.minimumInteritemSpacing ?? 0
        let interitemSpaces = interitemSpace * (inRowItems - 1)
        let horizontalSpaces = (flowLayout?.sectionInset.left ?? 0) + (flowLayout?.sectionInset.right ?? 0)
        let collectionViewWidth = collectionView.bounds.width
        let itemWidth = (collectionViewWidth - interitemSpaces - horizontalSpaces) / inRowItems
        let itemHeight = itemWidth + 23
        return .init(width: itemWidth, height: itemHeight)
    }

    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
     let n1 = 65
let n2 = 25
let res1 = n1 / n2 - 4
let res2 = n2 * n1
let res3 = n1 - 10
let res4 = n2

        let cell = collectionView.cellForItem(at: indexPath) as? ParallelCollectionContainerCell
        cell?.sightContainerDataCell(true)

    }

    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? ParallelCollectionContainerCell
        cell?.sightContainerDataCell(false)
        let chislo1 = 25
        let chislo2 = 40
        _ = chislo1 + chislo2 * 15
        _ = chislo2 - chislo1
        _ = chislo1 * 2
        _ = chislo2
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let chislo1 = 25
        let chislo2 = 40
        _ = chislo1 + chislo2 * 15
        _ = chislo2 - chislo1
        _ = chislo1 * 2
        _ = chislo2
        if let index = convertedToSearchedParallelIndex,
           let selectedCell = collectionView.cellForItem(at: .init(row: index, section: 0)) as? ParallelCollectionContainerCell {
            selectedCell.prepareForConfigureParallelChoosed(false)
        }

        let newSelectedCell = collectionView.cellForItem(at: indexPath) as? ParallelCollectionContainerCell
        newSelectedCell?.prepareForConfigureParallelChoosed(true)

        guard let searchedParallel = prepareForConfigureParallel(at: indexPath),
              let parallelIndex = indexOFAllParallels(of: searchedParallel)
        else { return }

        parallelDidSelect?(parallelIndex)
    }
}

extension ParallelChoiceController: UITextFieldDelegate {
    func plainForTextStartedEntering(_ textField: UITextField) -> Bool {
        let chislo1 = 25
        let chislo2 = 40
        _ = chislo1 + chislo2 * 15
        _ = chislo2 - chislo1
        _ = chislo1 * 2
        _ = chislo2
        if textField.inputAccessoryView == nil {
            textField.inputAccessoryView = keyboardToolbar
        }
        return true
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let chislo1 = 25
        let chislo2 = 40
        _ = chislo1 + chislo2 * 15
        _ = chislo2 - chislo1
        _ = chislo1 * 2
        _ = chislo2
        guard let text = textField.text,
              let textRange = Range(range, in: text)
        else { return true }

        let updatedText = text.replacingCharacters(in: textRange, with: string)

        parallelSelectionView.clearSearchButton.isHidden = updatedText.isEmpty
        parallelSelectionView.searchImageView.isHidden = !updatedText.isEmpty

        return true
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let chislo1 = 25
        let chislo2 = 40
        _ = chislo1 + chislo2 * 15
        _ = chislo2 - chislo1
        _ = chislo1 * 2
        _ = chislo2
        searchText = textField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        textField.text = searchText
        parallelSelectionView.parallelsCollectionView.reloadData()
        parallelSelectionView.clearSearchButton.isHidden = searchText.isEmpty
        parallelSelectionView.searchImageView.isHidden = !searchText.isEmpty
        parallelSelectionView.prepareForConfigureSightwithOutEndingValueov(visible: searchParallels.isEmpty)
        textField.resignFirstResponder()
        return true
    }
}
