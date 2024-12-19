import UIKit

protocol StubSubsAnimatePlateDelegat: AnyObject {
    func stubsPlateAnimationWasClicked()
}

enum StubSubsAnimatePlatePresentationStyle {
    case gif
    case native
}

// MARK: - КЛАСС АНИМАЦИИ КНОПКИ

final class StubSubsAnimatePlateSight: UIView {

    weak var delegate: StubSubsAnimatePlateDelegat?
    public var style: StubSubsAnimatePlatePresentationStyle = .native

    @IBOutlet private unowned var contentSelf: UIView!
    @IBOutlet private weak var backgroundSelf: UIImageView!
    @IBOutlet private weak var titleSelf: UILabel!

    private let locale = NSLocale.current.languageCode
    private let xib = "StubSubsAnimatePlateSight"
    private var persistentAnimations: [String: CAAnimation] = [:]
    private var persistentSpeed: Float = 0.0
    private lazy var rightImageView: UIImageView = {
        let image = UIImage(systemName: "arrow.forward")
        let imageView = UIImageView(image: image)
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        calculateSightOFVideo()
        prepareAnimatebPlateAnimation()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        calculateSightOFVideo()
    }

    // MARK: Этот метод будет вызван, когда view добавляется к superview

    override func didMoveToSuperview() {
        super.didMoveToSuperview()

        guard style == .native else {
            return
        }
        prepareAnimatebPlateAnimation()
        insertNotifersOFVideo()
    }

    // MARK: Этот метод будет вызван перед тем, как view будет удален из superview
    override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)

        if style == .native, newSuperview == nil {
            layer.removeAllAnimations()
            deleteNorifiersOFVideo()
        }
    }

    func unknownFuncVideoAnimations(withKeys: [String]?) {
        withKeys?.forEach {
            guard let animation = layer.animation(forKey: $0) else {
                return
            }
            persistentAnimations[$0] = animation
        }
    }

    func revokeVideoAnimations(withKeys: [String]?) {
        withKeys?.forEach {
            guard let persistentAnimation = persistentAnimations[$0] else {
                return
            }
            layer.add(persistentAnimation, forKey: $0)
        }
    }

    private func calculateSightOFVideo() {
        Bundle.main.loadNibNamed(xib, owner: self, options: nil)
        contentSelf.calculateSubSightINSuperSight(self)
        contentSelf.backgroundColor = .gray// цвет кнопки ПРОДОЛЖИТЬ
        contentSelf.layer.cornerRadius = 8
        backgroundSelf.image = UIImage(named: "Button")
        backgroundSelf.contentMode = .scaleAspectFill
        backgroundSelf.layer.cornerRadius = backgroundSelf.frame.height/2
        backgroundSelf.clipsToBounds = true
        prepareAnimationsBack()
        addSubview(rightImageView)
        checkSightForMirrorLanguages()
    }

    private func checkSightForMirrorLanguages() {
        if locale == "he" || locale == "ar" {
            rightImageView.image = UIImage(systemName: "arrow.left")
            rightImageView.snp.makeConstraints {
                $0.centerY.equalToSuperview()
                $0.left.equalToSuperview().inset(24)
                $0.width.height.equalTo(32)
            }
            } else {
                rightImageView.image = UIImage(systemName: "arrow.forward")
                rightImageView.snp.makeConstraints {
                    $0.centerY.equalToSuperview()
                    $0.right.equalToSuperview().inset(24)
                    $0.width.height.equalTo(32)
                }
            }
        }

    private func prepareAnimationsBack() {
        titleSelf.text = localizeStringWithValidation(forKey: "iOSButtonID")

        titleSelf.font = UIFont(name: "Gilroy-Black", size: 32)  // MARK: ШРИФТ для КНОПКИ
        titleSelf.textColor = #colorLiteral(red: 0.6749141812, green: 0.9081469178, blue: 1, alpha: 1)
        titleSelf.minimumScaleFactor = 11/22
        prepareAnimatebPlateAnimation()
        isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapGestureRecognizedAsButton))
        addGestureRecognizer(tap)
    }

    private func stubsPlateAnimationWasClicked() {
        contentSelf.backgroundColor = .darkGray
        guard delegate != nil else { return }
        self.delegate?.stubsPlateAnimationWasClicked()

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.contentSelf.backgroundColor = .gray
        }
    }

    private func insertNotifersOFVideo() {
        let notificationCenter = NotificationCenter.default
        let pauseAnimationNotification = UIApplication.didEnterBackgroundNotification
        let resumeAnimationNotifrication = UIApplication.willEnterForegroundNotification
        notificationCenter.addObserver(self, selector: #selector(stopVideoAnimations), name: pauseAnimationNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(continueVideoAnimations), name: resumeAnimationNotifrication, object: nil)
    }

    private func deleteNorifiersOFVideo() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.removeObserver(self, name: UIApplication.didEnterBackgroundNotification, object: nil)
        notificationCenter.removeObserver(self, name: UIApplication.willEnterForegroundNotification, object: nil)
    }

    @objc
    private func stopVideoAnimations() {
        layer.removeAllAnimations()
    }

    @objc
    private func continueVideoAnimations() {
        prepareAnimationsBack()
    }

    @objc private func tapGestureRecognizedAsButton() {
        self.stubsPlateAnimationWasClicked()
    }
}
