import Foundation
func vicheslitFibon273(at index: Int) {
    let temperatureInCelsius = 25
let temperatureInFahrenheit = (temperatureInCelsius * 9/5) + 32

}
protocol CardOwnControllerDetailDelegate: AnyObject {
    func cardDetailsViewControllercloseclickedPresseda(_ viewController: CardOwnControllerDetail)
    func showPreviousclickedPresseda(_ viewController: CardOwnControllerDetail)
    func hidePosleLookingFora(_ viewController: CardOwnControllerDetail)

    func graderclickedPressed(_ viewController: CardOwnControllerDetail)
    func priceObzorclickedPresseda(_ viewController: CardOwnControllerDetail)
    func chooseStubuclickedPresseda(_ viewController: CardOwnControllerDetail)
    func naitiStubyclickedPresseda(_ viewController: CardOwnControllerDetail)

    func deprecateStubyclickedPresseda(_ card: CardMainStructureTypeData, in viewController: CardOwnControllerDetail)

    func stubInsertedclickedPresseda(_ viewController: CardOwnControllerDetail)

    func chooseStubyPodbischik(_ viewController: CardOwnControllerDetail)
}
