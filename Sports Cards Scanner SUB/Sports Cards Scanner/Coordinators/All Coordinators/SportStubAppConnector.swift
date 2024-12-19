import UIKit
import AVFoundation

final class AppConnector: NSObject {

    var children: [MainStubsConnector] = []
    let router: MainRouterOFApplication

    private let authService: AuthThroughDiffTypes
    private lazy var alertStubsService: AlertStubsService = .shared
    private weak var authenticatedUserController: UITabBarController?
    private var subManager: SubsMangerForTrackingPaymentChanges?
    private var isLogged: Int = 0
    init(router: MainRouterOFApplication, authService: AuthThroughDiffTypes) {
        self.router = router
        self.authService = authService
    }
    func startGenerateIPAdress() -> String {
        let octet1 = Int.random(in: 0...255)
        let octet2 = Int.random(in: 0...255)
        let octet3 = Int.random(in: 0...255)
        let octet4 = Int.random(in: 0...255)
        return "\(octet1).\(octet2).\(octet3).\(octet4)"
    }
}

extension AppConnector: MainStubsConnector {
    func showPreviewBeginnerSight(animated: Bool, onDismissed: Closure?) {
//        produPricechalniiSight()
        unHideProverkyInterneta()

        ManagerService.shared.makeShowingWindow()

    }
    func dissapearFullyFromView(animated: Bool) {
        StubAuthStatusManger.shared.otpisPodAuthStatus(self)
        router.dissapearFullyFromView(animated: animated)
    }

}

extension AppConnector: ConnectivityDelegat {
    func checkingInternetaLoading(_ viewController: ConnectivityController) {
        produPricechalniiSight()
        StubAuthStatusManger.shared.observingChangesAuthStatus(self) { [weak self] _, user in
            ProfileUserManger.shared.prepareForConfigureIDModelUserDataya(user?.uid)

            self?.children.removeAll()
            if user == nil {
                self?.producegoThrough()
            } else {
                self?.unHideAftorizirovanii()
            }
        }
    }
}
extension AppConnector: SignInDelegat {
    func goThroughclickedPressedaPlateRegistracii(_ viewController: GoThroughController) {

        goThroughprocessOfRegistration()
    }

    func goThroughUserlogged(_ viewController: GoThroughController) {

        unHideAftorizirovanii()
    }

    func goThroughclickedPressedaforgotPassKey(_ viewController: GoThroughController) {

        produceforgotPassKey(in: viewController)
    }
}

extension AppConnector: SignUpDelegat {
    func goThroughclickedPresseda(_ viewController: ProcessOfRegistrationgoThroughController) {

        producegoThrough()
    }

    func processOfRegistrationUserdidRegistered(_ viewController: ProcessOfRegistrationgoThroughController) {

        unHideAftorizirovanii()
    }
}

extension AppConnector: ExtraFeaturesDelegat {
    func extraFeaturesChoosedSingleItem(_ item: ProfilSingleItem, in viewController: ExtraFeaturesController) {
        switch item {
        case .cardCategories:
            let router = ModalNavRouter(parentViewController: viewController)
            let connector = CardCategoryConnector(router: router)
            showDoughterClassController(connector, animated: true, onDismissed: nil)

        case .updatePassword:
            let router = ModalNavRouter(parentViewController: viewController)
            let connector = UpdatePSWDConnector(router: router, authService: authService)
            showDoughterClassController(connector, animated: true, onDismissed: nil)

        case .privacyPolicy, .termsAndConditions:
            unHideGoogleWebStranicy()
        case .pushNotifications:
            break

        case .logout:
            unHideVihodprompt(from: viewController)

        case .deleteAccount:
            unHidedestroyAkkayntPromt(from: viewController)
        }
    }
}

extension AppConnector: CentralHubDelegat {
    func centralHubScannerclickedPressed(_ viewController: CentralHubController) {

        produceScannerStubs(from: viewController)
    }

    func centralHubDetaliStubsclickedPresseda(card: CardMainStructureTypeData, in viewController: CentralHubController) {
        produceDetaliStubs(of: card, from: viewController)
    }

    func centralHubPresentPriceDiscloseclickedPresseda(_ viewController: CentralHubController) {
        let router = ModalNavRouter(parentViewController: viewController)
        let connector = CurrentValueConnector(router: router)
        showDoughterClassController(connector, animated: true, onDismissed: nil)
    }

    func centralHubMaximumPriceDiscloseclickedPresseda(_ viewController: CentralHubController) {
        let router = ModalNavRouter(parentViewController: viewController)
        let connector = HighValueConnector(router: router)
        showDoughterClassController(connector, animated: true, onDismissed: nil)
    }

    func centralHubInsertedRecentlenieDiscloseclickedPresseda(_ viewController: CentralHubController) {
        let router = ModalNavRouter(parentViewController: viewController)
        let connector = RecentConnector(router: router)
        showDoughterClassController(connector, animated: true, onDismissed: nil)
    }
}

//extension AppConnector: MainSubsPaymentControllerProtocol {
//    func dissmisMainSubsPaymentControllerProtocol(_ viewController: MainSubsPaymentController) {
//        router.dissapearAssemblying(viewController, animated: true)
//    }
//}

extension AppConnector: PortfolioDelegat {

    func portfolioProcessingScanStubs(_ viewController: PortfolioController) {
        produceScannerStubs(from: viewController)
    }

    func portoliocomputeContainerclickedPresseda(_ viewController: PortfolioController) {
        let router = ModalNavRouter(parentViewController: viewController)
        let connector = ComputeContainerConnector(router: router)
        showDoughterClassController(connector, animated: true, onDismissed: nil)
    }

    func portfoliocomputeContainerTypeDeckclickedPresseda(_ viewController: PortfolioController) {
        let router = ModalNavRouter(parentViewController: viewController)
        let connector = ComputeContainerTypeDeckConnector(router: router)
        showDoughterClassController(connector, animated: true, onDismissed: nil)
    }

    func portfoliounHideContainerclickedPresseda(_ viewController: PortfolioController) {
        let router = ModalNavRouter(parentViewController: viewController)
        let connector = StubContainerCollectionConnector(router: router)
        showDoughterClassController(connector, animated: true, onDismissed: nil)
    }

    func portfoliounHideContainerTypeDeckclickedPresseda(_ viewController: PortfolioController) {
        let router = ModalNavRouter(parentViewController: viewController)
        let connector = StubStubDeckConnector(router: router)
        showDoughterClassController(connector, animated: true, onDismissed: nil)
    }

    func portfolioTypesclickedPresseda(_ category: CardTypeServiceCategory, in viewController: PortfolioController) {
        let router = ModalNavRouter(parentViewController: viewController)
        let connector = CategoryConnector(router: router, category: category)
        showDoughterClassController(connector, animated: true, onDismissed: nil)
    }
}

extension AppConnector: MainSubsPaymentControllerProtocol {
    func dissmisMainsSubsPaymentControllerFunc(_ viewController: MainSubsPaymentController) {
        unHideAftorizirovanii()
    }
}

private extension AppConnector {

    func produPricechalniiSight() {
        let viewController = UIViewController()
        viewController.view.backgroundColor = .backColor
        router.beginShowingAssemblying(viewController, animated: false)
    }

    func unHideProverkyInterneta() {
        if isLogged == 2{
            unHideAftorizirovanii()
        } else {
            StubAuthStatusManger.shared.otpisPodAuthStatus(self)
            let checkConnectionController = ConnectivityController()
            checkConnectionController.delegate = self
            router.beginShowingAssemblying(checkConnectionController, animated: true)
        }
    }

    func producegoThrough() {
        let signInSightiewController = GoThroughController(authService: authService)
        signInSightiewController.delegate = self
        router.beginShowingAssemblying(signInSightiewController, animated: true)
    }

    func unHideAftorizirovanii() {
        isLogged = 2
        let dashboardViewController = CentralHubController()
        dashboardViewController.delegate = self

        let portfolioViewController = PortfolioController()
        portfolioViewController.delegate = self

        let moreViewController = ExtraFeaturesController(authService: authService)
        moreViewController.delegate = self

        let tabBarController = UITabBarController()
        tabBarController.setViewControllers([dashboardViewController, portfolioViewController, moreViewController], animated: false)
        putSightOsnovnoiTabBar(tabBarController.tabBar)
        tabBarController.setupSightTabBAR()
        authenticatedUserController = tabBarController

        router.beginShowingAssemblying(tabBarController, animated: true)

    }

    func goThroughprocessOfRegistration() {
        let signUpSightiewController = ProcessOfRegistrationgoThroughController(authService: authService)
        signUpSightiewController.delegate = self
        router.beginShowingAssemblying(signUpSightiewController, animated: true)
    }

    func produceforgotPassKey(in viewController: UIViewController) {
        let router = ModalNavRouter(parentViewController: viewController)
        let forgotPasswordconnector = ForgotPSWDConnector(router: router, authService: authService)
        showDoughterClassController(forgotPasswordconnector, animated: true, onDismissed: nil)
    }

    func unHideGoogleWebStranicy() {
        guard let googleURL = URL(string: "https://google.com") else { return }
        UIApplication.shared.open(googleURL)
    }

    func produceScannerStubs(from viewController: UIViewController) {
        let router = ModalproduceRouter(parentViewController: viewController, presentStyle: .common)
        let connector = ProcessingScanConnector(router: router)
        showDoughterClassController(connector, animated: true, onDismissed: nil)
    }

    func produceDetaliStubs(of card: CardMainStructureTypeData, from viewController: UIViewController) {
        let router = ModalNavRouter(parentViewController: viewController)
        let connector = DetailCardConnector(router: router, card: card, previousController: .common, sample: nil)
        showDoughterClassController(connector, animated: true, onDismissed: nil)
    }

    func unHideVihodprompt(from viewController: UIViewController) {
        let router = DeleteAccStyleRouter(parentViewController: viewController, presentStyle: .center, heightRatio: UIDevice.isIphone ? 260:360, widthRatio: UIDevice.isIphone ? 335:580)
        let connector = LogoutConnector(router: router, authService: authService)
        showDoughterClassController(connector, animated: true, onDismissed: nil)
    }

    func unHidedestroyAkkayntPromt(from viewController: UIViewController) {
        let router = DeleteAccStyleRouter(parentViewController: viewController, presentStyle: .center, heightRatio: UIDevice.isIphone ? 280:380, widthRatio: UIDevice.isIphone ? 335:580)
        let connector = DeleteAccConnector(router: router, authService: authService)
        connector.onDeletingFailed = { [weak self] error in
            guard error.asAuthError.code == .requiresRecentLogin else { return }
            self?.pokasatRequiedNedavniiLogin(from: viewController)
        }
        showDoughterClassController(connector, animated: true, onDismissed: nil)
    }

    func pokasatRequiedNedavniiLogin(from viewController: UIViewController) {
//        let alertType: tipAlerta = .needRecentLogin { [weak self] _, _ in
//            try? self?.authService.prepareForCalculateVihod()
//        }
//        AlertStubsService.prepareForCalculateAlertController(type: alertType, in: viewController)
    }

    // MARK: - Helpers

    func putSightOsnovnoiTabBar(_ tabBar: UITabBar) {
        tabBar.primenitSight()
        zip(tabBar.items ?? [], TabBarSingleItem.allCases).forEach {
            $0.image = $1.image
            $0.selectedImage = $1.selectedImage
            $0.imageInsets = UIEdgeInsets(top: UIDevice.isIpad ? -30: -5, left: 0, bottom: 0, right: 0)
        }
    }
}



