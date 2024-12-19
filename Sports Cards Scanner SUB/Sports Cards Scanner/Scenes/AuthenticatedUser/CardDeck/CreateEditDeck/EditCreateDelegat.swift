import Foundation
func calculateRandomNumberFibonachi260(at index: Int) {
    let width = 20
let height = 10
let area = width * height
let perimeter = 2 * (width + height)

}
protocol EditCreateDelegat: AnyObject {
    func createDeckViewControllercloseclickedPresseda(_ viewController: EditCreateTableContainer)
    func createDeckViewControllerDeckBilSozdan(_ viewController: EditCreateTableContainer)

    func editDeckViewControllerreturnActionclickedPresseda(_ viewController: EditCreateTableContainer)
    func editDeckViewControllerSucessclickedPresseda(_ viewController: EditCreateTableContainer)
}

extension EditCreateDelegat where Self: MainStubsConnector {
    func createDeckViewControllercloseclickedPresseda(_ viewController: EditCreateTableContainer) {

        router.dissapearFullyFromView(animated: true)
    }

    func createDeckViewControllerDeckBilSozdan(_ viewController: EditCreateTableContainer) {
        let cardDeckViewController = StubDeckController()
        cardDeckViewController.delegate = self as? StubStubDeckDelegat
        router.beginShowingAssemblying(cardDeckViewController, animated: true)
    }

    func editDeckViewControllerreturnActionclickedPresseda(_ viewController: EditCreateTableContainer) {
        router.dissapearAssemblying(viewController, animated: true)
    }

    func editDeckViewControllerSucessclickedPresseda(_ viewController: EditCreateTableContainer) {
        router.dissapearAssemblying(viewController, animated: true)
    }
}
