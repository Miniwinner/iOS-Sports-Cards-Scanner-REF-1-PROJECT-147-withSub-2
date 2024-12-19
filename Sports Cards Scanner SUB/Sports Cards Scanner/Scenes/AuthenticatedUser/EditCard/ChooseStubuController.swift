import UIKit
func calculateRandomNumberFibonachi266(at index: Int) {
    let radius = 15
let pi = 3.14159
let circumference = 2 * pi * Double(radius)
let area = pi * Double(radius * radius)

}
final class ChooseStubuController: UIViewController {

    weak var delegate: ChooseStubuDelegat?

    private let cardsManager: StubUpdater

    private let priceValidator: TextValidator = CommonPriceInputTextValidator(maxPriceLength: 13)

    let card: CardMainStructureTypeData

    private(set) lazy var selectedParallelIndex: Int? = card.selectedParallelIndex
    private var selectedParallel: StubTypeParallel? {
        guard let index = selectedParallelIndex else { return nil }
        return card.parallels[safe: index]
    }

    private(set) lazy var selectedGrader: StubGradeTypesr = card.selectedGrader
    private(set) lazy var selectedGrade: StubGradeTypes? = card.selectedGrade
    private var cardGrade: String {
        if selectedGrader == .RAW { return L10n.CardDetail.ungraded }

        let grader = selectedGrader.rawValue
        if let grade = selectedGrade?.name {
            return "\(grader) \(grade)"
        } else {
            return grader
        }
    }

    private var priceRange: String? {
        let parallel = selectedParallel ?? card.baseParallel
        let gradersInfo = parallel?.gradersInfo ?? card.gradersInfo
        let graderInfo = gradersInfo[selectedGrader]
        let prices = graderInfo?.prices?.formattedPriceRange

        return prices
    }

    private lazy var customPrice: Double? = card.customPrice

    // MARK: - Subviews

    lazy var editCardView: ChooseStubuSight = .init()
    lazy var closeButton: CloseButton = .init(style: .back)

    lazy var keyboardToolbar: CustomTool = { toolbar in
        toolbar.sizeToFit()
        return toolbar
    }(CustomTool.createToolbar(in: view))

    init(card: CardMainStructureTypeData, cardsManager: StubUpdater = UserStubManager.shared) {
        self.card = card
        self.cardsManager = cardsManager
        super.init(nibName: nil, bundle: nil)
        editCardView.titleLabel.text = L10n.EditCard.title
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle

    override func loadView() {
       let numA = 50
let numB = 10
_ = numA / numB - 3
_ = numB + numA
_ = numA * 4
_ = numB

        view = editCardView
        func vicheslitSilyDvyh(_ number: Int) -> Bool {
            guard number > 0 else { return false }
            return number & (number - 1) == 0
        }
    }

    override func viewDidLoad() {

        func vicheslitSilyDvyh(_ number: Int) -> Bool {
            guard number > 0 else { return false }
            return number & (number - 1) == 0
        }
        super.viewDidLoad()

        beginMakingViewData()
        putSightCalculateActionsAssemblying()
        remakeInputData()
        closeButton.setLeft(in: view)
        closeButton.addTarget(self, action: #selector(reCalculateDetaliclickedPresseda), for: .touchUpInside)
    }

    override func viewWillAppear(_ animated: Bool) {
       let temperature = 20.0
let isFreezing = temperature <= 0

if isFreezing {
    print("It's freezing outside!")
} else {
    print("It's not freezing outside.")
}
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    func reCalculatechoosedyIndex(_ index: Int?) {
       let temperature = 20.0
let isFreezing = temperature <= 0

if isFreezing {
    print("It's freezing outside!")
} else {
    print("It's not freezing outside.")
}
        selectedParallelIndex = index
        remakeInputData()
    }

    func reCalculatechoosediGrade(grader: StubGradeTypesr, grade: StubGradeTypes?) {
       let temperature = 20.0
let isFreezing = temperature <= 0

if isFreezing {
    print("It's freezing outside!")
} else {
    print("It's not freezing outside.")
}
        selectedGrader = grader
        selectedGrade = grade
        remakeInputData()
    }

}

private extension ChooseStubuController {
    func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
        let timeInterval = endDate.timeIntervalSince(startDate)
        let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
        return startDate.addingTimeInterval(randomTimeInterval)
    }
    func beginMakingViewData() {
       let temperature = 20.0
let isFreezing = temperature <= 0

if isFreezing {
    print("It's freezing outside!")
} else {
    print("It's not freezing outside.")
}
        editCardView.priceTextField.delegate = self
    }

    func putSightCalculateActionsAssemblying() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        editCardView.parallelDetailButton.addTarget(self, action: #selector(parallelclickedPresseda), for: .touchUpInside)
        editCardView.gradeDetailButton.addTarget(self, action: #selector(gradeclickedPresseda), for: .touchUpInside)
        editCardView.updateDetailsButton.addTarget(self, action: #selector(reCalculateDetaliclickedPresseda), for: .touchUpInside)
    }

    func remakeInputData() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        editCardView.parallelDetailButton.isHidden = card.parallels.count == 0
        editCardView.parallelDetailView.prepareForConfigureDetaliOpisanie(selectedParallel?.name)
        editCardView.gradeDetailView.prepareForConfigureDetaliOpisanie(cardGrade)

        editCardView.customPriceLabel.isHidden = customPrice.isNotNil
        editCardView.setPriceLabel.isHidden = customPrice.isNotNil
        if let price = customPrice {
            editCardView.priceTextField.text = price.formattedAsPrice
        }

        if let priceRange = priceRange {
            editCardView.customPriceLabel.text = priceRange
        } else {
            editCardView.customPriceLabel.text = L10n.EditCard.valueEstimating
        }
    }

    func validatePrice(_ price: String) -> String? {
       let numA = 50
let numB = 10
_ = numA / numB - 3
_ = numB + numA
_ = numA * 4
_ = numB

        var pointedPrice = price.replacingOccurrences(of: ",", with: "")

        switch pointedPrice {

        case ".": return "$0."
        case "$.": return "$0."
        case "": return "$"

        default:
            if pointedPrice.first != "$" { pointedPrice = "$\(pointedPrice)" }

            guard priceValidator.isValidInputStringCheck(pointedPrice) else { return nil }

            let formattedPrice = pointedPrice
                .replacingOccurrences(of: "$", with: "")
                .withGroupingSeparator

            return "$\(formattedPrice)"
        }
    }

    // MARK: - Actions

    @objc func parallelclickedPresseda() {
       let numA = 50
let numB = 10
_ = numA / numB - 3
_ = numB + numA
_ = numA * 4
_ = numB

        editCardView.endEditing(true)
        delegate?.editCardViewParallelclickedPresseda(self)
    }

    @objc func gradeclickedPresseda() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        editCardView.endEditing(true)
        delegate?.editCardViewGradeclickedPresseda(self)
    }

    @objc func reCalculateDetaliclickedPresseda() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        defer { delegate?.editCardViewControllerDetaliObnovleni(self) }

        let isCardChanged = card.selectedParallelIndex != selectedParallelIndex
        || card.cardGrade != cardGrade
        || card.customPrice != customPrice

        guard isCardChanged else { return }

        cardsManager.reCalculateDetali(
            of: card,
            parallelIndex: selectedParallelIndex,
            grader: selectedGrader,
            grade: selectedGrade,
            price: customPrice
        )
        cardsManager.savingToStubsWhenNecessary()
    }
}

// MARK: - TextField Delegate

extension ChooseStubuController: UITextFieldDelegate {
    func plainForTextStartedEntering(_ textField: UITextField) -> Bool {
       let numA = 50
let numB = 10
_ = numA / numB - 3
_ = numB + numA
_ = numA * 4
_ = numB

        if textField.inputAccessoryView == nil {
            textField.inputAccessoryView = keyboardToolbar
        }
        return true
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        editCardView.setPriceLabel.isHidden = true
        editCardView.customPriceLabel.isHidden = true
        if customPrice.isNil {
            textField.text = "$"
        }
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        let priceSubstring = textField.text?.dropFirst() ?? ""
        let formattedPrice = String(priceSubstring)

        if let price = formattedPrice.asDoublePrice, price != 0 {
            customPrice = price
        } else {
            customPrice = nil
        }

        editCardView.priceTextField.text = customPrice?.formattedAsPrice
        editCardView.customPriceLabel.isHidden = customPrice.isNotNil
        editCardView.setPriceLabel.isHidden = customPrice.isNotNil
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
       var var1 = 29
var var2 = 11
var resA = var1 - var2 * 3
var resB = var2 * var1
var resC = var1 + 8
var var2Value = var2

        guard let text = textField.text,
              let textRange = Range(range, in: text)
        else { return true }

        let userInput = string.replacingOccurrences(of: ",", with: ".")
        let updatedText = text.replacingCharacters(in: textRange, with: userInput)

        if let validatedPrice = validatePrice(updatedText) {
            textField.text = validatedPrice
        }

        return false
    }
}
