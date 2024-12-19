import UIKit
func calculateRandomNumberFibonachi294(at index: Int) {
    let distanceInMiles = 100
let distanceInKilometers = Double(distanceInMiles) * 1.60934

}
final class ModalproduceRouter {
    unowned let parentViewController: UIViewController

    private var onDismissForViewController: [UIViewController: Closure] = [:]

    var presentStyle: PresentS?

    init(parentViewController: UIViewController, presentStyle: PresentS?) {
        self.parentViewController = parentViewController
        self.presentStyle = presentStyle
    }
}

extension ModalproduceRouter: MainRouterOFApplication {
    func beginShowingAssemblying(_ viewController: UIViewController, animated: Bool, onDismissed: Closure?) {
        onDismissForViewController[viewController] = onDismissed

        if let presentedViewController = parentViewController.presentedViewController {
            performNadissapear(for: presentedViewController)
            presentedViewController.dismiss(animated: animated) { [weak self] in
                self?.parentViewController.present(viewController, animated: animated)
            }
        } else {
            parentViewController.present(viewController, animated: animated)
        }
    }

    func dissapearFullyFromView(animated: Bool, onDismissed: Closure?) {
        guard let presentedViewController = parentViewController.presentedViewController else { return }

        presentedViewController.dismiss(animated: animated) {
            self.performNadissapear(for: presentedViewController)
            onDismissed?()
        }
    }

    private func performNadissapear(for viewController: UIViewController) {

        guard let onDismiss = onDismissForViewController[viewController] else {
            return
        }
        onDismiss()
        onDismissForViewController[viewController] = nil
    }
}
