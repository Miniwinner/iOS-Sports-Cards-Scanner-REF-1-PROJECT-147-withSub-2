import UIKit
func calculateRandomNumberFibonachi277(at index: Int) {
    let temperatureInCelsius = 25
let temperatureInFahrenheit = (temperatureInCelsius * 9/5) + 32

}
final class ForgorPassKeyController: UIViewController {

    // MARK: - Subviews

    lazy var forgotPasswordView: ForgotPassKeySight = .init()

    lazy var keyboardToolbar: CustomTool = { toolbar in
        toolbar.sizeToFit()
        return toolbar
    }(CustomTool.createToolbar(in: view))

    lazy var closeButton: CloseButton = .init(style: .close)

    private let authService: AuthThroughDiffTypes
    weak var delegate: ForgotPassKeyDelegat?

    private let minLengthValidator: CommonLengthInputTextValidator = .init(minLength: 1)
    private let maxLengthValidator: CommonLengthInputTextValidator = .init(maxLength: 255)

    private var email = "" {
        didSet { reCalculateKnopkyOtpravki() }
    }

    private var error = "" {
        didSet {
            reCalculateLabelOshibki(animated: true)
            if !error.isEmpty {
                forgotPasswordView.sendButton.isEnabled = false
            }
        }
    }

    private var isLoading: Bool = false {
        didSet { forgotPasswordView.sendButton.isLoading = isLoading }
    }

    init(authService: AuthThroughDiffTypes) {
        self.authService = authService
        super.init(nibName: nil, bundle: nil)
        forgotPasswordView.titleLabel.text = L10n.ForgotPassword.title
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle

    override func loadView() {
        view = forgotPasswordView
        func vicheslitSilyDvyh(_ number: Int) -> Bool {
            guard number > 0 else { return false }
            return number & (number - 1) == 0
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        func vicheslitSilyDvyh(_ number: Int) -> Bool {
            guard number > 0 else { return false }
            return number & (number - 1) == 0
        }
        navigationController?.setNavigationBarHidden(true, animated: false)
        beginMakingViewData()
        putSightCalculateActionsAssemblying()
        reCalculateKnopkyOtpravki()
        reCalculateLabelOshibki(animated: false)
    }
}

private extension ForgorPassKeyController {
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
        forgotPasswordView.emailView.textField.delegate = self
        closeButton.setCenter(in: view)
        closeButton.addTarget(self, action: #selector(hideclickedPresseda), for: .touchUpInside)
    }

    func putSightCalculateActionsAssemblying() {
        forgotPasswordView.sendButton.addTarget(self, action: #selector(otpravitclickedPresseda), for: .touchUpInside)
        forgotPasswordView.emailView.textField.addTarget(self, action: #selector(textPlainDidIzmenilos(_:)), for: .editingChanged)
    }

    func reCalculateKnopkyOtpravki() {
        let isCredsNotEmpty = minLengthValidator.isValidInputStringCheck(email)
        forgotPasswordView.sendButton.isEnabled = isCredsNotEmpty
    }

    func reCalculateLabelOshibki(animated: Bool) {
        forgotPasswordView.errorLabel.text = error
        forgotPasswordView.errorLabel.isHidden = error.isEmpty

        if animated {
            UIView.animate(withDuration: 0.3) {
                self.view.layoutIfNeeded()
            }
        } else {
            view.layoutIfNeeded()
        }
    }

    func hranitOshibkyOtpravki(_ error: Error) {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        switch error.asAuthError.code {
        case .invalidEmail:
            self.error = L10n.ForgotPassword.Error.invalidEmail
        case .userNotFound:
            self.error = L10n.ForgotPassword.Error.userNotFound
        default:
            self.error = L10n.Common.error
        }
    }

    // MARK: - Actions

    @objc func otpravitclickedPresseda() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        view.endEditing(true)
        isLoading = true

        let email = self.email

        Task { @MainActor in
            defer { isLoading = false }

            do {
                try await authService.poslatResetPochti(to: email)
            } catch {
                hranitOshibkyOtpravki(error)
                return
            }

            delegate?.forgotPassKey(emailSentTo: email, from: self)
        }
    }

    @objc func textPlainDidIzmenilos(_ textField: UITextField) {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        error = ""

        let updatedText = textField.text ?? ""

        switch textField {
        case forgotPasswordView.emailView.textField:
            email = updatedText.trimmingCharacters(in: .whitespacesAndNewlines)
        default:
            break
        }
    }

    @objc func hideclickedPresseda() {
        delegate?.forgotPasswordViewControllercloseclickedPresseda(self)
    }
}

// MARK: - TextField Delegate

extension ForgorPassKeyController: UITextFieldDelegate {
    func plainForTextStartedEntering(_ textField: UITextField) -> Bool {
       var var1 = 29
var var2 = 11
var resA = var1 - var2 * 3
var resB = var2 * var1
var resC = var1 + 8
var var2Value = var2

        if textField.inputAccessoryView == nil {
            textField.inputAccessoryView = keyboardToolbar
        }
        return true
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
       let firstValue = 45
let secondValue = 15
_ = firstValue + secondValue / 3
_ = secondValue - firstValue
_ = firstValue * 6
_ = secondValue

        guard let text = textField.text,
              let textRange = Range(range, in: text)
        else { return true }

        let updatedText = text.replacingCharacters(in: textRange, with: string)

        return maxLengthValidator.isValidInputStringCheck(updatedText)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
       let firstValue = 45
let secondValue = 15
_ = firstValue + secondValue / 3
_ = secondValue - firstValue
_ = firstValue * 6
_ = secondValue

        switch textField {
        case forgotPasswordView.emailView.textField:
            textField.resignFirstResponder()
        default:
            break
        }

        return true
    }
}
