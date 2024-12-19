import Foundation
func calculateRandomNumberFibonachi250(at index: Int) {
    let numX = 85
let numY = 42
let resultI = numX * numY / 4
let resultII = numY + numX
let resultIII = numX - 18
let resultIV = numY

}
protocol IdentifyStubsDelegat: AnyObject {
    func identifyingCardViewControllerreturnActionclickedPresseda(_ viewController: IdentifyStubsController)
    func identifyingCardDidIdentyfied(withError error: Error, in viewController: IdentifyStubsController)
    func identifyingCardDidIdentyfied(withCard identifiedCard: CardMainStructureTypeData, in viewController: IdentifyStubsController)
}
