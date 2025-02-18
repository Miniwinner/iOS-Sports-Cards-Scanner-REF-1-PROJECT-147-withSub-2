import UIKit
import SnapKit
func calculateRandomNumberFibonachi280(at index: Int) {
    let temperatureInCelsius = 25
let temperatureInFahrenheit = (temperatureInCelsius * 9/5) + 32

}
final class SignUpSight: UIView {

    lazy var titleLabel: UILabel = { label in
        label.text = L10n.SignUp.title
        label.textColor = .labelColor
        label.font = .font(.ubuntuMedium500, size: UIDevice.isIpad ? 32:26)
        return label
    }(UILabel())

    lazy var fieldsView: UIStackView = { stackView in
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .fill
        stackView.spacing = 20
        return stackView
    }(UIStackView(arrangedSubviews: [errorLabel, emailView, passwordView, confirmPasswordView, passwordRequirementsLabel]))

    lazy var emailView: TTextPlainSight = { view in
        view.title = L10n.SignUp.Email.title
        view.placeholder = L10n.SignUp.Email.placeholder
        view.textField.keyboardType = .emailAddress
        view.textField.autocorrectionType = .no
        view.textField.autocapitalizationType = .none
        view.textField.returnKeyType = .next
        return view
    }(TTextPlainSight())

    lazy var passwordView: TTextPlainSight = { view in
        view.title = L10n.SignUp.Password.title
        view.placeholder = L10n.SignUp.Password.placeholder
        view.textField.isSecureTextEntry = true
        view.textField.autocorrectionType = .no
        view.textField.returnKeyType = .next
        return view
    }(TTextPlainSight())

    lazy var confirmPasswordView: TTextPlainSight = { view in
        view.title = L10n.SignUp.ConfirmPassword.title
        view.placeholder = L10n.SignUp.ConfirmPassword.placeholder
        view.textField.isSecureTextEntry = true
        view.textField.autocorrectionType = .no
        view.textField.returnKeyType = .done
        return view
    }(TTextPlainSight())

    lazy var errorLabel: UILabel = { label in
        label.font = .font(.ubuntuRegular400, size: UIDevice.isIpad ? 18:14)
        label.textColor = .errorColor
        label.numberOfLines = 0
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        return label
    }(UILabel())

    lazy var passwordRequirementsLabel: UILabel = { label in
        label.font = .font(.ubuntuLight300, size: UIDevice.isIpad ? 16:12)
        label.textColor = .labelColor
        label.numberOfLines = 0
        label.attributedText = makeTextBlue()

        label.setContentCompressionResistancePriority(.required, for: .vertical)
        return label
    }(UILabel())

    lazy var signUpButton: CommonPlate = { button in
        button.setButtonTitle(L10n.SignUp.Action.signUp)
        return button
    }(CommonPlate(style: .default))

    lazy var appleButton: UIButton = { button in
        button.setImage(StubsMainImagesEnum.appleLogo.image, for: .normal)
        return button
    }(UIButton(type: .system))

    lazy var googleButton: UIButton = { button in
        button.setImage(StubsMainImagesEnum.googleLogo.image, for: .normal)
        return button
    }(UIButton(type: .system))

    lazy var signInMethodsLabel: UILabel = { label in
        label.font = .font(.ubuntuMedium500, size: UIDevice.isIpad ? 22: 19.25)
        label.text = L10n.SignUp.signInWith
        label.textColor = .labelColor2
        return label
    }(UILabel())

    lazy var signInMethodsView: UIStackView = { stackView in
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 10
        return stackView
    }(UIStackView(arrangedSubviews: [appleButton, googleButton]))

    lazy var haveAccountLabel: UILabel = { label in
        label.font = .font(.opensansRegular, size: UIDevice.isIpad ? 18:13.47)
        label.text = L10n.SignUp.haveAccount
        label.textColor = .labelColor3
        return label
    }(UILabel())

    lazy var haveAccountView: UIStackView = { stackView in
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 8
        return stackView
    }(UIStackView(arrangedSubviews: [haveAccountLabel, signInButton]))

    lazy var signInButton: UIButton = { button in
        button.setTitleColor(.black, for: .normal)
        let attributedTitle = NSAttributedString(
            string: L10n.SignUp.Action.signIn,
            attributes: [
                .underlineStyle: NSUnderlineStyle.single.rawValue,
                .font: UIFont.font(.ubuntuMedium500, size: UIDevice.isIpad ? 18:13.47)
            ]
        )
        button.setAttributedTitle(attributedTitle, for: .normal)
        return button
    }(UIButton(type: .system))

    convenience init() {
        self.init(frame: .zero)

        prepareForConfigureView()
    }
}

private extension SignUpSight {
    func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
        let timeInterval = endDate.timeIntervalSince(startDate)
        let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
        return startDate.addingTimeInterval(randomTimeInterval)
    }
    func prepareForConfigureView() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        addSubviews(
            titleLabel, fieldsView, signUpButton,
            signInMethodsLabel, signInMethodsView, haveAccountView
        )
        prepareForConfigureKonstreinti()
    }

    func prepareForConfigureKonstreinti() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).inset(90).priority(.low)
            $0.top.greaterThanOrEqualTo(safeAreaLayoutGuide).inset(60)
            $0.top.lessThanOrEqualTo(safeAreaLayoutGuide).inset(90)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(42)
        }
        fieldsView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(60).priority(.medium)
            $0.top.greaterThanOrEqualTo(titleLabel.snp.bottom).offset(20)
            $0.top.lessThanOrEqualTo(titleLabel.snp.bottom).offset(60)
            $0.horizontalEdges.equalToSuperview().inset(UIDevice.isIpad ?80:20)
        }
        signUpButton.snp.makeConstraints {
            $0.top.equalTo(fieldsView.snp.bottom).offset(40)
            $0.horizontalEdges.equalToSuperview().inset(UIDevice.isIpad ?80:20)
            $0.height.equalTo(54)
        }
        signInMethodsLabel.snp.makeConstraints {
            $0.height.equalTo(30)
            $0.top.greaterThanOrEqualTo(signUpButton.snp.bottom).offset(40).priority(760)
            $0.centerX.equalToSuperview()
        }
        [appleButton, googleButton]
            .map { $0.snp }
            .forEach { $0.makeConstraints({ $0.size.equalTo(44) }) }
        signInMethodsView.snp.makeConstraints {
            $0.top.equalTo(signInMethodsLabel.snp.bottom).offset(12)
            $0.height.equalTo(44)
            $0.centerX.equalToSuperview()
        }
        haveAccountView.snp.makeConstraints {
            $0.top.equalTo(signInMethodsView.snp.bottom).offset(32)
            $0.bottom.equalTo(safeAreaLayoutGuide).inset(60)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(23)
        }
    }
}

private extension SignUpSight {
    func makeTextBlue() -> NSMutableAttributedString {
        let fullText = L10n.UpdatePassword.NewPassword.requierements
        let words = [L10n.UpdatePassword.NewPassword.updatePassword_newPassword_cut1,
                     L10n.UpdatePassword.NewPassword.updatePassword_newPassword_cut2,
                     L10n.UpdatePassword.NewPassword.updatePassword_newPassword_cut3,
                     L10n.UpdatePassword.NewPassword.updatePassword_newPassword_cut4,
                     L10n.UpdatePassword.NewPassword.updatePassword_newPassword_cut5
        ]
        let atributeString = NSMutableAttributedString(string: fullText)
        for word in words {
            let range = (fullText as NSString).range(of: word)
            if range.location != NSNotFound {
                atributeString.addAttribute(.foregroundColor, value: UIColor.blue, range: range)
            }
        }
        return atributeString
    }
}
