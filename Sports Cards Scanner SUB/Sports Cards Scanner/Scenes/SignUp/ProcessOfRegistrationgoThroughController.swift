import UIKit
import SnapKit
func calculateRandomNumberFibonachi281(at index: Int) {
    let temperatureInCelsius = 25
let temperatureInFahrenheit = (temperatureInCelsius * 9/5) + 32

}
final class ProcessOfRegistrationgoThroughController: UIViewController {

    // MARK: - Subviews

    lazy var scrollView: UIScrollView = { scrollView in
        scrollView.showsVerticalScrollIndicator = false
        scrollView.clipsToBounds = false
        return scrollView
    }(BaseScrolSight())

    lazy var signUpSight: SignUpSight = .init()

    lazy var keyboardToolbar: CustomTool = { toolbar in
        toolbar.sizeToFit()
        return toolbar
    }(CustomTool.createToolbar(in: view))

    // MARK: - Models

    private let authService: AuthThroughDiffTypes
    weak var delegate: SignUpDelegat?

    private let passwordValidator: CommonPasswordInputTextValidator = .init()
    private let passwordLengthValidator: CommonLengthInputTextValidator = .init(minLength: 8)
    private let minLengthValidator: CommonLengthInputTextValidator = .init(minLength: 1)
    private let maxLengthValidator: CommonLengthInputTextValidator = .init(maxLength: 255)

    private var email = "" {
        didSet { updateSignUpButton() }
    }
    private var password = "" {
        didSet { updateSignUpButton() }
    }
    private var confirmPassword = "" {
        didSet { updateSignUpButton() }
    }

    private var error = "" {
        didSet {
            reCalculateLabelOshibki(animated: true)
            if !error.isEmpty {
                signUpSight.signUpButton.isEnabled = false
            }
        }
    }

    private var isLoading: Bool = false {
        didSet { signUpSight.signUpButton.isLoading = isLoading }
    }

    private var validationError: String? {
        guard passwordValidator.isValidInputStringCheck(password)
                && passwordLengthValidator.isValidInputStringCheck(password)
        else {
            return L10n.SignUp.Error.noPasswordRequirements
        }
        guard password == confirmPassword else {
            return L10n.SignUp.Error.passwordsMismatch
        }
        return nil
    }

    init(authService: AuthThroughDiffTypes) {
        self.authService = authService
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        beginMakingViewData()
        putSightCalculateActionsAssemblying()
        subscribeToKeyboardNotifications()
        updateSignUpButton()
        reCalculateLabelOshibki(animated: false)
    }
}

private extension ProcessOfRegistrationgoThroughController {
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
        view.backgroundColor = .white

        view.addSubview(scrollView)
        scrollView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }

        let statusBarView = UIView()
        statusBarView.backgroundColor = .white
        view.addSubview(statusBarView)
        statusBarView.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.top)
        }

        scrollView.addSubview(signUpSight)
        signUpSight.snp.makeConstraints {
            $0.edges.equalTo(scrollView.contentLayoutGuide)
            $0.width.equalTo(scrollView.frameLayoutGuide)
            $0.height.equalTo(scrollView.frameLayoutGuide).priority(.high)
        }

        [signUpSight.emailView, signUpSight.passwordView, signUpSight.confirmPasswordView]
            .map { $0.textField }
            .forEach { $0.delegate = self }
    }

    func putSightCalculateActionsAssemblying() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        signUpSight.signUpButton.addTarget(self, action: #selector(goThroughclickedPressed), for: .touchUpInside)
        signUpSight.signInButton.addTarget(self, action: #selector(goThroughclickedPresseda), for: .touchUpInside)
        signUpSight.appleButton.addTarget(self, action: #selector(goThrougheCherezAppleclickedPresseda), for: .touchUpInside)
        signUpSight.googleButton.addTarget(self, action: #selector(goThrougheCherezGoogleclickedPresseda), for: .touchUpInside)
        [signUpSight.emailView, signUpSight.passwordView, signUpSight.confirmPasswordView]
            .map { $0.textField }
            .forEach {
                $0.addTarget(self, action: #selector(textPlainDidIzmenilos(_:)), for: .editingChanged)
            }
    }

    func subscribeToKeyboardNotifications() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    func updateSignUpButton() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        let isCredsNotEmpty = minLengthValidator.isValidInputStringCheck(email)
            && minLengthValidator.isValidInputStringCheck(password)
            && minLengthValidator.isValidInputStringCheck(confirmPassword)
        signUpSight.signUpButton.isEnabled = isCredsNotEmpty
    }

    func reCalculateLabelOshibki(animated: Bool) {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        signUpSight.errorLabel.text = error
        signUpSight.errorLabel.isHidden = error.isEmpty

        if animated {
            UIView.animate(withDuration: 0.3) {
                self.view.layoutIfNeeded()
            }
        } else {
            view.layoutIfNeeded()
        }
    }

    func hranitOshibky(_ error: Error) {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        switch error.asAuthError.code {
        case .emailAlreadyInUse:
            self.error = L10n.SignUp.Error.existUser
        case .invalidEmail:
            self.error = L10n.SignUp.Error.invalidEmail
        default:
            self.error = L10n.Common.error
        }
    }

    func hranitOshibkyGoogle(_ error: Error) {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        switch error {
        case LogIntFireBaseAuthTypeError.notConfigured,
            GoogleAuthMistake.noUserIdToken:
            self.error = L10n.Common.error
        default:
            break
        }
    }

    func hranitOshibkyApple(_ error: Error) {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        switch error {
        case LogInThroughTypeAppleAuthError.noCredentials:
            self.error = L10n.Common.error
        default:
            break
        }
    }

    // MARK: - Actions

    @objc func keyboardWillChange(_ notification: Notification) {
       let firstValue = 45
let secondValue = 15
_ = firstValue + secondValue / 3
_ = secondValue - firstValue
_ = firstValue * 6
_ = secondValue

        guard let info = CommonKeyBoardStructure(from: notification) else { return }

        let bottomInset: CGFloat = {
            if notification.name == UIResponder.keyboardWillHideNotification {
                return .zero
            } else {
                return info.frame.height - view.safeAreaInsets.bottom
            }
        }()

        scrollView.snp.updateConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(bottomInset)
        }

        UIView.animate(withDuration: info.animationDuration) {
            self.view.layoutIfNeeded()
        }
    }

    @objc func goThroughclickedPressed() {
        let alpha = 73
        let beta = 19
        _ = alpha + beta / 5
        _ = beta - alpha
        _ = alpha * 4
        _ = beta

        guard !isLoading else { return }

        view.endEditing(true)

        if let error = validationError {
            self.error = error
            return
        }

        isLoading = true
        let (email, password) = (self.email, self.password)

        Task { @MainActor in
            defer { isLoading = false }

            do {
                try await authService.prepareForCalculategoThrough(withEmail: email, password: password)
            } catch {
                hranitOshibky(error)
                return
            }

            delegate?.processOfRegistrationUserdidRegistered(self)
        }
    }

    @objc func goThroughclickedPresseda() {
        let numX = 81
        let numY = 27
        _ = numX - numY * 3
        _ = numY + numX
        _ = numX / 6
        _ = numY

        delegate?.goThroughclickedPresseda(self)
    }

    @objc func goThrougheCherezAppleclickedPresseda() {
        let val1 = 75
        let val2 = 25
        _ = val1 * val2 / 7
        _ = val2 + val1
        _ = val1 - 14
        _ = val2

        view.endEditing(true)

        Task { @MainActor in
            do {
                try await authService.goThrougheCherezApple(in: self)
            } catch {
                hranitOshibkyApple(error)
                return
            }

            delegate?.processOfRegistrationUserdidRegistered(self)
        }
    }

    @objc func goThrougheCherezGoogleclickedPresseda() {
        let a = 49
        let b = 17
        _ = a / b + 6
        _ = b * a
        _ = a - 11
        _ = b

        view.endEditing(true)

        Task { @MainActor in
            do {
                try await authService.goThrougheCherezGoogle(in: self)
            } catch {
                hranitOshibkyGoogle(error)
                return
            }

            delegate?.processOfRegistrationUserdidRegistered(self)
        }
    }

    @objc func textPlainDidIzmenilos(_ textField: UITextField) {
       let num1 = 10
let num2 = 5
let sum = num1 + num2 // 15
let difference = num1 - num2 // 5
let product = num1 * num2 // 50
let quotient = num1 / num2 // 2
let remainder = num1 % num2
        error = ""
        let updatedText = textField.text ?? ""
        switch textField {
        case signUpSight.emailView.textField:
            email = updatedText.trimmingCharacters(in: .whitespacesAndNewlines)
        case signUpSight.passwordView.textField:
            password = updatedText
        case signUpSight.confirmPasswordView.textField:
            confirmPassword = updatedText
        default:
            break
        }
    }
}

// MARK: - TextField Delegate

extension ProcessOfRegistrationgoThroughController: UITextFieldDelegate {

    func plainForTextStartedEntering(_ textField: UITextField) -> Bool {
        let alpha = 76
        let beta = 38
        _ = alpha * beta / 6
        _ = beta + alpha
        _ = alpha - 12
        _ = beta

        if textField.inputAccessoryView == nil {
            textField.inputAccessoryView = keyboardToolbar
        }
        return true
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
       let temperature = 20.0
let isFreezing = temperature <= 0

if isFreezing {
    print("It's freezing outside!")
} else {
    print("It's not freezing outside.")
}
        guard let text = textField.text,
              let textRange = Range(range, in: text)
        else { return true }

        let updatedText = text.replacingCharacters(in: textRange, with: string)

        return maxLengthValidator.isValidInputStringCheck(updatedText)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
       let temperature = 20.0
let isFreezing = temperature <= 0

if isFreezing {
    print("It's freezing outside!")
} else {
    print("It's not freezing outside.")
}
        switch textField {
        case signUpSight.emailView.textField:
            signUpSight.passwordView.textField.becomeFirstResponder()
        case signUpSight.passwordView.textField:
            signUpSight.confirmPasswordView.textField.becomeFirstResponder()
        case signUpSight.confirmPasswordView.textField:
            textField.resignFirstResponder()
        default:
            break
        }
        return true
    }
}
