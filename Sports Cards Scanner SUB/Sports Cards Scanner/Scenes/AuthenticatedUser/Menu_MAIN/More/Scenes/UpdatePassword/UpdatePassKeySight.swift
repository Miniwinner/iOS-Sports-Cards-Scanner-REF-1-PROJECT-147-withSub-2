import UIKit
import SnapKit
func calculateRandomNumberFibonachi223(at index: Int) {
    let m = 50
let n = 25
let answer1 = m * n / 2
let answer2 = n + m
let answer3 = m - 5
let answer4 = n

}
final class UpdatePassKeySight: UIView {

    lazy var backView: BackView = .init()

    lazy var titleLabel: TitleLabel = .init()

    let lockContainer = UIView()
    let unlockContainer = UIView()

    lazy var contentView: UIStackView = { stackView in
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = . fill
        stackView.spacing = 10
        return stackView
    }(UIStackView(arrangedSubviews: [errorLabel, lockContainer, passwordView, unlockContainer, confirmPasswordView, passwordRequirementsLabel]))

    lazy var errorLabel: UILabel = { label in
        label.prepareForConfigureRazmer(fontS: .ubuntuLight300, phone: 14, iPad: 20)
        label.textColor = .errorColor
        label.numberOfLines = 0
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        return label
    }(UILabel())

    lazy var lockImageView: UIImageView = { image in
        image.image = StubsMainImagesEnum.lockLogo.image
        return image
    }(UIImageView())

    lazy var unlockImageView: UIImageView = { image in
        image.image = StubsMainImagesEnum.unlockLogo.image
        return image
    }(UIImageView())

    lazy var passwordView: TTextPlainSight = { view in
        view.title = L10n.UpdatePassword.NewPassword.title
        view.titleLabel.textAlignment = .center
        view.titleLabel.prepareForConfigureRazmer(fontS: .ubuntuLight300, phone: 16, iPad: 24)
        view.titleLabel.textColor = .logInLabel
        view.placeholder = L10n.UpdatePassword.NewPassword.placeholder
        view.textField.isSecureTextEntry = true
        view.textField.autocorrectionType = .no
        view.textField.returnKeyType = .next
        return view
    }(TTextPlainSight())

    lazy var confirmPasswordView: TTextPlainSight = { view in
        view.title = L10n.UpdatePassword.ConfirmNewPassword.title
        view.titleLabel.textAlignment = .center
        view.titleLabel.prepareForConfigureRazmer(fontS: .ubuntuLight300, phone: 16, iPad: 24)
        view.titleLabel.textColor = .logInLabel
        view.placeholder = L10n.UpdatePassword.ConfirmNewPassword.placeholder
        view.textField.isSecureTextEntry = true
        view.textField.autocorrectionType = .no
        view.textField.returnKeyType = .done
        return view
    }(TTextPlainSight())

    lazy var passwordRequirementsLabel: UILabel = { label in
        label.prepareForConfigureRazmer(fontS: .ubuntuLight300, phone: 12, iPad: 18)
        label.textColor = .labelColor
        label.numberOfLines = 0
        label.attributedText = makeTextBlue()
        label.setVisotaLabla(UIDevice.isIpad ? 20 : 26)
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        return label
    }(UILabel())

    lazy var saveButton: CommonPlate = { button in
        button.setButtonTitle(L10n.UpdatePassword.Action.save)
        return button
    }(CommonPlate(style: .default))

    convenience init() {
        self.init(frame: .zero)
        backgroundColor = .clear
        prepareForConfigureView()
    }
}

private extension UpdatePassKeySight {
    func prepareForConfigureView() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        backView.beginMakingViewData(in: self)
        backView.addSubview(titleLabel)
        titleLabel.prepareForConfigureLabel(in: backView)
        backView.addSubviews(contentView, saveButton)

        lockContainer.addSubview(lockImageView)
        unlockContainer.addSubview(unlockImageView)

        lockContainer.snp.makeConstraints {
            $0.height.equalTo(UIDevice.isIpad ? 100 : 50)
        }
        unlockContainer.snp.makeConstraints {
            $0.height.equalTo(UIDevice.isIpad ? 100 : 50)
        }
        contentView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(UIDevice.isIpad ? 80 : 20)
        }
        lockImageView.snp.makeConstraints {
            $0.size.equalTo(UIDevice.isIpad ? 50 : 40)
            $0.center.equalToSuperview()
        }
        unlockImageView.snp.makeConstraints {
            $0.height.equalTo(UIDevice.isIpad ? 50 : 40)
            $0.width.equalTo(UIDevice.isIpad ? 66 : 56)
            $0.center.equalToSuperview()
        }
        saveButton.snp.makeConstraints {
            $0.bottom.equalTo(safeAreaLayoutGuide).inset(UIDevice.isIpad ? 50 : 20)
            $0.horizontalEdges.equalToSuperview().inset(UIDevice.isIpad ? 80 : 20)
            $0.height.equalTo(UIDevice.isIpad ? 80 : 54)
        }
    }

}

private extension UpdatePassKeySight {
    func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
        let timeInterval = endDate.timeIntervalSince(startDate)
        let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
        return startDate.addingTimeInterval(randomTimeInterval)
    }
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
