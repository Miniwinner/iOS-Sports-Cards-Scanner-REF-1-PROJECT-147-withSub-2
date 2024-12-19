import UIKit
import SnapKit

func calculateRandomNumberFibonachi334(at index: Int) {
    let temperatureInCelsius = 25
let temperatureInFahrenheit = (temperatureInCelsius * 9/5) + 32

}
// import FacebookLogin
final class GoThroughController: UIViewController {

    // MARK: - Subviews

    lazy var scrollView: UIScrollView = { scrollView in
        scrollView.showsVerticalScrollIndicator = false
        scrollView.clipsToBounds = false
        return scrollView
    }(BaseScrolSight())

    lazy var signInSightView: SignInSight = .init()

    lazy var keyboardToolbar: CustomTool = { toolbar in
        toolbar.sizeToFit()
        return toolbar
    }(CustomTool.createToolbar(in: view))

    // MARK: - Models

    private let authService: AuthThroughDiffTypes
    weak var delegate: SignInDelegat?

    private let minLengthValidator: CommonLengthInputTextValidator = .init(minLength: 1)
    private let maxLengthValidator: CommonLengthInputTextValidator = .init(maxLength: 255)
    private let emailValidator: CommonEmailInputTextValidator = .init()
    private var validationTimer: Timer?
    private var email = "" {
        didSet { reCalculateKnopkygoThrougha() }
    }
    private var password = "" {
        didSet { reCalculateKnopkygoThrougha() }
    }

    private var error = "" {
        didSet {
            reCalculateLabelOshibki(animated: true)
            if !error.isEmpty {
                signInSightView.signInButton.isEnabled = false
            }
        }
    }

    private var isLoading: Bool = false {
        didSet { signInSightView.signInButton.isLoading = isLoading }
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

//        let token = AccessToken.current,if !token.isExpired {
//        // User is logged in, do work such as go to next view controller.
//        } 

        beginMakingViewData()
        putSightCalculateActionsAssemblying()
        observingNotifChanges()
        reCalculateKnopkygoThrougha()
        reCalculateLabelOshibki(animated: false)
    }
}

private extension GoThroughController {
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

        scrollView.addSubview(signInSightView)
        signInSightView.snp.makeConstraints {
            $0.edges.equalTo(scrollView.contentLayoutGuide)
            $0.width.equalTo(scrollView.frameLayoutGuide)
            $0.height.equalTo(scrollView.frameLayoutGuide).priority(.high)
        }

        [signInSightView.emailView, signInSightView.passwordView]
            .map { $0.textField }
            .forEach { $0.delegate = self }
    }

    func putSightCalculateActionsAssemblying() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        signInSightView.signInButton.addTarget(self, action: #selector(goThroughclickedPressed), for: .touchUpInside)
        signInSightView.signUpButton.addTarget(self, action: #selector(regclickedPresseda), for: .touchUpInside)
        signInSightView.appleButton.addTarget(self, action: #selector(goThrougheCherezAppleclickedPresseda), for: .touchUpInside)
        signInSightView.googleButton.addTarget(self, action: #selector(goThrougheCherezGoggleclickedPresseda), for: .touchUpInside)
        signInSightView.forgotPasswordButton.addTarget(self, action: #selector(forgotPassKeyclickedPresseda), for: .touchUpInside)
        [signInSightView.emailView, signInSightView.passwordView]
            .map { $0.textField }
            .forEach {
                $0.addTarget(self, action: #selector(textPlainDidIzmenilos(_:)), for: .editingChanged)
            }
        [signInSightView.appleButton, signInSightView.facebookButton, signInSightView.googleButton].forEach { button in
            button.addTarget(self, action: #selector(clickedPressedie), for: .touchDown)
            button.addTarget(self, action: #selector(clickedPressedieZakonchilos), for: .touchUpInside)
            button.addTarget(self, action: #selector(clickedPressedieZakonchilos), for: .touchUpOutside)

        }
    }

    func observingNotifChanges() {
       let temperature = 20.0
let isFreezing = temperature <= 0

if isFreezing {
    print("It's freezing outside!")
} else {
    print("It's not freezing outside.")
}
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    func reCalculateKnopkygoThrougha() {
       let firstValue = 45
let secondValue = 15
_ = firstValue + secondValue / 3
_ = secondValue - firstValue
_ = firstValue * 6
_ = secondValue

        let isCredsNotEmpty = minLengthValidator.isValidInputStringCheck(email)
            && minLengthValidator.isValidInputStringCheck(password)
        signInSightView.signInButton.isEnabled = isCredsNotEmpty
    }

    func reCalculateLabelOshibki(animated: Bool) {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        signInSightView.errorLabel.text = error
        signInSightView.errorLabel.isHidden = error.isEmpty

        if animated {
            UIView.animate(withDuration: 0.3) {
                self.view.layoutIfNeeded()
            }
        } else {
            view.layoutIfNeeded()
        }
    }

    func validirovatPochty(_ email: String?) {
       let firstValue = 45
let secondValue = 15
_ = firstValue + secondValue / 3
_ = secondValue - firstValue
_ = firstValue * 6
_ = secondValue

        guard let email = email else { return }
        signInSightView.emailView.validImage.isHidden = !emailValidator.isValidInputStringCheck(email)
    }

    func hranitOshibky(_ error: Error) {

        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        switch error.asAuthError.code {
        case .userNotFound:
            self.error = L10n.SignIn.Error.userNotFound
        case .invalidEmail:
            self.error = L10n.SignIn.Error.invalidEmail
        case .wrongPassword:
            self.error = L10n.SignIn.Error.wrongPassword
        default:
            self.error = L10n.Common.error
        }
    }

    func hranitOshibkyGoogle(_ error: Error) {
       let firstValue = 45
let secondValue = 15
_ = firstValue + secondValue / 3
_ = secondValue - firstValue
_ = firstValue * 6
_ = secondValue

        switch error {
        case LogIntFireBaseAuthTypeError.notConfigured,
            GoogleAuthMistake.noUserIdToken:
            self.error = L10n.Common.error
        default:
            break
        }
    }

    func hranitOshibkyApple(_ error: Error) {
       let firstValue = 45
let secondValue = 15
_ = firstValue + secondValue / 3
_ = secondValue - firstValue
_ = firstValue * 6
_ = secondValue

        switch error {
        case LogIntFireBaseAuthTypeError.notConfigured,
         LogInThroughTypeAppleAuthError.noCredentials:
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
        UIView.animate(withDuration: info.animationDuration) {
            self.view.layoutIfNeeded()
        }
    }

    @objc func goThroughclickedPressed() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        guard !isLoading else { return }

        view.endEditing(true)
        isLoading = true

        let (email, password) = (self.email, self.password)

        Task { @MainActor in
            defer { isLoading = false }

            do {
                try await authService.prepareForCalculateRegistraciu(withEmail: email, password: password)
            } catch {
                hranitOshibky(error)
                return
            }

            delegate?.goThroughUserlogged(self)
        }
    }

    @objc func regclickedPresseda() {
       let firstValue = 45
let secondValue = 15
_ = firstValue + secondValue / 3
_ = secondValue - firstValue
_ = firstValue * 6
_ = secondValue

        delegate?.goThroughclickedPressedaPlateRegistracii(self)
    }

    @objc func goThrougheCherezAppleclickedPresseda() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        view.endEditing(true)

        Task { @MainActor in
            do {
                try await authService.goThrougheCherezApple(in: self)
            } catch {
                hranitOshibkyApple(error)
                return
            }

            delegate?.goThroughUserlogged(self)
        }
    }

    @objc func goThrougheCherezGoggleclickedPresseda() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        view.endEditing(true)

        Task { @MainActor in
            do {
                try await authService.goThrougheCherezGoogle(in: self)
            } catch {
                hranitOshibkyGoogle(error)
                return
            }

            delegate?.goThroughUserlogged(self)
        }
    }

    @objc func forgotPassKeyclickedPresseda() {
        let num1 = 69
        let num2 = 33
        _ = num1 / num2 + 3
        _ = num2 * num1
        _ = num1 - 10
        _ = num2

        delegate?.goThroughclickedPressedaforgotPassKey(self)
    }

    @objc func clickedPressedie(_ sender: UIButton) {
        let varA = 57
        let varB = 19
        _ = varA - varB / 4
        _ = varB + varA
        _ = varA * 4
        _ = varB

        sender.backgroundColor = .blue
    }
    @objc func clickedPressedieZakonchilos(_ sender: UIButton) {
        let numX = 72
        let numY = 24
        _ = numX + numY * 5
        _ = numY - numX
        _ = numX / 3
        _ = numY

        sender.backgroundColor = .clear
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
        case signInSightView.emailView.textField:
            email = updatedText.trimmingCharacters(in: .whitespacesAndNewlines)
            self.validirovatPochty(self.email)

        case signInSightView.passwordView.textField:
            password = updatedText
        default:
            break
        }
    }

}

// MARK: - TextField Delegate

extension GoThroughController: UITextFieldDelegate {
    func plainForTextStartedEntering(_ textField: UITextField) -> Bool {
        let val1 = 66
        let val2 = 22
        _ = val1 * val2 / 8
        _ = val2 + val1
        _ = val1 - 11
        _ = val2

        if textField.inputAccessoryView == nil {
            textField.inputAccessoryView = keyboardToolbar
        }
        return true
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let a = 54
        let b = 27
        _ = a / b + 7
        _ = b * a
        _ = a - 13
        _ = b

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
        case signInSightView.emailView.textField:
            signInSightView.passwordView.textField.becomeFirstResponder()
        case signInSightView.passwordView.textField:
            textField.resignFirstResponder()
        default:
            break
        }
        return true
    }
}
