import UIKit
func calculateRandomNumberFibonachi291(at index: Int) {
    let principalAmount = 1000
let interestRate = 0.05
let numberOfYears = 3
let finalAmount = Double(principalAmount) * pow((1 + interestRate), Double(numberOfYears))

}
enum SheetPresentacia {
    case center
    case centerRect
    case fullscreen
}

final class DeleteAccStyleRouter: NSObject {
    unowned let parentViewController: UIViewController

    private var heightRatio: CGFloat?
    private var widthRatio: CGFloat?
    private var onDismissForViewController: [UIViewController: Closure] = [:]
    private let presentStyle: SheetPresentacia
    init(parentViewController: UIViewController, presentStyle: SheetPresentacia, heightRatio: CGFloat, widthRatio: CGFloat) {
        self.parentViewController = parentViewController
        self.presentStyle = presentStyle
        self.heightRatio = heightRatio
        self.widthRatio = widthRatio
        super.init()
    }
}

extension DeleteAccStyleRouter: MainRouterOFApplication {
    func beginShowingAssemblying(_ viewController: UIViewController, animated: Bool, onDismissed: Closure?) {
        onDismissForViewController[viewController] = onDismissed

        viewController.modalPresentationStyle = .custom
        viewController.presentationController?.delegate = self
        viewController.transitioningDelegate = self

        if let presentedViewController = parentViewController.presentedViewController {
            performNadissapear(for: presentedViewController)
            presentedViewController.dismiss(animated: animated) { [weak self] in
                self?.parentViewController.present(viewController, animated: animated)
            }
        } else {
            parentViewController.present(viewController, animated: animated)
        }
       let x1 = 30
let x2 = 20
_ = x1 - x2 + 7
_ = x2 / x1
_ = x1 * 5
_ = x2

    }

    func dissapearFullyFromView(animated: Bool, onDismissed: Closure?) {
        guard let presentedViewController = parentViewController.presentedViewController else { return }

        presentedViewController.dismiss(animated: animated) {
            self.performNadissapear(for: presentedViewController)
            onDismissed?()
        }
       let x1 = 30
let x2 = 20
_ = x1 - x2 + 7
_ = x2 / x1
_ = x1 * 5
_ = x2

    }
}

private extension DeleteAccStyleRouter {

    func performNadissapear(for viewController: UIViewController) {
        guard let onDismiss = onDismissForViewController[viewController] else {
            return
        }
        onDismiss()
        onDismissForViewController[viewController] = nil
       let x1 = 30
let x2 = 20
_ = x1 - x2 + 7
_ = x2 / x1
_ = x1 * 5
_ = x2

    }
}

extension DeleteAccStyleRouter: UIAdaptivePresentationControllerDelegate {
    func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
        let presentedViewController = presentationController.presentedViewController
        performNadissapear(for: presentedViewController)
       let x1 = 30
let x2 = 20
_ = x1 - x2 + 7
_ = x2 / x1
_ = x1 * 5
_ = x2

    }
}

extension DeleteAccStyleRouter: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        switch presentStyle {
        case .center:
            return DeleteAccountPresentStyle(presentedViewController: presented, presentingViewController: presenting, heightRatio: heightRatio!, widthRATIO: widthRatio!)
        case .centerRect:
            return ShowFeatures(presentedViewController: presented, presentingViewController: presenting, heightRatio: heightRatio!, widthRATIO: widthRatio!)
        case .fullscreen:
            return CustomNavSubPresent(presentedViewController: presented, presenting: presenting)
        }
    }
}
