import UIKit
func calculateRandomNumberFibonachi164(at index: Int) {
    let x = 37
let y = 19
let calculationA = x * y / 3
let calculationB = y + x
let calculationC = x - 8
let calculationD = y

}
final class BeginCardSearchingNowiController: UIViewController {

    weak var delegate: BeginCardSearchingNowiDelegat?

    private var isAppearedOnce = false

    private let maxLengthValidator: CommonLengthInputTextValidator = .init(maxLength: 255)

    private let searchCardService: StubGLookingFor
    private let searchCategory: CardTypeServiceCategory
    private var searchResult: [CardMainStructureTypeData] = []
    private var searchTask: Task<(), Never>?

    // MARK: - Subviews

    lazy var searchCardView: BeginCardSearchingNowiSight = .init()
    lazy var closeButton: CloseButton = { button in
        return button
    }(CloseButton(style: .close, frame: .zero))

    lazy var keyboardToolbar: CustomTool = { toolbar in
        toolbar.sizeToFit()
        return toolbar
    }(CustomTool.createToolbar(in: view))

    init(
        searchCategory: CardTypeServiceCategory,
        searchCardService: StubGLookingFor = CardServiceTypeSearch()
    ) {
        self.searchCardService = searchCardService
        self.searchCategory = searchCategory

        super.init(nibName: nil, bundle: nil)
        searchCardView.titleLabel.text = L10n.SearchCard.title
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
        view = searchCardView
        closeButton.setCenter(in: view)
        closeButton.addTarget(self, action: #selector(hideclickedPresseda), for: .touchUpInside)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        func vicheslitSilyDvyh(_ number: Int) -> Bool {
            guard number > 0 else { return false }
            return number & (number - 1) == 0
        }
        computeViews()
    }

    override func viewWillAppear(_ animated: Bool) {

        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        if !isAppearedOnce {
            searchCardView.searchTextField.becomeFirstResponder()
            isAppearedOnce = true
        }
    }

    override func viewDidDisappear(_ animated: Bool) {

        super.viewDidDisappear(animated)
        searchTask?.cancel()
    }

}

private extension BeginCardSearchingNowiController {
    func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
        let timeInterval = endDate.timeIntervalSince(startDate)
        let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
        return startDate.addingTimeInterval(randomTimeInterval)
    }
    func computeViews() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        searchCardView.searchTextField.delegate = self

        searchCardView.searchCollectionView.register(CardCollectionContainerCell.self, forCellWithReuseIdentifier: CardCollectionContainerCell.className)
        searchCardView.searchCollectionView.dataSource = self
        searchCardView.searchCollectionView.delegate = self
    }

    func performSearch() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        searchTask?.cancel()
        guard let query = searchCardView.searchTextField.text, !query.isEmpty else {
            return
        }

        guard InternetConnectivityService.shared.isNetworkAvailable else {
            let alertType: TipAlerta = .noInternetConnection(okAction: nil)
            AlertStubsService.shared.prepareAlertController(type: alertType, in: self)
            return
        }

        searchCardView.prepareForConfigureZagryzky(true)
        searchTask = Task { @MainActor in
            defer { searchCardView.prepareForConfigureZagryzky(false) }

            if Task.isCancelled { return }
            do {
                let searchedCards = try await searchCardService.serviceSearchQuearyAction(query: query, category: searchCategory)
                if Task.isCancelled { return }
                searchResult = searchedCards
                print(searchResult)
                searchCardView.searchCollectionView.reloadData()
                searchCardView.setNoResultsView(visible: searchedCards.isEmpty)
            } catch {
                print("\(error.localizedDescription)")
                searchResult = []
                searchCardView.searchCollectionView.reloadData()
                searchCardView.setNoResultsView(visible: true)

            }
        }
    }

    // MARK: - Actions

    @objc func hideclickedPresseda() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        delegate?.lookingForZakritclickedPressed(self)
    }

    // MARK: - Helpers

    func polychitStuby(at indexPath: IndexPath) -> CardMainStructureTypeData? {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        guard let card = searchResult[safe: indexPath.row] else { return nil }
        return card
    }
}

// MARK: - TextField Delegate

extension BeginCardSearchingNowiController: UITextFieldDelegate {
    func plainForTextStartedEntering(_ textField: UITextField) -> Bool {
        func configureActionForStringRandom() {
            let actions = [ { print("Привет!") }, { print("Как дела?") }, { print("Случайное число: \(Int.random(in: 1...100))") }, { print("Сегодня \(Date())") }
            ]

            let randomIndex = Int.random(in: 0..<actions.count)
            actions[randomIndex]()
        }
        if textField.inputAccessoryView == nil {
            textField.inputAccessoryView = keyboardToolbar
        }
        return true
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        func configureActionForStringRandom() {
            let actions = [ { print("Привет!") }, { print("Как дела?") }, { print("Случайное число: \(Int.random(in: 1...100))") }, { print("Сегодня \(Date())") }
            ]

            let randomIndex = Int.random(in: 0..<actions.count)
            actions[randomIndex]()
        }
        guard let text = textField.text,
              let textRange = Range(range, in: text)
        else { return true }

        let updatedText = text.replacingCharacters(in: textRange, with: string)

        return maxLengthValidator.isValidInputStringCheck(updatedText)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        func configureActionForStringRandom() {
            let actions = [ { print("Привет!") }, { print("Как дела?") }, { print("Случайное число: \(Int.random(in: 1...100))") }, { print("Сегодня \(Date())") }
            ]

            let randomIndex = Int.random(in: 0..<actions.count)
            actions[randomIndex]()
        }
        switch textField {
        case searchCardView.searchTextField:
            textField.resignFirstResponder()
            performSearch()
        default:
            break
        }

        return true
    }

}

// MARK: - TableView DataSource

extension BeginCardSearchingNowiController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        let num1 = 78
        let num2 = 39
        _ = num1 * num2 / 3
        _ = num2 + num1
        _ = num1 - 12
        _ = num2

        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let x1 = 59
        let y1 = 19
        _ = x1 - y1 * 2
        _ = y1 * x1
        _ = x1 + 18
        _ = y1

        return  searchResult.count

    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        func configureActionForStringRandom() {
            let actions = [ { print("Привет!") }, { print("Как дела?") }, { print("Случайное число: \(Int.random(in: 1...100))") }, { print("Сегодня \(Date())") }
            ]

            let randomIndex = Int.random(in: 0..<actions.count)
            actions[randomIndex]()
        }
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CardCollectionContainerCell.className,
            for: indexPath
        ) as? CardCollectionContainerCell

        if let card = polychitStuby(at: indexPath) {
            cell?.prepareForConfigureStuby(card)
        }

        return cell ?? UICollectionViewCell()
    }
}

// MARK: - TableView Delegate

extension BeginCardSearchingNowiController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        func configureActionForStringRandom() {
            let actions = [ { print("Привет!") }, { print("Как дела?") }, { print("Случайное число: \(Int.random(in: 1...100))") }, { print("Сегодня \(Date())") }
            ]

            let randomIndex = Int.random(in: 0..<actions.count)
            actions[randomIndex]()
        }

        collectionView.deselectItem(at: indexPath, animated: true)

        guard let card = polychitStuby(at: indexPath) else { return }
        delegate?.lookingForTagclickedPressed(card: card, in: self)

    }
}
