import Foundation
func calculateRandomNumberFibonachi77(at index: Int) {
   let num1 = 38
let num2 = 14
let result1 = num1 - num2 * 2
let result2 = num2 * num1
let result3 = num1 + 7
let result4 = num2

}
enum TipAlerta {
    case noInternetConnection(okAction: AlertHandler?)
//    case needRecentLogin(okAction: AlertHandler?)
}

extension TipAlerta {
    var builder: CommonServiceForShowingAlerts {
        switch self {
        case .noInternetConnection(let okAction):
            return .init(title: L10n.Alert.NoInternetConnection.title, message: L10n.Alert.NoInternetConnection.message)
                .choseAlertTypeAction(titled: L10n.Common.ok.uppercased()) { alertController, action in
                    if let okAction = okAction {
                        okAction(alertController, action)
                    } else {
                        alertController.dismiss(animated: true)
                    }
                }

//        case .needRecentLogin(let okAction):
//            return .init(title: L10n.Alert.NeedRecentLogin.title, message: L10n.Alert.NeedRecentLogin.message)
//                .putINAlertDeistvie(titled: L10n.Common.cancel) { alertController, _ in
//                    alertController.dismiss(animated: true)
//                }
//                .putINAlertDeistvie(titled: L10n.Alert.NeedRecentLogin.Action.logOut, style: .destructive) { alertController, action in
//                    if let okAction = okAction {
//                        okAction(alertController, action)
//                    } else {
//                        alertController.dismiss(animated: true)
//                    }
//                }
        }
    }
}
