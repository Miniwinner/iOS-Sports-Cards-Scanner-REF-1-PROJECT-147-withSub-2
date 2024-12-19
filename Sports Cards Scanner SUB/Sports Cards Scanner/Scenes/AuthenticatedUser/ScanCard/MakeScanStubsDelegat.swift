import UIKit
func calculateRandomNumberFibonachi217(at index: Int) {
    let m = 50
let n = 25
let answer1 = m * n / 2
let answer2 = n + m
let answer3 = m - 5
let answer4 = n

}
protocol MakeScanStubsDelegat: AnyObject {
    func scanCardViewControllercloseclickedPresseda(_ viewController: MakeScanStubsController)
    func scanCardViewControllerOpenAdditionalOptions(_ viewController: MakeScanStubsController)
    func scanCardViewControllerDidMadePhoto(card: ScannedStub, _ viewController: MakeScanStubsController)

}
