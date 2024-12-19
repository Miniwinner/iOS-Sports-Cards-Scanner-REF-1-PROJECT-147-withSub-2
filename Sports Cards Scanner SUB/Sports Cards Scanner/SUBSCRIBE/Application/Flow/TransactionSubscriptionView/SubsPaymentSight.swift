import UIKit

protocol SubsPaymentSightDelegat: AnyObject {
    func paymentSightWasPurchasePressed()
    func paymentSightPrivacyPressed()
    func paymentSightTermsPressed()
}

protocol SubsPaymentSightConnectionProtocol: AnyObject {
    func isConnectionWorking() -> Bool
}

final class SubsPaymentSight: UIView {

    @IBOutlet private unowned var contentView: UIView!
    @IBOutlet private(set) weak var titleLabel: UILabel!
    @IBOutlet private weak var sliderStack: UIStackView!
    @IBOutlet private weak var trialStarImageView: UIImageView!
    @IBOutlet private weak var trialLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet weak var purchaseButton: StubSubsAnimatePlateSight!
    @IBOutlet private weak var privacyButton: UIButton!
    @IBOutlet private weak var policyButton: UIButton!

    @IBOutlet private weak var trialWidth: NSLayoutConstraint!
    @IBOutlet private weak var sliderWidth: NSLayoutConstraint!
    @IBOutlet private weak var conteinerWidth: NSLayoutConstraint!
    @IBOutlet private weak var heightView: NSLayoutConstraint!
    @IBOutlet weak var bgView: UIView!

    @IBOutlet private weak var trialLabelLead: NSLayoutConstraint!
    @IBOutlet private weak var trialLabelTrail: NSLayoutConstraint!

    @IBOutlet private weak var privacyTopButton: NSLayoutConstraint!
    @IBOutlet private weak var privacyBotButton: NSLayoutConstraint!

    @IBOutlet private weak var privacyLeadingButton: NSLayoutConstraint!
    @IBOutlet private weak var policyTrailingButton: NSLayoutConstraint!

    @IBOutlet private weak var trialLabelBottom: NSLayoutConstraint!
    @IBOutlet private weak var trialStarHeight: NSLayoutConstraint!
    @IBOutlet private weak var purchaseBtnLr: NSLayoutConstraint!
    @IBOutlet private weak var purchaseBtnTr: NSLayoutConstraint!

    @IBOutlet private weak var topLabelBtn: NSLayoutConstraint!
    @IBOutlet private weak var topConstaraintBtn: NSLayoutConstraint!
    @IBOutlet private weak var topConstaraintDescriptLb: NSLayoutConstraint!

    var product: SubsContentExample = .main
    var price: String = ""

    weak var delegate: SubsPaymentSightDelegat?
    weak var networkDelegat: SubsPaymentSightConnectionProtocol?

    private let xib = "SubsPaymentSight"
    private let locale = NSLocale.current.languageCode

    init(product: SubsContentExample) {
        super.init(frame: .zero)
        self.product = product
        print("1221212122121 - \(self.product)")
        prepareSight()
//        contentView.backgroundColor = .red
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        prepareSight()
    }

    private func prepareSight() {
        // MARK: Кастомные настройки сториборда
        Bundle.main.loadNibNamed(xib, owner: self, options: nil)
        if UIDevice.current.userInterfaceIdiom == .phone {
            privacyTopButton.isActive = true
            privacyBotButton.isActive = false
            topConstaraintDescriptLb.constant = 35
            // MARK: - Устройство является iPhone
            if UIScreen.main.nativeBounds.height >= 2436 {
                heightView.constant = 164
            } else {
                heightView.constant = 153
            }
//           / if locale == "en" {
                topLabelBtn.constant = 0
//            }
        } else {
            // MARK: - Устройство является IPAD
//            if locale == "en" {
                topLabelBtn.constant = 0
//            }
            privacyLeadingButton.constant = 40

            if locale == "fr" {
                policyTrailingButton.constant = 26
            } else {
                policyTrailingButton.constant = 40
            }

            trialLabelLead.constant = 185
            trialLabelTrail.constant = 185

            privacyTopButton.isActive = false
            privacyBotButton.isActive = true

            topConstaraintDescriptLb.constant = 60
            topConstaraintBtn.constant = 3

            purchaseBtnLr.constant = 180
            purchaseBtnTr.constant = 180
            trialLabelBottom.constant = 15
            conteinerWidth.constant = 400
            heightView.constant = 167
            trialStarHeight.constant = 25
        }

        contentView.calculateSubSightINSuperSight(self)
        contentView.backgroundColor = .clear
        calculateStatusForButtons()
    }

    private func calculateStatusForButtons() {
        prepareLabelsAndAppearance()
        purchaseButton.delegate = self
        purchaseButton.style = .native

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.purchaseButton.prepareAnimatebPlateAnimation()
        }
        makeWordsLanguageAdaptable()
    }

    func prepareTextForLabelsAndStack() {
        var type: String = ""
        switch product {
        case .main:
            type = "entrance"
        case .first:
            type = "entrance"//"mods"
        case .second:
            type = "entrance"//"maps"
        case .third:
            type = "entrance"//"sets"

        default:
            type = "entrance"
        }
        let typeNSTitle = NSMutableAttributedString(string: localizeStringWithValidation(forKey: "SliderID2_\(type)").uppercased())
        let sliderNS = NSMutableAttributedString(string: localizeStringWithValidation(forKey: "SliderID4_\(type )").uppercased())
        
        let continueString = localizeStringWithValidation(forKey: "iOSButtonID").uppercased() // СONTINUE в тексте
        let mutableString = NSMutableAttributedString(string: localizeStringWithValidation(forKey: "SliderID1tap") + " " + continueString + " " + localizeStringWithValidation(forKey: "SliderID1to") + "\n" + localizeStringWithValidation(forKey: "SliderID1_\(type)"),
                                                      attributes: [.font: UIFont(name: "Gilroy-Black", size: 24) ?? UIFont.systemFont(ofSize: 24, weight: .heavy),
                                                                   .foregroundColor: UIColor.white])
        let range = NSString(string: mutableString.string).range(of: continueString)
        let strokeTextAttributes = [
            NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.6749141812, green: 0.9081469178, blue: 1, alpha: 1),
            NSAttributedString.Key.font: UIFont(name: "Gilroy-Black", size: 32) ?? UIFont.systemFont(ofSize: 32, weight: .heavy)]
        as [NSAttributedString.Key: Any]
        mutableString.addAttributes(strokeTextAttributes, range: range)

        titleLabel.numberOfLines = 2
        titleLabel.attributedText = mutableString
        titleLabel.textAlignment = .natural
        titleLabel.adjustsFontSizeToFitWidth = true

        sliderStack.addArrangedSubview(SubsScrollCollectionCellSight(title: typeNSTitle, subTitle: localizeStringWithValidation(forKey: "SliderID2sub_\(type)"), imageName: "Star"))

        //        if locale == "en" {
                    let baseFont = UIFont(name: "Gilroy-Black", size: 12)
                    let largerFont = UIFont(name: "Gilroy-Black", size: 13)
                    
                    let normalTextAttributes: [NSAttributedString.Key: Any] = [
                        .font: baseFont as Any  // Проверьте, что шрифт корректно загружен
                    ]
                    
                    let highlightedTextAttributes: [NSAttributedString.Key: Any] = [
                        .font: largerFont as Any,  // Проверьте, что шрифт корректно загружен
                        .underlineStyle: NSUnderlineStyle.single.rawValue
                    ]
                let text = setPrcieTOADopt(forKey: "SliderID3", price: price)
        //            let text1 = "Start 3 days for free, then \(price)/7 days"
                    let attributedString = NSMutableAttributedString(string: text.uppercased(), attributes: normalTextAttributes)

                if let priceRange = attributedString.string.range(of: setPrcieTOADopt(forKey: "SliderID3Cut", price: price).uppercased()) {
                        attributedString.addAttributes(highlightedTextAttributes, range: NSRange(priceRange, in: attributedString.string))
                    }

                    let cell = SubsScrollCollectionCellSight(title: attributedString, subTitle: localizeStringWithValidation(forKey: "SliderID3sub"), imageName: "Star") // Создание экземпляра ячейки
                    sliderStack.addArrangedSubview(cell)
        //        }

        sliderStack.addArrangedSubview(SubsScrollCollectionCellSight(title: sliderNS, subTitle: localizeStringWithValidation(forKey: "SliderID4sub_\(type)"), imageName: "Star"))
    }

    private func prepareLabelsAndAppearance() {
        trialLabel.makeShadowForSight()
        trialLabel.font = UIFont(name: "Gilroy-Bold", size: 11)
        trialLabel.textColor = .white
        trialLabel.textAlignment = .center
        trialLabel.numberOfLines = 2
        trialLabel.adjustsFontSizeToFitWidth = true

        privacyButton.titleLabel?.makeShadowForSight()
        privacyButton.titleLabel?.numberOfLines = 2
        privacyButton.titleLabel?.textAlignment = .center
        privacyButton.titleLabel?.font = UIFont(name: "Poppins", size: 12)

        privacyButton.setTitleColor(.white, for: .normal)
        privacyButton.tintColor = .white
        policyButton.titleLabel?.font = UIFont(name: "Poppins", size: 12)
        policyButton.titleLabel?.makeShadowForSight()
        policyButton.titleLabel?.numberOfLines = 2
        policyButton.titleLabel?.textAlignment = .center
        policyButton.setTitleColor(.white, for: .normal)
        policyButton.tintColor = .white

        descriptionLabel.makeShadowForSight()
        descriptionLabel.textColor = .white
        descriptionLabel.textAlignment = .natural
        descriptionLabel.numberOfLines = 0
    }

    // MARK: config button

    private func calcualteAnimatedButtonUnused() {
        purchaseButton.delegate = self
        purchaseButton.style = .native

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.purchaseButton.prepareAnimatebPlateAnimation()
        }
    }

    // MARK: config localization

    func makeWordsLanguageAdaptable() {
        let description = localizeStringWithValidation(forKey: "iOSAfterID")
        let localizedPrice = price
        descriptionLabel.text = String(format: description, localizedPrice)
        descriptionLabel.font = UIFont(name: "Poppins", size: UIDevice.current.userInterfaceIdiom == .pad ? 12 : 10)

        trialLabel.text = ""//localizeStringWithValidation(forKey: "SliderNoPayment")
        trialStarImageView.image = UIImage(named: "Star")
        trialStarImageView.isHidden = trialLabel.text?.isEmpty ?? true
        privacyButton.titleLabel?.lineBreakMode = .byWordWrapping
        privacyButton.setAttributedTitle(localizeStringWithValidation(forKey: "TermsID").underLined, for: .normal)
        policyButton.titleLabel?.lineBreakMode = .byWordWrapping
        policyButton.setAttributedTitle(localizeStringWithValidation(forKey: "PrivacyID").underLined, for: .normal)
    }

    // MARK: - Actions

    @IBAction
    private func platePrivacyWasClicked(_ sender: UIButton) {
        guard let output = delegate else {
            return
        }
        output.paymentSightPrivacyPressed()
    }

    @IBAction
    private func plateTermsWasClicked(_ sender: UIButton) {
        guard let output = delegate else {
            return
        }
        output.paymentSightTermsPressed()
    }
}

// MARK: - StubSubsAnimatePlateDelegat

extension SubsPaymentSight: StubSubsAnimatePlateDelegat {

    func stubsPlateAnimationWasClicked() {
        print("====> stubsPlateAnimationWasClicked")
        UIApplication.shared.prepareResponseGenSubs(type: .heavy)
        delegate?.paymentSightWasPurchasePressed()
    }
}
