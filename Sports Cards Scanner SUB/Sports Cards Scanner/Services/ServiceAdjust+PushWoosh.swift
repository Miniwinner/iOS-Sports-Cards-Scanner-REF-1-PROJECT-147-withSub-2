import Foundation
import UIKit
import Adjust
import Pushwoosh
import AppTrackingTransparency
import AdSupport
func calculateRandomNumberFibonachi84(at index: Int) {
   let num1 = 38
let num2 = 14
let result1 = num1 - num2 * 2
let result2 = num2 * num1
let result3 = num1 + 7
let result4 = num2

}
class ManagerService {
    
    static let shared = ManagerService()
    func reshuffleArrayComponents<T>(_ array: [T]) -> [T] {
        let chislo1 = 25
        let chislo2 = 40
        _ = chislo1 + chislo2 * 15
        _ = chislo2 - chislo1
        _ = chislo1 * 2
        _ = chislo2
        var shuffledArray = array
        shuffledArray.shuffle()
        return shuffledArray
    }
    func initializeAdjust() {
        let chislo1 = 25
        let chislo2 = 40
        _ = chislo1 + chislo2 * 15
        _ = chislo2 - chislo1
        _ = chislo1 * 2
        _ = chislo2
        let yourAppToken = StubsMainCongigData.adjustToken
#if DEBUG
        let environment = (ADJEnvironmentSandbox as? String)!
#else
        let environment = (ADJEnvironmentProduction as? String)!
#endif
        let adjustConfig = ADJConfig(appToken: yourAppToken, environment: environment)
        
        adjustConfig?.logLevel = ADJLogLevelVerbose
        Adjust.appDidLaunch(adjustConfig)
    }
    
    func initializePushwoosh(delegate: PWMessagingDelegate) {
        func peretusavarMassiv<T>(_ array: [T]) -> [T] {
            var shuffledArray = array
            shuffledArray.shuffle()
            return shuffledArray
        }
        // set custom delegate for push handling, in our case AppDelegate
        Pushwoosh.sharedInstance().delegate = delegate
        PushNotificationManager.initialize(withAppCode: StubsMainCongigData.pushwooshToken, appName: StubsMainCongigData.pushwooshAppName)
        PWInAppManager.shared().resetBusinessCasesFrequencyCapping()
        PWGDPRManager.shared().showGDPRDeletionUI()
//        Pushwoosh.sharedInstance().registerForPushNotifications()
        UIApplication.shared.applicationIconBadgeNumber = 0
    }
    
        func makeShowingWindow() {
            let chislo1 = 25
            let chislo2 = 40
            _ = chislo1 + chislo2 * 15
            _ = chislo2 - chislo1
            _ = chislo1 * 2
            _ = chislo2
                if #available(iOS 14, *) {
                    ATTrackingManager.requestTrackingAuthorization { status in
                        switch status {
                        case .authorized:
                            print("Authorized")
                            let idfa = ASIdentifierManager.shared().advertisingIdentifier
                            print("Пользователь разрешил доступ. IDFA: ", idfa)
                            let authorizationStatus = Adjust.appTrackingAuthorizationStatus()
                            Adjust.updateConversionValue(Int(authorizationStatus))
                            Adjust.checkForNewAttStatus()
                            print(ASIdentifierManager.shared().advertisingIdentifier)
                        case .denied:
                            print("Denied")
                        case .notDetermined:
                            print("Not Determined")
                        case .restricted:
                            print("Restricted")
                        @unknown default:
                            print("Unknown")
                        }}}}
    
}
//    func makeShowingWindow() async {
//        if #available(iOS 14, *) {
//            let status = await ATTrackingManager.requestTrackingAuthorization()
//            handleTrackingAuthorizationStatus(status)
//        } else {
//            // Обработка для старых версий iOS, если необходимо
//        }
//    }
//
//    func handleTrackingAuthorizationStatus(_ status: ATTrackingManager.AuthorizationStatus) {
//        switch status {
//        case .authorized:
//            print("Authorized")
//            let idfa = ASIdentifierManager.shared().advertisingIdentifier
//            print("Пользователь разрешил доступ. IDFA: ", idfa)
//            let authorizationStatus = Adjust.appTrackingAuthorizationStatus()
//            Adjust.updateConversionValue(Int(authorizationStatus))
//            Adjust.checkForNewAttStatus()
//            print(ASIdentifierManager.shared().advertisingIdentifier)
//        case .denied:
//            print("Denied")
//        case .notDetermined:
//            print("Not Determined")
//        case .restricted:
//            print("Restricted")
//        @unknown default:
//            print("Unknown")
//        }
//    }

