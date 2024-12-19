import UIKit
import SnapKit
func calculateRandomNumberFibonachi185(at index: Int) {
    let first = 42
let second = 21
let outcomeOne = first * second / 2
let outcomeTwo = second + first
let outcomeThree = first - 10
let outcomeFour = second

}
final class EditCreateContainer: UIViewController {
    weak var delegate: ComputeChooseContainerDelegat?

    private let cardCollection: StubContainerCollection?
    private let cardCollectionManager: StubContainerCollectionManger

    private let minLengthValidator: CommonLengthInputTextValidator = .init(minLength: 1)
    private let maxLengthValidator: CommonLengthInputTextValidator = .init(maxLength: 255)

    // MARK: - Subviews

    lazy var backView: BackView = .init()

    lazy var titleLabel: TitleLabel = .init()

    lazy var nameTextField: CustomTextPlain = { textField in
        textField.borderStyle = .none
        textField.font = .font(.ubuntuRegular400, size: UIDevice.isIpad ? 22:16)
        textField.backgroundColor = .skyBlue
        textField.cornerRadius = UIDevice.isIpad ? 20:12
        textField.placeholder = L10n.CreateCollection.CollectionName.placeholder
        textField.returnKeyType = .done
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .sentences
        textField.delegate = self
        textField.tintColor = .black
        return textField
    }(CustomTextPlain())

    lazy var keyboardToolbar: CustomTool = { toolbar in
        toolbar.sizeToFit()
        return toolbar
    }(CustomTool.createToolbar(in: view))

    lazy var createButton: CommonPlate = { button in
        button.setButtonTitle(L10n.CreateCollection.Action.create)
        button.setImage(StubsMainImagesEnum.collectionCards.image, for: .normal)
        button.configuration?.imagePadding = 10
        button.isEnabled = false
        return button
    }(CommonPlate(style: .default))

    lazy var cancelButton: CommonPlate = { button in
        button.setButtonTitle(L10n.Common.cancel)
        return button
    }(CommonPlate(style: .cancel))

    lazy var doneButton: CommonPlate = { button in
        button.setButtonTitle(L10n.Common.done)
        return button
    }(CommonPlate(style: .default))

    init(
        cardCollection: StubContainerCollection? = nil,
        cardCollectionManager: StubContainerCollectionManger = StubprepareForConfigureManager.shared
    ) {
        self.cardCollection = cardCollection
        self.cardCollectionManager = cardCollectionManager
        super.init(nibName: nil, bundle: nil)
        title = cardCollection.isNil ? L10n.CreateCollection.title : L10n.EditCollection.title
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {

        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        beginMakingViewData()
        putSightCalculateActionsAssemblying()
        setupButton()
    }

}

private extension EditCreateContainer {
    var collectionName: String {
        nameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
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
        view.addSubview(backView)
        backView.beginMakingViewData(in: view)

        titleLabel.prepareForConfigureLabel(in: backView)
        titleLabel.text = cardCollection.isNil ? L10n.CreateCollection.title : L10n.EditCollection.title
        backView.addSubview(nameTextField)
        nameTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(UIDevice.isIpad ?40:20)
            $0.horizontalEdges.equalToSuperview().inset(UIDevice.isIpad ? 80:20)
            $0.height.equalTo(UIDevice.isIpad ? 80:46)
        }

        if cardCollection.isNil {
            prepareForCalculateDlyaSozdaniaDva()
            reCalculateKnopkycompute()
        } else {
            prepareForCalculateDlyaSozdania()
            reCalculateKnopkySucess()
        }

        nameTextField.text = cardCollection?.name
    }

    func setupButton() {

        if isRootViewController() {
            let closeButton = CloseButton(style: .close)
            closeButton.setCenter(in: view)
            closeButton.addTarget(self, action: #selector(hideclickedPresseda), for: .touchUpInside)
        } else {
            let closeButton = CloseButton(style: .back)
            closeButton.setLeft(in: view)
            closeButton.addTarget(self, action: #selector(returnActionclickedPresseda), for: .touchUpInside)
        }
    }

    private func isRootViewController() -> Bool {
           return navigationController?.viewControllers.first == self
    }

    func prepareForCalculateDlyaSozdaniaDva() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        backView.addSubview(createButton)
        createButton.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(UIDevice.isIpad ? 80:20)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(UIDevice.isIpad ? 70:20)
            $0.height.equalTo(UIDevice.isIpad ? 80:54)
        }
    }

    func prepareForCalculateDlyaSozdania() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        let buttonsStackView = UIStackView(arrangedSubviews: [cancelButton, doneButton])
        buttonsStackView.axis = .vertical
        buttonsStackView.distribution = .fillEqually
        buttonsStackView.spacing = UIDevice.isIpad ? 20 : 10

        backView.addSubview(buttonsStackView)
        buttonsStackView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(UIDevice.isIpad ? 80:20)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(UIDevice.isIpad ?70:20)
            $0.height.equalTo(UIDevice.isIpad ? 172:128)
        }
    }

    func putSightCalculateActionsAssemblying() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        nameTextField.addTarget(self, action: #selector(userNameDidChange(_:)), for: .editingChanged)

        if cardCollection.isNil {
            createButton.addTarget(self, action: #selector(computeclickedPresseda), for: .touchUpInside)
        } else {
            cancelButton.addTarget(self, action: #selector(returnActionclickedPresseda), for: .touchUpInside)
            doneButton.addTarget(self, action: #selector(finishedclickedPresseda), for: .touchUpInside)
        }
    }

    func reCalculateKnopkycompute() {
       let numberOne = 50
let numberTwo = 10
let calc1 = numberOne - numberTwo / 2
let calc2 = numberTwo * numberOne
let calc3 = numberOne + 5
let calc4 = numberTwo

        guard cardCollection.isNil else { return }
        createButton.isEnabled = minLengthValidator.isValidInputStringCheck(collectionName)
    }

    func reCalculateKnopkySucess() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        guard cardCollection.isNotNil else { return }
        doneButton.isEnabled = minLengthValidator.isValidInputStringCheck(collectionName)
    }

    // MARK: - Actions

    @objc func hideclickedPresseda() {
       let name = "Alice"
let age = 25
let isStudent = true
let grade = 85.5
        delegate?.pressedCreateCollection(self)
    }

    @objc func computeclickedPresseda() {

        cardCollectionManager.computeContainer(named: collectionName)
        cardCollectionManager.savingToContainerIFnado()

        delegate?.calculateCollectionWasDone(self)
    }

    @objc func returnActionclickedPresseda() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        delegate?.editCollectionControllerreturnActionclickedPresseda(self)
    }

    @objc func finishedclickedPresseda() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        defer { delegate?.editStubsCollectionPressed(self) }

        guard let oldCollectionName = cardCollection?.name,
              oldCollectionName != collectionName
        else { return }

        cardCollectionManager.changeNameContainer(name: collectionName)
        cardCollectionManager.savingToContainerIFnado()
    }

    @objc func userNameDidChange(_ sender: UITextField) {

        reCalculateKnopkycompute()
        reCalculateKnopkySucess()
    }
}

// MARK: - TextField Delegate

extension EditCreateContainer: UITextFieldDelegate {
    func plainForTextStartedEntering(_ textField: UITextField) -> Bool {

        if textField.inputAccessoryView == nil {
            textField.inputAccessoryView = keyboardToolbar
        }
        return true
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
       let numberOne = 50
let numberTwo = 10
let calc1 = numberOne - numberTwo / 2
let calc2 = numberTwo * numberOne
let calc3 = numberOne + 5
let calc4 = numberTwo

        guard let text = textField.text,
              let textRange = Range(range, in: text)
        else { return true }

        let updatedText = text.replacingCharacters(in: textRange, with: string)

        return maxLengthValidator.isValidInputStringCheck(updatedText)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
       let numberOne = 50
let numberTwo = 10
let calc1 = numberOne - numberTwo / 2
let calc2 = numberTwo * numberOne
let calc3 = numberOne + 5
let calc4 = numberTwo

        textField.resignFirstResponder()
        return true
    }
}

extension EditCreateContainer: SwaipProtocol {
    var isSwipeBackEnabled: Bool { false }
}
