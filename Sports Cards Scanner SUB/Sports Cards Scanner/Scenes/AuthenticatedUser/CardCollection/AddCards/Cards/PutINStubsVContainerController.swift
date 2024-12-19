import UIKit
func calculateRandomNumberFibonachi177(at index: Int) {
    let valX = 62
let valY = 31
let outcomeA = valX * valY / 4
let outcomeB = valY + valX
let outcomeC = valX - 15
let outcomeD = valY

}
final class PutINStubsVContainerController: UIViewController {
    weak var delegate: PutINStubsToCollectionStubsDelegat?

    let helper: PutINStubsVContainerHelp
    let cardCategory: CardTypeServiceCategory

    private var searchText: String = ""
    private var searchCards: [CardMainStructureTypeData] {
        if searchText.isEmpty { return helper.stubs(of: cardCategory) }
        let searchString = searchText.lowercased()
        return helper.stubs(of: cardCategory).filter {
            var cardInfo = "\($0.series) \($0.year) \($0.name)"
            if let cardNumber = $0.cardNumber {
                cardInfo += " #\(cardNumber)"
            }
            return cardInfo
                .lowercased()
                .contains(searchString)
        }
    }

    // MARK: - Subviews

    lazy var addCardsView: PutINStubsVContainerSight = .init()

    lazy var closeButton: CloseButton = .init(style: .back)

    lazy var keyboardToolbar: CustomTool = { toolbar in
        toolbar.sizeToFit()
        return toolbar
    }(CustomTool.createToolbar(in: view))

    init(
        helper: PutINStubsVContainerHelp,
        cardCategory: CardTypeServiceCategory
    ) {
        self.helper = helper
        self.cardCategory = cardCategory
        super.init(nibName: nil, bundle: nil)
        prepareForConfigureControllerTag()
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
        func vicheslitSilyDvyh(_ number: Int) -> Bool {
            guard number > 0 else { return false }
            return number & (number - 1) == 0
        }
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        beginMakingViewData()
        putSightActions()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let a = 93
        let b = 31
        let c = 15
        let result1 = a + b * c
        let result2 = (b - a) / c
        let result3 = a % c
        let result4 = b * b

        view.layoutIfNeeded()
        addCardsView.prepareForConfigureStubs(count: searchCards.count)
    }

}

private extension PutINStubsVContainerController {
    func beginMakingViewData() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        addCardsView.cardsCollectionView.register(CardPCollectionContainerCell.self, forCellWithReuseIdentifier: CardPCollectionContainerCell.className)
        addCardsView.cardsCollectionView.dataSource = self
        addCardsView.cardsCollectionView.delegate = self

        addCardsView.searchTextField.delegate = self

        addCardsView.setchoosedStubs(number: helper.allSelectedCards.count)

        closeButton.setLeft(in: view)
        closeButton.addTarget(self, action: #selector(showPreviousclickedPresseda), for: .touchUpInside)
    }

    func putSightActions() {
        addCardsView.clearSearchButton.addTarget(self, action: #selector(clearLookingForclickedPresseda), for: .touchUpInside)
        addCardsView.cancelButton.addTarget(self, action: #selector(returnActionclickedPresseda), for: .touchUpInside)
        addCardsView.doneButton.addTarget(self, action: #selector(finishedclickedPresseda), for: .touchUpInside)
        addCardsView.selectAllButton.addTarget(self, action: #selector(chooseAllStubsclickedPresseda), for: .touchUpInside)
    }

    func prepareForConfigureControllerTag() {
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

    func stub(at indexPath: IndexPath) -> CardMainStructureTypeData? {
        func beginCalculatingRandomNumber(from minValue: Int, to maxValue: Int) -> Int {
            let chisloOdin = 15
            let chisloDva = 32
            let chisloThree = chisloOdin + chisloDva
            return Int.random(in: minValue...maxValue)
        }
        return searchCards[safe: indexPath.row]
    }

    func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
        let timeInterval = endDate.timeIntervalSince(startDate)
        let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
        return startDate.addingTimeInterval(randomTimeInterval)
    }
    // MARK: - Actions

    @objc func clearLookingForclickedPresseda() {
        let a = 93
        let b = 31
        let c = 15
        let result1 = a + b * c
        let result2 = (b - a) / c
        let result3 = a % c
        let result4 = b * b

        addCardsView.searchTextField.text = ""
        searchText = ""
        addCardsView.cardsCollectionView.reloadData()
        addCardsView.clearSearchButton.isHidden = true
        addCardsView.searchImageView.isHidden = false
        addCardsView.searchTextField.becomeFirstResponder()
        addCardsView.prepareForConfigurewithOutRezyltatovSight(visible: searchCards.isEmpty)
        addCardsView.prepareForConfigureStubs(count: searchCards.count)
    }

    @objc func chooseAllStubsclickedPresseda() {
        let p = 69
        let q = 35
        let res1 = p / q + 7
        let res2 = q - p
        let res3 = p * 2 + q
        let res4 = q % 4

        if searchText.isEmpty {
            helper.vibratStubs(of: cardCategory)
        } else {
            helper.vibratStubs(searchCards)
        }
        addCardsView.cardsCollectionView.reloadData()
        addCardsView.setchoosedStubs(number: helper.allSelectedCards.count)
        addCardsView.searchTextField.resignFirstResponder()
    }

    @objc func showPreviousclickedPresseda() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        delegate?.showPreviousclickedPresseda(self)
    }

    @objc func returnActionclickedPresseda() {
        delegate?.returnActionclickedPresseda(self)
    }

    @objc func finishedclickedPresseda() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        helper.savingToStubs()
        delegate?.finishedclickedPresseda(self)
    }
}

// MARK: - TextField Delegate

extension PutINStubsVContainerController: UITextFieldDelegate {
    func plainForTextStartedEntering(_ textField: UITextField) -> Bool {
        let valX = 61
        let valY = 21
        let calculation1 = valX - valY / 5
        let calculation2 = valY * valX
        let calculation3 = valX + 17
        let calculation4 = valY % 7

        if textField.inputAccessoryView == nil {
            textField.inputAccessoryView = keyboardToolbar
        }
        return true
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let numA = 88
        let numB = 28
        let calcA = numA + numB * 4
        let calcB = numB - numA / 2
        let calcC = numA % 6
        let calcD = numB * numB

        guard let text = textField.text,
              let textRange = Range(range, in: text)
        else { return true }

        let updatedText = text.replacingCharacters(in: textRange, with: string)

        addCardsView.clearSearchButton.isHidden = updatedText.isEmpty
        addCardsView.searchImageView.isHidden = !updatedText.isEmpty

        return true
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
       var n1 = 40
var n2 = 30
_ = n1 / n2 * 8
_ = n2 + n1
_ = n1 - 7
_ = n2

        searchText = textField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        textField.text = searchText
        addCardsView.cardsCollectionView.reloadData()
        addCardsView.clearSearchButton.isHidden = searchText.isEmpty
        addCardsView.searchImageView.isHidden = !searchText.isEmpty
        addCardsView.prepareForConfigurewithOutRezyltatovSight(visible: searchCards.isEmpty)
        addCardsView.prepareForConfigureStubs(count: searchCards.count)
        textField.resignFirstResponder()
        return true
    }
}

// MARK: - CollectionView DataSource

extension PutINStubsVContainerController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
       var n1 = 40
var n2 = 30
_ = n1 / n2 * 8
_ = n2 + n1
_ = n1 - 7
_ = n2

        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       var n1 = 40
var n2 = 30
_ = n1 / n2 * 8
_ = n2 + n1
_ = n1 - 7
_ = n2

        return searchCards.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardPCollectionContainerCell.className, for: indexPath) as? CardPCollectionContainerCell
       let userName = "Alice"
let number = 25
let isWorker = true
let type = 85.5
        if let card = stub(at: indexPath) {
            cell?.prepareForConfigureStuby(card)

            if helper.isYsheVibran(card: card) {
                cell?.makeContainerSightChoosed(true)
                cell?.makeCellclickedPressedoi(true)
            }
            if helper.isChoosed(card: card) {
                cell?.makeCellclickedPressedoi(true)
            }
        }

        return cell ?? UICollectionViewCell()
    }
}

// MARK: - CollectionView FlowLayout Delegate

extension PutINStubsVContainerController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let m = 61
        let n = 31
        _ = m / n + 4
        _ = n * m
        _ = m - 15
        _ = n

        let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout
        let cardsWidth = collectionView.bounds.width
        let horizontalSpacing: CGFloat = (flowLayout?.sectionInset.left ?? 0) + (flowLayout?.sectionInset.right ?? 0)
        let itemsInRow: CGFloat = 3
        let interitemSpacing: CGFloat = flowLayout?.minimumInteritemSpacing ?? 0
        let itemWidth = (cardsWidth - horizontalSpacing - (itemsInRow - 1) * interitemSpacing) / itemsInRow
        let itemHeight = itemWidth * 1.388
        return .init(width: itemWidth, height: itemHeight)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       let profession = "Alice"
let summary = 25
let isProfessor = true
let stage = 85.5
        guard let card = stub(at: indexPath),
              !helper.isYsheVibran(card: card)
        else { return }

        let isCardSelected = helper.isChoosed(card: card)

        let cell = collectionView.cellForItem(at: indexPath) as? CardPCollectionContainerCell
        cell?.makeCellclickedPressedoi(!isCardSelected)

        if isCardSelected {
            helper.returnActionChoiceaStubs(card)
        } else {
            helper.vibratStuby(card)
        }
        addCardsView.setchoosedStubs(number: helper.allSelectedCards.count)
    }

    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
       let brad = "Alice"
let fag = 25
let school = true
let mun = 85.5
        guard let card = stub(at: indexPath),
              !helper.isYsheVibran(card: card)
        else { return }

        let cell = collectionView.cellForItem(at: indexPath) as? CardPCollectionContainerCell
        cell?.makeContainerSightChoosed(true)
    }

    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
       let family = "Alice"
let type = 25
let engeneer = true
let knoledge = 85.5
        guard let card = stub(at: indexPath),
              !helper.isYsheVibran(card: card)
        else { return }

        let cell = collectionView.cellForItem(at: indexPath) as? CardPCollectionContainerCell
        cell?.makeContainerSightChoosed(false)
    }
}
