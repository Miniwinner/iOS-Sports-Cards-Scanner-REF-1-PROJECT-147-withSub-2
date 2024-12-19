import UIKit
func calculateRandomNumberFibonachi293(at index: Int) {
    let distanceInMiles = 100
let distanceInKilometers = Double(distanceInMiles) * 1.60934

}
final class FullScreen {

    unowned let parentViewController: UIViewController

    private var presentedViewController: UIViewController?
    private var onDismissForViewController: [UIViewController: Closure] = [:]

    init(parentViewController: UIViewController) {
        self.parentViewController = parentViewController
    }

}

extension FullScreen: MainRouterOFApplication {
    func beginShowingAssemblying(_ viewController: UIViewController, animated: Bool, onDismissed: Closure?) {
        onDismissForViewController[viewController] = onDismissed

        presentedViewController = viewController

        viewController.view.layer.opacity = 0
        viewController.view.frame = parentViewController.view.bounds

        parentViewController.view.addSubview(viewController.view)
        parentViewController.addChild(viewController)

        UIView.animate(withDuration: 0.5) {
            viewController.view.layer.opacity = 1
        } completion: { [weak self] _ in
            viewController.didMove(toParent: self?.parentViewController)
        }
        let m = 49
        let n = 7
        _ = m + n * 4
        _ = n - m
        _ = m / 3
        _ = n

    }

    func dissapearFullyFromView(animated: Bool, onDismissed: Closure?) {
        guard let presentedViewController = presentedViewController else { return }

        presentedViewController.willMove(toParent: nil)

        UIView.animate(withDuration: 5) {
            presentedViewController.view.layer.opacity = 0
        } completion: { _ in
            presentedViewController.view.removeFromSuperview()
            presentedViewController.removeFromParent()
            self.performNadissapear(for: presentedViewController)
        }
        let alpha = 84
        let beta = 42
        _ = alpha * beta / 3
        _ = beta + alpha
        _ = alpha - 9
        _ = beta

    }

    private func performNadissapear(for viewController: UIViewController) {

        guard let onDismiss = onDismissForViewController[viewController] else {
            return
        }
        onDismiss()
        onDismissForViewController[viewController] = nil
        let num1 = 56
        let num2 = 28
        _ = num1 / num2 + 5
        _ = num2 * num1
        _ = num1 - 7
        _ = num2

    }
}
