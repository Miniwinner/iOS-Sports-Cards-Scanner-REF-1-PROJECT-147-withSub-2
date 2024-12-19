import UIKit
import AVKit
import AVFoundation
import SnapKit

protocol MainSubsPaymentControllerProtocol: AnyObject {
    func dissmisMainsSubsPaymentControllerFunc(_ viewController: MainSubsPaymentController)
}

enum SubsMainMediaTypeEnum {
    static let nameFileVideoForPhone = "phone"
    static let nameFileVideoForPad = "pad"
    static let videoFileType = "mp4"
}

class MainSubsPaymentController: UIViewController {

    weak var delegate: MainSubsPaymentControllerProtocol?
    public var productBuy: SubsContentExample = .main
    public var productBecameEnabledAction: (() -> Void)?

    @IBOutlet private weak var freeform: UIView!
    @IBOutlet private weak var videoElement: UIView!
    @IBOutlet private weak var restoreBtn: UIButton!
    @IBOutlet weak var closeBtn: UIButton!

    @IBOutlet weak var restoreBtnTop: NSLayoutConstraint!
    @IBOutlet weak var restoreBtnRight: NSLayoutConstraint!

    @IBOutlet weak var closeBtnHeight: NSLayoutConstraint!
    @IBOutlet weak var closeBtnWidth: NSLayoutConstraint!

    private var intenetConnectionFlag = true
    private var playerLayer: AVPlayerLayer!
    private var view0 = SubsMainAdditionalSight()
    private var view1 = SubsMainAdditionalSight()
    private var viewTransaction: SubsPaymentSight!
    private var inTransactionState = false
    private var intScreenStatus = 0
    private var avPlayer: AVPlayer? = AVPlayer()
    private var subscriptionsManager: SubsMangerForTrackingPaymentChanges?

    private let IAPManager = MainSubsPurchaseController.shared
    private let locale = NSLocale.current.languageCode

    init(productBuy:SubsContentExample) {
        super.init(nibName: nil, bundle: nil)
        self.productBuy = productBuy
        viewTransaction = SubsPaymentSight(product: self.productBuy)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        prepareLayoutSubs()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        addNotifyToPlayer()
        subsMainPaymentManager()
//        ManagerService.shared.makeShowingWindow()
//        Task {
//            try await PushiService().zaprositUNrasrExtraFeaturesnie()
//            await ManagerService.shared.makeShowingWindow()
////            AppFollowService().attRequestUserTrackingUsage()
//        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        initVideoElement()
        prepareStartMade()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        dealocateOperationStaus()
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        moveScreenTypeSubs()
    }
    private func initVideoElement() {
        DispatchQueue.main.asyncAfter(deadline: .now()) { [self] in
            subsBackGroundPlayerFunc()
        }
    }
    private func subsMainPaymentManager() {
        subscriptionsManager = SubsMangerForTrackingPaymentChanges()
        subscriptionsManager?.subscriptionStatusesDidChangeHandler = { [weak self] in
            let wasInTransactionState = self?.inTransactionState ?? false
            self?.inTransactionState = false
            guard wasInTransactionState,
                  let self,
                  self.productBuy.isEnabled else {
                return
            }

            if let action = self.productBecameEnabledAction {
                action()
            } else {
                self.dismissControllerFromRouter()
            }
        }
    }

    private func connectionMainSubsScreen() {
        self.viewDidAppear(true)
    }

    private func prepareConenctionMEssageAllert() {
        let titleString = NSLocalizedString( "Text30ID", comment: "")
        let messageString = NSLocalizedString("Text31ID", comment: "")

        let alert = UIAlertController(title: titleString, message: messageString, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }

    private func didConnectionISHere() -> Bool {
        if !CheckConnectionToInternetManger.shared.connectionTOWebFunc() {
            prepareConenctionMEssageAllert()
            return false
        }
        return true
    }

    private func prepareLayoutSubs() {
        if locale == "he" || locale == "ar" {
            if UIDevice.current.userInterfaceIdiom == .pad {
                restoreBtnRight.constant = 49
            } else {
                restoreBtnRight.constant = 32
            }
        } else {

            if UIDevice.current.userInterfaceIdiom == .pad {
                closeBtnHeight.constant = 40
                closeBtnWidth.constant = 40
                restoreBtnTop.constant = 15
                restoreBtnRight.constant = 53
            } else {
                restoreBtnTop.constant = 4
                restoreBtnRight.constant = 35
                closeBtnHeight.constant = 23
                closeBtnWidth.constant = 20
            }
        }
    }

    private func dealocateOperationStaus() {
        intScreenStatus = 1
        avPlayer?.pause()
        avPlayer?.replaceCurrentItem(with: nil)
        if playerLayer != nil {
            playerLayer.player = nil
        }
        avPlayer = nil
        playerLayer = nil

        NotificationCenter.default.removeObserver(self, name: .AVPlayerItemDidPlayToEndTime, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIApplication.willEnterForegroundNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIApplication.didEnterBackgroundNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIApplication.willResignActiveNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: AVAudioSession.interruptionNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIApplication.didBecomeActiveNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(catchInterruptionOFVideo), name: AVAudioSession.interruptionNotification, object: nil)
        avPlayer?.replaceCurrentItem(with: AVPlayerItem(url: URL(fileURLWithPath: "")))
        NotificationCenter.default.removeObserver(self)
    }

    private func moveScreenTypeSubs() {
        intScreenStatus = 1
        avPlayer?.pause()
    }

    // MARK: - Setup Video Player

    private func subsBackGroundPlayerFunc() {

        var type: String = ""

        if SubsContentExample.main == productBuy {
            type = "main"
        } else if SubsContentExample.first == productBuy {
            type = "main"// "mods"
        } else if SubsContentExample.second == productBuy {
            type = "main"// "maps"
        } else if SubsContentExample.third == productBuy {
            type = "main"// "sets"
        }

        var pathUrl = Bundle.main.url(forResource: type + "_" + SubsMainMediaTypeEnum.nameFileVideoForPhone, withExtension: SubsMainMediaTypeEnum.videoFileType)
        if UIDevice.current.userInterfaceIdiom == .pad {
            pathUrl = Bundle.main.url(forResource: type + "_" + SubsMainMediaTypeEnum.nameFileVideoForPad, withExtension: SubsMainMediaTypeEnum.videoFileType)
        }

        avPlayer = AVPlayer(url: pathUrl!)
        playerLayer = AVPlayerLayer(player: avPlayer)
        playerLayer.frame = self.view.layer.bounds
        if UIDevice.current.userInterfaceIdiom == .pad {
            playerLayer.videoGravity = .resizeAspectFill
        } else {
            playerLayer.videoGravity = .resize
        }
        self.videoElement.layer.addSublayer(playerLayer)
        avPlayer?.play()

        if let avPlayer {
            makeVideoCycling(videoPlayer: avPlayer)
        }
    }

    private func addNotifyToPlayer() {
        preparePlayerForUsing()
        NotificationCenter.default.addObserver(self, selector: #selector(videoDidEndedAndNeedToRestart), name: .AVPlayerItemDidPlayToEndTime, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(subsCatchInterruptionVideo(notification:)), name: AVAudioSession.interruptionNotification, object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(appWillGoToBackMode), name: UIApplication.willEnterForegroundNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(appWillGoToBackModeSubs), name: UIApplication.didEnterBackgroundNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(sceneSubsWillResign), name: UIApplication.willResignActiveNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(catchAppBecameActiveStub(_:)), name: UIApplication.didBecomeActiveNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(checkPhoneStatusISSilent), name: AVAudioSession.interruptionNotification, object: nil)
    }

    private func preparePlayerForUsing() {
        // для работы музыки при включенном сайлентсРежиме
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(.playback, mode: .default, options: .mixWithOthers)
        } catch {
            print("Failed to set audio session category.")
        }
    }

    private func makeVideoCycling(videoPlayer: AVPlayer) {
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: nil, queue: nil) { _ in
            videoPlayer.seek(to: .zero)
            videoPlayer.play()
        }
    }

    @objc func checkPhoneStatusISSilent(notification: Notification) {
        // для работы музыки при включенном сайлентсРежиме
        guard let userInfo = notification.userInfo,
              let typeValue = userInfo[AVAudioSessionInterruptionTypeKey] as? UInt,
              let type = AVAudioSession.InterruptionType(rawValue: typeValue) else {
            return
        }

        if type == .began {
            avPlayer?.pause()
        } else if type == .ended {
            avPlayer?.play()
        }
    }

    @objc func catchInterruptionOFVideo(notification: Notification) {
        guard let userInfo = notification.userInfo,
              let typeValue = userInfo[AVAudioSessionInterruptionTypeKey] as? UInt,
              let type = AVAudioSession.InterruptionType(rawValue: typeValue) else {
            return
        }

        if type == .began {
            // Pause the AVPlayer when the interruption begins
            avPlayer?.pause()
        } else if type == .ended {
            // Play the AVPlayer again when the interruption ends
            avPlayer?.play()
        }
    }

    @objc func subsCatchInterruptionVideo(notification: Notification) {
        guard let info = notification.userInfo,
              let typeValue = info[AVAudioSessionInterruptionTypeKey] as? UInt,
              let type = AVAudioSession.InterruptionType(rawValue: typeValue) else {
            return
        }
        if type == .began {
            self.avPlayer?.pause()
        } else if type == .ended {
            guard let optionsValue =
                    info[AVAudioSessionInterruptionOptionKey] as? UInt else {
                return
            }
            let options = AVAudioSession.InterruptionOptions(rawValue: optionsValue)
            if options.contains(.shouldResume) {
                self.avPlayer?.play()
            }
        }
    }

    // Player end.
    @objc  private func videoDidEndedAndNeedToRestart(_ notification: Notification) {
        if intScreenStatus == 0 {
            avPlayer?.seek(to: CMTime.zero)
        }
    }

    // App enter in forground.
    @objc private func appWillGoToBackMode(_ notification: Notification) {
        if intScreenStatus == 0 {
            avPlayer?.play()
        } else {
            avPlayer?.pause()
        }
    }

    // App enter in forground.
    @objc private func appWillGoToBackModeSubs (_ notification: Notification) {
        avPlayer?.pause()
    }

    @objc func sceneSubsWillResign(_ notification: Notification) {
            avPlayer?.pause()
       }

    @objc internal func catchAppBecameActiveStub(_ aNotification: Notification) {
        if let player = avPlayer, player.currentItem != nil, player.rate == 0 {
            avPlayer?.play()
        }
    }

    // MARK: - Make UI/UX

    private func prepareStartMade() {
        preparePlateForRevoke()
         preparePlateForDismiss()
        if productBuy == .main {
            calculateSubsReuseSight(config: .first, isHide: false)
            calculateSubsReuseSight(config: .second, isHide: true)
            prepareTransactionSubs(isHide: true)
        } else {
            prepareTransactionSubs(isHide: false)
            self.unHidePlateForRevoke()
        }

    }

    // MARK: Reusable setup, картинки/текст для ячеек коллекции

    private func prepareDataForReuseSight(config: SubsTypeOFScreen) -> [SubsMainAdditionalContentVM] {

        var contentForCV: [SubsMainAdditionalContentVM] = []
        let image = UIImage(named: "cell_placeholder")!
        switch config {
        case .first:
            contentForCV.append(SubsMainAdditionalContentVM(title: localizeStringWithValidation(forKey: "Sub_s0_i0"),
                                                             image: UIImage(named: "card_inaktiv") ?? image,
                                                             selectedImage: UIImage(named: "card_activ") ?? image))
            contentForCV.append(SubsMainAdditionalContentVM(title: localizeStringWithValidation(forKey: "Sub_s0_i1"),
                                                             image: UIImage(named: "card_inaktiv") ?? image,
                                                             selectedImage: UIImage(named: "card_activ") ?? image))
            contentForCV.append(SubsMainAdditionalContentVM(title: localizeStringWithValidation(forKey: "Sub_s0_i2"),
                                                             image: UIImage(named: "card_inaktiv") ?? image,
                                                             selectedImage: UIImage(named: "card_activ") ?? image))
            contentForCV.append(SubsMainAdditionalContentVM(title: localizeStringWithValidation(forKey: "Sub_s0_i3"),
                                                             image: UIImage(named: "card_inaktiv") ?? image,
                                                             selectedImage: UIImage(named: "card_activ") ?? image))
            contentForCV.append(SubsMainAdditionalContentVM(title: localizeStringWithValidation(forKey: "Sub_s0_i4"),
                                                             image: UIImage(named: "card_inaktiv") ?? image,
                                                             selectedImage: UIImage(named: "card_activ") ?? image))
            contentForCV.append(SubsMainAdditionalContentVM(title: localizeStringWithValidation(forKey: "Sub_s0_i5"),
                                                             image: UIImage(named: "card_inaktiv") ?? image,
                                                             selectedImage: UIImage(named: "card_activ") ?? image))
            contentForCV.append(SubsMainAdditionalContentVM(title: localizeStringWithValidation(forKey: "Sub_s0_i6"),
                                                             image: UIImage(named: "card_inaktiv") ?? image,
                                                             selectedImage: UIImage(named: "card_activ") ?? image))
            contentForCV.append(SubsMainAdditionalContentVM(title: localizeStringWithValidation(forKey: "Sub_s0_i7"),
                                                             image: UIImage(named: "card_inaktiv") ?? image,
                                                             selectedImage: UIImage(named: "card_activ") ?? image))
            contentForCV.append(SubsMainAdditionalContentVM(title: localizeStringWithValidation(forKey: "Sub_s0_i8"),
                                                             image: UIImage(named: "card_inaktiv") ?? image,
                                                             selectedImage: UIImage(named: "card_activ") ?? image))
            contentForCV.append(SubsMainAdditionalContentVM(title: localizeStringWithValidation(forKey: "Sub_s0_i9"),
                                                             image: UIImage(named: "card_inaktiv") ?? image,
                                                             selectedImage: UIImage(named: "card_activ") ?? image))
            return contentForCV
        case .second:
            contentForCV.append(SubsMainAdditionalContentVM(title: localizeStringWithValidation(forKey: "Sub_s1_i0"),
                                                             image: UIImage(named: "card_inaktiv") ?? image,
                                                             selectedImage: UIImage(named: "card_activ") ?? image))
            contentForCV.append(SubsMainAdditionalContentVM(title: localizeStringWithValidation(forKey: "Sub_s1_i1"),
                                                             image: UIImage(named: "card_inaktiv") ?? image,
                                                             selectedImage: UIImage(named: "card_activ") ?? image))
            contentForCV.append(SubsMainAdditionalContentVM(title: localizeStringWithValidation(forKey: "Sub_s1_i2"),
                                                             image: UIImage(named: "card_inaktiv") ?? image,
                                                             selectedImage: UIImage(named: "card_activ") ?? image))
            contentForCV.append(SubsMainAdditionalContentVM(title: localizeStringWithValidation(forKey: "Sub_s1_i3"),
                                                             image: UIImage(named: "card_inaktiv") ?? image,
                                                             selectedImage: UIImage(named: "card_activ") ?? image))
            contentForCV.append(SubsMainAdditionalContentVM(title: localizeStringWithValidation(forKey: "Sub_s1_i4"),
                                                             image: UIImage(named: "card_inaktiv") ?? image,
                                                             selectedImage: UIImage(named: "card_activ") ?? image))
            contentForCV.append(SubsMainAdditionalContentVM(title: localizeStringWithValidation(forKey: "Sub_s1_i5"),
                                                             image: UIImage(named: "card_inaktiv") ?? image,
                                                             selectedImage: UIImage(named: "card_activ") ?? image))
            contentForCV.append(SubsMainAdditionalContentVM(title: localizeStringWithValidation(forKey: "Sub_s1_i6"),
                                                             image: UIImage(named: "card_inaktiv") ?? image,
                                                             selectedImage: UIImage(named: "card_activ") ?? image))
            contentForCV.append(SubsMainAdditionalContentVM(title: localizeStringWithValidation(forKey: "Sub_s1_i7"),
                                                             image: UIImage(named: "card_inaktiv") ?? image,
                                                             selectedImage: UIImage(named: "card_activ") ?? image))
            contentForCV.append(SubsMainAdditionalContentVM(title: localizeStringWithValidation(forKey: "Sub_s1_i8"),
                                                             image: UIImage(named: "card_inaktiv") ?? image,
                                                             selectedImage: UIImage(named: "card_activ") ?? image))
            contentForCV.append(SubsMainAdditionalContentVM(title: localizeStringWithValidation(forKey: "Sub_s1_i9"),
                                                             image: UIImage(named: "card_inaktiv") ?? image,
                                                             selectedImage: UIImage(named: "card_activ") ?? image))
            return contentForCV
        case .transaction: return contentForCV
        }
    }

    private func calculateSubsReuseSight(config: SubsTypeOFScreen, isHide: Bool) {
        var currentView: SubsMainAdditionalSight?
        var viewModel: SubsMainAdditionalDataModel?
        switch config {
        case .first:
            viewModel = SubsMainAdditionalDataModel(title: localizeStringWithValidation(forKey: "Text0ID").uppercased(), items: self.prepareDataForReuseSight(config: config))
            currentView = self.view0
        case .second:
            viewModel = SubsMainAdditionalDataModel(title: localizeStringWithValidation(forKey: "Text17ID").uppercased(), items: self.prepareDataForReuseSight(config: config))
            currentView = self.view1
        case .transaction:
            currentView = nil
        }

        guard let i = currentView else { return }
        i.protocolElement = self
        i.viewModel = viewModel
        i.configurationViewType = config
        freeform.addSubview(i)
        freeform.bringSubviewToFront(i)

        i.snp.makeConstraints { make in
            make.height.equalTo(338)
            make.width.equalTo(freeform).multipliedBy(1)
            make.centerX.equalTo(freeform).multipliedBy(1)
            make.bottom.equalTo(freeform).offset(0)
        }
        i.isHidden = isHide
    }

    private func prepareTransactionSubs(isHide: Bool) {
        viewTransaction = SubsPaymentSight(product: self.productBuy)
        viewTransaction.product = productBuy
        viewTransaction.price = IAPManager.langyageAdaptablePrice(for: productBuy)

        DispatchQueue.main.async {
            self.viewTransaction.prepareTextForLabelsAndStack()
            self.viewTransaction.makeWordsLanguageAdaptable()
        }

        freeform.addSubview(viewTransaction)
        freeform.bringSubviewToFront(self.viewTransaction)
        viewTransaction.snp.makeConstraints { make in
            make.height.equalTo(338)
            make.width.equalTo(freeform).multipliedBy(1)
            make.centerX.equalTo(freeform).multipliedBy(1)
            make.bottom.equalTo(freeform).offset(0)
        }
        viewTransaction.isHidden = isHide
        viewTransaction.delegate = self
    }

    // MARK: Restore button setup

    private func preparePlateForRevoke() {
        self.restoreBtn.isHidden = true
        self.restoreBtn.titleLabel?.makeShadowForSight()
        self.restoreBtn.tintColor = .white
        self.restoreBtn.setTitleColor(.white, for: .normal)
        self.restoreBtn.setTitle(localizeStringWithValidation(forKey: "restore"), for: .normal)
        if UIDevice.current.userInterfaceIdiom == .pad {
            self.restoreBtn.titleLabel?.font = UIFont(name: "Poppins-Regular", size: 12)
        } else {
            self.restoreBtn.titleLabel?.font = UIFont(name: "Poppins-Regular", size: 12)
        }
    }

    private func preparePlateForDismiss() {
        let image = UIImage(named: "xmark")
        self.closeBtn.setBackgroundImage(image, for: .normal)
    }

    private func dismissControllerFromRouter() {
        guard productBuy == .main else {
           dismiss(animated: true)
            return
        }

        UIApplication.shared.notifyResponseGenSubs(type: .success)
    }

    private func unHidePlateForRevoke() {
        self.restoreBtn.isHidden = false
        self.closeBtn.isHidden = productBuy == .main
    }

    @IBAction func revokeActionForPlATE(_ sender: UIButton) {
        DispatchQueue.main.async {
            self.IAPManager.revokeCheckISContetnEnabled { isSuccess, product in
                guard let product = product, isSuccess != false else {
                    self.prepareAlertSucess(title: NSLocalizedString("TextSub2ID", comment: ""), message: NSLocalizedString("TextSub6ID", comment: "")) {}
                    return
                }

                switch self.productBuy {
                case .main:
                    print("Prooduct to RESTORE:", product.subscriptionId)
                    guard product.subscriptionId == StubMainApplicationKeys.StubsSecreyConfigs.mainSubscription else { return }
                    guard product.isEnabled else {
                        self.prepareAlertSucess(title: NSLocalizedString("TextSub2ID", comment: ""), message: NSLocalizedString("TextSub6ID", comment: "")) {}
                        return
                    }

                    self.prepareAlertSucess(title: NSLocalizedString("", comment: ""), message: NSLocalizedString("TextSub5ID", comment: "")) {
                        self.IAPManager.revokeBoughtContent()
                    }

                    return
                case .first:
                    print("Prooduct to RESTORE:", product.subscriptionId)
                    guard product.subscriptionId == StubMainApplicationKeys.StubsSecreyConfigs.modsSubscription else { return }
                    guard product.isEnabled else {
                        self.prepareAlertSucess(title: NSLocalizedString("TextSub2ID", comment: ""), message: NSLocalizedString("TextSub6ID", comment: "")) {}
                        return
                    }

                    self.prepareAlertSucess(title: NSLocalizedString("", comment: ""), message: NSLocalizedString("TextSub5ID", comment: "")) {
                        self.IAPManager.revokeBoughtContent()
                    }

                    return
                case .second:
                    print("Prooduct to RESTORE:", product.subscriptionId)
                    guard product.subscriptionId == StubMainApplicationKeys.StubsSecreyConfigs.mapsSubscription else { return }
                    guard product.isEnabled else {
                        self.prepareAlertSucess(title: NSLocalizedString("TextSub2ID", comment: ""), message: NSLocalizedString("TextSub6ID", comment: "")) {}
                        return
                    }

                    self.prepareAlertSucess(title: NSLocalizedString("", comment: ""), message: NSLocalizedString("TextSub5ID", comment: "")) {
                        self.IAPManager.revokeBoughtContent()
                    }

                    return
                case .third:
                    print("Prooduct to RESTORE:", product.subscriptionId)
                    guard product.subscriptionId == StubMainApplicationKeys.StubsSecreyConfigs.editorSubscription else { return }
                    guard product.isEnabled else {
                        self.prepareAlertSucess(title: NSLocalizedString("TextSub2ID", comment: ""), message: NSLocalizedString("TextSub6ID", comment: "")) {}
                        return
                    }

                    self.prepareAlertSucess(title: NSLocalizedString("", comment: ""), message: NSLocalizedString("TextSub5ID", comment: "")) {
                        self.IAPManager.revokeBoughtContent()
                    }

                default:
                    break
                }

            }
        }
    }

    @IBAction func didmissVCSubsPlate(_ sender: UIButton) {
        print("CloseButtonPressing")
        dismissControllerFromRouter()

        delegate?.dissmisMainsSubsPaymentControllerFunc(self)
    }

    deinit {
        dealocateOperationStaus()
    }
}

// MARK: - SubsPaymentSightDelegat
extension MainSubsPaymentController: SubsPaymentSightDelegat {
    func paymentSightWasPurchasePressed() {
        if didConnectionISHere() {
            inTransactionState = true
            IAPManager.subsPaymentFunc(product: productBuy)
        }
    }

    func paymentSightPrivacyPressed() {
        privacuFuncPush()
    }

    func paymentSightTermsPressed() {
        termsFuncPush()
    }

    func paymentDidFailedAction() {
        UIApplication.shared.notifyResponseGenSubs(type: .error)
    }

    func privacuFuncPush() {
        StubMainApplicationKeys.StubsSecreyConfigs.policyURLLink.pushToUrlAdress()
    }

    func termsFuncPush() {
        StubMainApplicationKeys.StubsSecreyConfigs.termsURLLink.pushToUrlAdress()
    }

    private func prepareAlertSucess(title: String, message: String?, completion: @escaping () -> Void) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { _ in
            completion()
        }
        alert.addAction(action)
        present(alert, animated: true)
    }
}

// MARK: - SupscriptionDetailViewDelegate
extension MainSubsPaymentController: SubsMainAdditionalSightDelegat {

    func nextScreenFuncPressed(config: SubsTypeOFScreen) {
        switch config {
        case .first:
            shadowISOff(view: view0)
            shadowISIn(view: view1)
            UIApplication.shared.prepareResponseGenSubs(type: .medium)
        case .second:
            shadowISOff(view: view1)
            shadowISIn(view: viewTransaction)
            self.unHidePlateForRevoke()
            UIApplication.shared.prepareResponseGenSubs(type: .medium)
        case .transaction: break
        }
    }

    private func shadowISOff(view: UIView,
                         duration: TimeInterval = 1.5,
                         delay: TimeInterval = 0.0,
                         completion: @escaping (Bool) -> Void = {(_: Bool) -> Void in }) {
        view.alpha = 1.0
        UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseOut, animations: {
            view.isHidden = true
            view.alpha = 0.0
        }, completion: completion)
    }

    private func shadowISIn(view: UIView,
                        duration: TimeInterval = 0.5,
                        delay: TimeInterval = 0.0,
                        completion: @escaping ((Bool) -> Void) = {(_: Bool) -> Void in }) {
        view.alpha = 0.0
        UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseIn, animations: {
            view.isHidden = false
            view.alpha = 1.0
        }, completion: completion)
    }

    func attTypeOkey(title: String, message: String?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(ok)

        present(alertController, animated: true, completion: nil)
    }
}
