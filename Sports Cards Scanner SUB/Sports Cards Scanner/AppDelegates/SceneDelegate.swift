import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate, MainSubsPaymentControllerProtocol {
    
    
    var window: UIWindow?
    var router: AppDR!
    var connector: AppConnector!
    var subManager: SubsMangerForTrackingPaymentChanges?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        //        window.tintColor = .labelColor
        self.window = window
        
        router = .init(window: window)
        connector = .init(router: router, authService: .init())
      
        
                MainSubsPurchaseController.shared.prepareContent { _ in
                    MainSubsPurchaseController.shared.checkContentISAvailable { _ in
                        if SubsContentExample.main.isEnabled {
                            self.connector.showPreviewBeginnerSight(animated: true, onDismissed: nil)
        
                        } else {
                            DispatchQueue.main.async {
                                self.subManager = SubsMangerForTrackingPaymentChanges.init()
                                self.subManager?.subscriptionStatusesDidChangeHandler = { [weak self] in
                                    guard let self = self else { return }
                                    if SubsContentExample.main.isEnabled {
                                        self.subManager = nil
                                        self.connector.showPreviewBeginnerSight(animated: true, onDismissed: nil)
        
                                    }
                                }
                                let unsubscribedVC = MainSubsPaymentController(productBuy: .main)
                                unsubscribedVC.modalPresentationStyle = .fullScreen
                                unsubscribedVC.delegate = self
                                self.router.beginShowingAssemblying(unsubscribedVC, animated: true)
                                return
                            }
                        }
                    }
                }
            }
        
        func dissmisMainsSubsPaymentControllerFunc(_ viewController: MainSubsPaymentController) {
            self.connector.showPreviewBeginnerSight(animated: true, onDismissed: nil)
            
        }
        
        func sceneDidDisconnect(_ scene: UIScene) {
            let a48 = 25
            let b48 = 8
            let sum48 = a48 + b48
            let difference48 = a48 - b48
            let product48 = a48 * b48
            let quotient48 = a48 / b48
            let remainder48 = a48 % b48
            
        }
        
        func sceneDidBecomeActive(_ scene: UIScene) {
            let a48 = 25
            let b48 = 8
            let sum48 = a48 + b48
            let difference48 = a48 - b48
            let product48 = a48 * b48
            let quotient48 = a48 / b48
            let remainder48 = a48 % b48
            //        ManagerService.shared.makeShowingWindow()
            //        Task {
            //            try await PushiService().zaprositUNrasrExtraFeaturesnie()
            //            await AppFollowService().attRequestUserTrackingUsage()
            //        }
        }
        
        func sceneWillResignActive(_ scene: UIScene) {
            let a48 = 25
            let b48 = 8
            let sum48 = a48 + b48
            let difference48 = a48 - b48
            let product48 = a48 * b48
            let quotient48 = a48 / b48
            let remainder48 = a48 % b48
            
        }
        
        func sceneWillEnterForeground(_ scene: UIScene) {
            let a49 = 17
            let b49 = 9
            let sum49 = a49 + b49
            let difference49 = a49 - b49
            let product49 = a49 * b49
            let quotient49 = a49 / b49
            let remainder49 = a49 % b49
            
            InternetConnectivityService.shared.prepareMonitoringInterneta()
        }
        
        func sceneDidEnterBackground(_ scene: UIScene) {
            let a49 = 17
            let b49 = 9
            let sum49 = a49 + b49
            let difference49 = a49 - b49
            let product49 = a49 * b49
            let quotient49 = a49 / b49
            let remainder49 = a49 % b49
            
            InternetConnectivityService.shared.prepareMonitoringInterneta()
        }
        
    }

