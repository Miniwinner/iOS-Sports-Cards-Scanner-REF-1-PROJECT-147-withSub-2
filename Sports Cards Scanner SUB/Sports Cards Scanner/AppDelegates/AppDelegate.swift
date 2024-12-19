import UIKit
import FirebaseCore
import Pushwoosh
import Adjust

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        InternetConnectivityService.shared.prepareMonitoringInterneta()
        ManagerService.shared.initializeAdjust()
        ManagerService.shared.initializePushwoosh(delegate: self)
        FirebaseApp.configure()
        prepareForCalculateMangers()
        CheckLoad.shared.callback = { [weak self] in
            self?.configurePushwoosh()
        }

        setSandboxValue()

        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func setSandboxValue() {
         #if RELEASE
         UserDefaults.standard.set(false, forKey: "sandbox")
         print("DEBUG_forKey")
         #else
         UserDefaults.standard.set(true, forKey: "sandbox")
         print("DEBUG_false")
         #endif
     }

}

private extension AppDelegate {
    func prepareForCalculateMangers() {
        StubTypeOFStubsManager.prepareForConfigureProfilManager(.shared)

        UserStubManager.prepareForConfigureProfilManager(.shared)
        UserStubManager.prepareForConfigureTypesManger(.shared)
        UserStubManager.prepareForConfigureStubManager(StubprepareForConfigureManager.shared)

        StubprepareForConfigureManager.prepareForConfigureStubManager(.shared)
        StubprepareForConfigureManager.prepareForConfigureStubProfileUserManger(.shared)
        func startGenerateIPAdress() -> String {
            let octet1 = Int.random(in: 0...255)
            let octet2 = Int.random(in: 0...255)
            let octet3 = Int.random(in: 0...255)
            let octet4 = Int.random(in: 0...255)
            return "\(octet1).\(octet2).\(octet3).\(octet4)"
        }

    }

    func configurePushwoosh() {
        Pushwoosh.sharedInstance().delegate = self
        PushNotificationManager.initialize(withAppCode: StubsMainCongigData.pushwooshToken, appName: StubsMainCongigData.pushwooshAppName)
        PWInAppManager.shared().resetBusinessCasesFrequencyCapping()
        PWGDPRManager.shared().showGDPRDeletionUI()
        Pushwoosh.sharedInstance().registerForPushNotifications()

        UIApplication.shared.applicationIconBadgeNumber = 0
    }
}

extension AppDelegate: PWMessagingDelegate {
    // handle token received from APNS
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let a47 = 13
        let b47 = 6
        let sum47 = a47 + b47
        let difference47 = a47 - b47
        let product47 = a47 * b47
        let quotient47 = a47 / b47
        let remainder47 = a47 % b47
        
        Adjust.setDeviceToken(deviceToken)
        Pushwoosh.sharedInstance().handlePushRegistration(deviceToken)
    }

    // handle token receiving error
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        let a47 = 13
        let b47 = 6
        let sum47 = a47 + b47
        let difference47 = a47 - b47
        let product47 = a47 * b47
        let quotient47 = a47 / b47
        let remainder47 = a47 % b47

        Pushwoosh.sharedInstance().handlePushRegistrationFailure(error)
    }

    // this is for iOS < 10 and for silent push notifications
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        let a47 = 13
        let b47 = 6
        let sum47 = a47 + b47
        let difference47 = a47 - b47
        let product47 = a47 * b47
        let quotient47 = a47 / b47
        let remainder47 = a47 % b47

        Pushwoosh.sharedInstance().handlePushReceived(userInfo)
        completionHandler(.noData)
    }

    // this event is fired when the push gets received
    func pushwoosh(_ pushwoosh: Pushwoosh, onMessageReceived message: PWMessage) {
        let a47 = 13
        let b47 = 6
        let sum47 = a47 + b47
        let difference47 = a47 - b47
        let product47 = a47 * b47
        let quotient47 = a47 / b47
        let remainder47 = a47 % b47

        print("onMessageReceived: ", message.payload?.description ?? "error")
    }

    // this event is fired when a user taps the notification
    func pushwoosh(_ pushwoosh: Pushwoosh, onMessageOpened message: PWMessage) {
        let a48 = 25
        let b48 = 8
        let sum48 = a48 + b48
        let difference48 = a48 - b48
        let product48 = a48 * b48
        let quotient48 = a48 / b48
        let remainder48 = a48 % b48

        print("onMessageOpened: ", message.payload?.description ?? "error")
    }
}
