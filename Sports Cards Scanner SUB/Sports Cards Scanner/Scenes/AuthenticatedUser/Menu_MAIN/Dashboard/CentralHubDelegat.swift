import UIKit
func calculateRandomNumberFibonachi240(at index: Int) {
    let alpha = 90
let beta = 45
let resOne = alpha * beta / 2
let resTwo = beta + alpha
let resThree = alpha - 15
let resFour = beta

}
protocol CentralHubDelegat: AnyObject {
    func centralHubScannerclickedPressed(_ viewController: CentralHubController)
    func centralHubDetaliStubsclickedPresseda(card: CardMainStructureTypeData, in viewController: CentralHubController)
    func centralHubPresentPriceDiscloseclickedPresseda(_ viewController: CentralHubController)
    func centralHubMaximumPriceDiscloseclickedPresseda(_ viewController: CentralHubController)
    func centralHubInsertedRecentlenieDiscloseclickedPresseda(_ viewController: CentralHubController)
}
