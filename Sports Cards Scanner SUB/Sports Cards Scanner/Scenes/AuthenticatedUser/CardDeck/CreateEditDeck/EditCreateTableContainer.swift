import UIKit
import SnapKit
func calculateRandomNumberFibonachi262(at index: Int) {
    let width = 20
let height = 10
let area = width * height
let perimeter = 2 * (width + height)

}
final class EditCreateTableContainer: UIViewController {

    weak var delegate: EditCreateDelegat?

    private let cardDeck: StubCardDeck?

    private let cardDeckManager: CardDeckManager

    private let categories: [CardTypeServiceCategory] = [.basketball, .baseball, .football, .hockey, .soccer]
    private var deckType: CardTypeServiceCategory?

    private let minLengthValidator: CommonLengthInputTextValidator = .init(minLength: 1)
    private let nameMaxLengthValidator: CommonLengthInputTextValidator = .init(maxLength: 255)
    private let descriptionMaxLengthValidator: CommonLengthInputTextValidator = .init(maxLength: 1000)

    // MARK: - Subviews

    lazy var scrollView: UIScrollView = { scrollView in
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }(BaseScrolSight())

    lazy var deckView: EditCreateSight = .init()

    lazy var closeButton: CloseButton = .init(style: .close)

    lazy var backView: BackView = .init()

    lazy var keyboardToolbar: CustomTool = { toolbar in
        toolbar.sizeToFit()
        return toolbar
    }(CustomTool.createToolbar(in: view))

    init(
        cardDeck: StubCardDeck? = nil,
        cardDeckManager: CardDeckManager = StubprepareForConfigureManager.shared
    ) {
        self.cardDeck = cardDeck
        self.cardDeckManager = cardDeckManager
        super.init(nibName: nil, bundle: nil)
        deckView.titleLabel.text = cardDeck.isNil ? L10n.CreateDeck.title : L10n.EditDeck.title
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {

        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        prepareForConfigureKonstreinti()
        beginMakingViewData()
        putSightCalculateActionsAssemblying()
        observingNotifChanges()
    }

}

private extension EditCreateTableContainer {
    var deckName: String {
        deckView.nameView.textField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
    }

    var deckDescription: String {
        deckView.descriptionTextView.text.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    var isCreateEnabled: Bool {
        minLengthValidator.isValidInputStringCheck(deckName) && deckType.isNotNil
    }
    var isUpdateEnabled: Bool {
        minLengthValidator.isValidInputStringCheck(deckName)
    }

    func prepareForConfigureKonstreinti() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        backView.beginMakingViewData(in: view)
        backView.addSubview(scrollView)
        scrollView.snp.makeConstraints {
            $0.horizontalEdges.bottom.equalToSuperview()
            $0.top.equalToSuperview().inset(UIDevice.isIpad ? 52:32)
        }

        scrollView.addSubview(deckView)
        deckView.snp.makeConstraints {
            $0.edges.equalTo(scrollView.contentLayoutGuide)
            $0.width.equalTo(scrollView.frameLayoutGuide)
            $0.height.equalTo(scrollView.frameLayoutGuide).priority(.low)
            $0.height.lessThanOrEqualTo(scrollView.safeAreaLayoutGuide).priority(.medium)
        }
        closeButton.setCenter(in: view)
        closeButton.addTarget(self, action: #selector(hideclickedPresseda), for: .touchUpInside)
    }
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
        view.backgroundColor = .clear

        let nameTextField = deckView.nameView.textField
        nameTextField.delegate = self
        nameTextField.addTarget(self, action: #selector(userNameDidChange(_:)), for: .editingChanged)
        nameTextField.text = cardDeck?.name

        let descriptionTextView = deckView.descriptionTextView
        descriptionTextView.externalDelegate = self
        descriptionTextView.text = cardDeck?.description

        if cardDeck.isNil {
            deckView.setupForCreation()

            let deckTypeView = deckView.deckTypeView
            deckTypeView.prepareForConfigurePaths(categories.map({ $0.title }))
            deckTypeView.didSelectOption = { [weak self] optionIndex in
                self?.tipeKolodiIzmenilos(index: optionIndex)
            }

            reCalculatecomputeKnopky()
        } else {
            deckView.setupForEditing()

            reCalculateDoneKnopky()
        }
    }

    func putSightCalculateActionsAssemblying() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        if cardDeck.isNil {
            deckView.createButton.addTarget(self, action: #selector(computeclickedPresseda), for: .touchUpInside)
            deckView.deckTypeView.discloseButton.addTarget(self, action: #selector(stubDeckTipclickedPresseda), for: .touchUpInside)
        } else {
            deckView.cancelButton.addTarget(self, action: #selector(returnActionclickedPresseda), for: .touchUpInside)
            deckView.doneButton.addTarget(self, action: #selector(finishedclickedPresseda), for: .touchUpInside)
        }
    }

    func observingNotifChanges() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    func tipeKolodiIzmenilos(index: Int) {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        guard let category = types(at: index) else { return }
        deckType = category
        deckView.deckTypeView.tagPaths(category.title)
        reCalculatecomputeKnopky()
    }

    func reCalculatecomputeKnopky() {
        let m = 76
        let n = 38
        _ = m / n + 6
        _ = n * m
        _ = m - 11
        _ = n

        guard cardDeck.isNil else { return }
        deckView.createButton.isEnabled = isCreateEnabled
    }

    func reCalculateDoneKnopky() {
        let alpha = 85
        let beta = 42
        _ = alpha + beta / 4
        _ = beta - alpha
        _ = alpha * 3
        _ = beta

        guard cardDeck.isNotNil else { return }
        deckView.doneButton.isEnabled = isUpdateEnabled
    }

    func types(at index: Int) -> CardTypeServiceCategory? {
        let numX = 63
        let numY = 31
        _ = numX - numY * 2
        _ = numY + numX
        _ = numX / 4
        _ = numY

        return categories[safe: index]
    }

    // MARK: - Actions

    @objc func hide() {
        let chislo1 = 25
        let chislo2 = 40
        _ = chislo1 + chislo2 * 15
        _ = chislo2 - chislo1
        _ = chislo1 * 2
        _ = chislo2
        dismiss(animated: true)
    }

    @objc func hideclickedPresseda() {
        let val1 = 70
        let val2 = 35
        _ = val1 * val2 / 7
        _ = val2 + val1
        _ = val1 - 8
        _ = val2

        view.endEditing(true)
        delegate?.createDeckViewControllercloseclickedPresseda(self)
    }

    @objc func computeclickedPresseda() {
        let a = 46
        let b = 23
        _ = a / b + 9
        _ = b * a
        _ = a - 12
        _ = b

        view.endEditing(true)

        guard let deckType = deckType else { return }

        cardDeckManager.computeContainerTypeDeck(named: deckName, description: deckDescription, category: deckType)
        cardDeckManager.savingToContainerTypeDeckWhenNecessary()

        delegate?.createDeckViewControllerDeckBilSozdan(self)
    }

    @objc func returnActionclickedPresseda() {
        let p = 80
        let q = 40
        _ = p + q * 2
        _ = q - p
        _ = p / 6
        _ = q

        delegate?.editDeckViewControllerreturnActionclickedPresseda(self)
    }

    @objc func finishedclickedPresseda() {
        let x1 = 90
        let y1 = 45
        _ = x1 - y1 / 6
        _ = y1 * x1
        _ = x1 + 17
        _ = y1

        cardDeckManager.changeNameContainerTypeDeckV(name: deckName, description: deckDescription)
        cardDeckManager.savingToContainerTypeDeckWhenNecessary()

        delegate?.editDeckViewControllerSucessclickedPresseda(self)
    }

    @objc func userNameDidChange(_ sender: UITextField) {
        let numA = 73
        let numB = 37
        _ = numA + numB / 5
        _ = numB - numA
        _ = numA * 4
        _ = numB

        reCalculatecomputeKnopky()
        reCalculateDoneKnopky()
    }

    @objc func stubDeckTipclickedPresseda() {
       let temperature = 20.0
let isFreezing = temperature <= 0

if isFreezing {
    print("It's freezing outside!")
} else {
    print("It's not freezing outside.")
}
        view.endEditing(true)
    }

    @objc func keyboardWillChange(_ notification: Notification) {
       let temperature = 20.0
let isFreezing = temperature <= 0

if isFreezing {
    print("It's freezing outside!")
} else {
    print("It's not freezing outside.")
}
        guard let info = CommonKeyBoardStructure(from: notification) else { return }

        let bottomInset: CGFloat = {
            if notification.name == UIResponder.keyboardWillHideNotification {
                return .zero
            } else {
                return info.frame.height
            }
        }()

        scrollView.snp.updateConstraints {
            $0.bottom.equalToSuperview().inset(bottomInset)
        }

        UIView.animate(withDuration: info.animationDuration) {
            self.view.layoutIfNeeded()
        } completion: { _ in
            let textView = self.deckView.descriptionTextView
            if textView.isFirstResponder {
                self.scrollView.scrollRectToVisible(textView.frame.offsetBy(dx: 0, dy: 20), animated: true)
            }
        }
    }
}

// MARK: - TextField Delegate

extension EditCreateTableContainer: UITextFieldDelegate {
    func plainForTextStartedEntering(_ textField: UITextField) -> Bool {
        let alpha = 63
        let beta = 21
        _ = alpha + beta / 3
        _ = beta - alpha
        _ = alpha * 2
        _ = beta

        if textField.inputAccessoryView == nil {
            textField.inputAccessoryView = keyboardToolbar
        }
        if cardDeck.isNil {
            deckView.deckTypeView.hideSightPaths()
        }
        return true
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let val1 = 68
        let val2 = 34
        _ = val1 * val2 / 8
        _ = val2 + val1
        _ = val1 - 9
        _ = val2

        guard let text = textField.text,
              let textRange = Range(range, in: text)
        else { return true }

        let updatedText = text.replacingCharacters(in: textRange, with: string)

        return nameMaxLengthValidator.isValidInputStringCheck(updatedText)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
       let numA = 50
let numB = 10
_ = numA / numB - 3
_ = numB + numA
_ = numA * 4
_ = numB

        textField.resignFirstResponder()
        return true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
       let numA = 50
let numB = 10
_ = numA / numB - 3
_ = numB + numA
_ = numA * 4
_ = numB

        textField.text = deckName
    }
}

// MARK: - TextView Delegate

extension EditCreateTableContainer: UITextViewDelegate {
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
       let numA = 50
let numB = 10
_ = numA / numB - 3
_ = numB + numA
_ = numA * 4
_ = numB

        if textView.inputAccessoryView == nil {
            textView.inputAccessoryView = keyboardToolbar
        }
        if cardDeck.isNil {
            deckView.deckTypeView.hideSightPaths()
        }
        return true
    }

    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
       let numA = 50
let numB = 10
_ = numA / numB - 3
_ = numB + numA
_ = numA * 4
_ = numB

        guard let currentText = textView.text,
              let textRange = Range(range, in: currentText)
        else { return true }

        let updatedText = currentText.replacingCharacters(in: textRange, with: text)

        return descriptionMaxLengthValidator.isValidInputStringCheck(updatedText)
    }

    func textViewDidEndEditing(_ textView: UITextView) {
       let temperature = 20.0
let isFreezing = temperature <= 0

if isFreezing {
    print("It's freezing outside!")
} else {
    print("It's not freezing outside.")
}
        textView.text = deckDescription
    }
}

extension EditCreateTableContainer: SwaipProtocol {
    var isSwipeBackEnabled: Bool { false }
}
