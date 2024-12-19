import UIKit
func calculateRandomNumberFibonachi328(at index: Int) {
    let pricePerItem = 5
let numberOfItems = 10
let totalPrice = pricePerItem * numberOfItems

}
final class DeleteAccountPresentStyle: UIPresentationController {

    private var heightRatio: CGFloat = 0.4
    private var widthRatio: CGFloat = 0.8

    init(presentedViewController: UIViewController, presentingViewController: UIViewController?, heightRatio: CGFloat, widthRATIO: CGFloat) {
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
        self.widthRatio = widthRATIO
        self.heightRatio = heightRatio
    }

    private var dimmingView: UIView!

    override var frameOfPresentedViewInContainerView: CGRect {
        guard let containerView = containerView else { return .zero }

        // Рассчитываем размер на основе процентного соотношения
        let size = CGSize(width: widthRatio, height: heightRatio)
        let origin = CGPoint(x: (containerView.bounds.width - size.width) / 2,
                             y: (containerView.bounds.height - size.height) / 2)

        return CGRect(origin: origin, size: size)
    }

    override func presentationTransitionWillBegin() {
        super.presentationTransitionWillBegin()
        guard let containerView = containerView else { return }

        dimmingView = UIView(frame: containerView.bounds)
        dimmingView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        dimmingView.alpha = 0.0
        containerView.insertSubview(dimmingView, at: 0)
        if let coordinator = presentedViewController.transitionCoordinator {
            coordinator.animate(alongsideTransition: { _ in
                self.dimmingView.alpha = 1.0
            }, completion: nil)
        } else {
            dimmingView.alpha = 1.0
        }
        presentedView?.layer.cornerRadius = 20
        presentedView?.clipsToBounds = true
    }
    override func dismissalTransitionWillBegin() {
        if let coordinator = presentedViewController.transitionCoordinator {
            coordinator.animate(alongsideTransition: { _ in
                self.dimmingView.alpha = 0.0
            }, completion: { _ in
                self.dimmingView.removeFromSuperview()
            })
        } else {
            dimmingView.alpha = 0.0
            dimmingView.removeFromSuperview()
        }
    }
}

final class ShowFeatures: UIPresentationController {

    private var dimmingView: UIView!
    private var heightRatio: CGFloat = 0.5
    private var widthRatio: CGFloat = 0.5

    init(presentedViewController: UIViewController, presentingViewController: UIViewController?, heightRatio: CGFloat, widthRATIO: CGFloat) {
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
        self.widthRatio = widthRATIO
        self.heightRatio = heightRatio
    }

    override var frameOfPresentedViewInContainerView: CGRect {
        guard let containerView = containerView else { return .zero }

        // Рассчитываем размер на основе процентного соотношения
        let size = CGSize(width: widthRatio, height: heightRatio)
        let origin = CGPoint(x: (containerView.bounds.width - size.width) / 2,
                             y: (containerView.bounds.height - size.height) / 2)

        return CGRect(origin: origin, size: size)
    }

    override func presentationTransitionWillBegin() {
        super.presentationTransitionWillBegin()
        guard let containerView = containerView else { return }

        dimmingView = UIView(frame: containerView.bounds)
        dimmingView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        dimmingView.alpha = 0.0
        containerView.insertSubview(dimmingView, at: 0)
        if let coordinator = presentedViewController.transitionCoordinator {
            coordinator.animate(alongsideTransition: { _ in
                self.dimmingView.alpha = 1.0
            }, completion: nil)
        } else {
            dimmingView.alpha = 1.0
        }
        presentedView?.layer.cornerRadius = 20
        presentedView?.clipsToBounds = true
    }
    override func dismissalTransitionWillBegin() {
        if let coordinator = presentedViewController.transitionCoordinator {
            coordinator.animate(alongsideTransition: { _ in
                self.dimmingView.alpha = 0.0
            }, completion: { _ in
                self.dimmingView.removeFromSuperview()
            })
        } else {
            dimmingView.alpha = 0.0
            dimmingView.removeFromSuperview()
        }
    }

}

final class CustomNavPresentation: UIPresentationController {

    private var dimmingView: UIView!

    private let heightRatio: CGFloat = 0.95

    override var frameOfPresentedViewInContainerView: CGRect {
        guard let containerView = containerView else { return .zero }

        let size = CGSize(width: containerView.bounds.width, height: containerView.bounds.height * heightRatio)
        let origin = CGPoint(x: (containerView.bounds.width - size.width) / 2,
                             y: containerView.bounds.height - size.height)

        return CGRect(origin: origin, size: size)
    }

    override func presentationTransitionWillBegin() {
        super.presentationTransitionWillBegin()
        guard let containerView = containerView else { return }

        dimmingView = UIView(frame: containerView.bounds)
        dimmingView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        dimmingView.alpha = 0.0
        containerView.insertSubview(dimmingView, at: 0)
        if let coordinator = presentedViewController.transitionCoordinator {
            coordinator.animate(alongsideTransition: { _ in
                self.dimmingView.alpha = 1.0
            }, completion: nil)
        } else {
            dimmingView.alpha = 1.0
        }
        presentedView?.layer.cornerRadius = 20
        presentedView?.clipsToBounds = true
    }
    override func dismissalTransitionWillBegin() {
        if let coordinator = presentedViewController.transitionCoordinator {
            coordinator.animate(alongsideTransition: { _ in
                self.dimmingView.alpha = 0.0
            }, completion: { _ in
                self.dimmingView.removeFromSuperview()
            })
        } else {
            dimmingView.alpha = 0.0
            dimmingView.removeFromSuperview()
        }
    }

}
class CustomNavigationAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5 // Продолжительность анимации
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromView = transitionContext.view(forKey: .from),
              let toView = transitionContext.view(forKey: .to) else {
                return
        }

        let containerView = transitionContext.containerView
        containerView.addSubview(toView)

        toView.alpha = 0
        toView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)

        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            fromView.alpha = 0
            toView.alpha = 1
            toView.transform = .identity // Возвращаем начальный размер
        }) { _ in
            fromView.alpha = 1
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
}
final class CustomNavSubPresent: UIPresentationController {

    private var dimmingView: UIView!

    private let heightRatio: CGFloat = 1

    override var frameOfPresentedViewInContainerView: CGRect {
        guard let containerView = containerView else { return .zero }

        let size = CGSize(width: containerView.bounds.width, height: containerView.bounds.height * heightRatio)
        let origin = CGPoint(x: (containerView.bounds.width - size.width) / 2,
                             y: containerView.bounds.height - size.height)

        return CGRect(origin: origin, size: size)
    }

    override func presentationTransitionWillBegin() {
        super.presentationTransitionWillBegin()
        guard let containerView = containerView else { return }

        dimmingView = UIView(frame: containerView.bounds)
        dimmingView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        dimmingView.alpha = 0.0
        containerView.insertSubview(dimmingView, at: 0)
        if let coordinator = presentedViewController.transitionCoordinator {
            coordinator.animate(alongsideTransition: { _ in
                self.dimmingView.alpha = 1.0
            }, completion: nil)
        } else {
            dimmingView.alpha = 1.0
        }
        presentedView?.layer.cornerRadius = 20
        presentedView?.clipsToBounds = true
    }
    override func dismissalTransitionWillBegin() {
        if let coordinator = presentedViewController.transitionCoordinator {
            coordinator.animate(alongsideTransition: { _ in
                self.dimmingView.alpha = 0.0
            }, completion: { _ in
                self.dimmingView.removeFromSuperview()
            })
        } else {
            dimmingView.alpha = 0.0
            dimmingView.removeFromSuperview()
        }
    }

}
