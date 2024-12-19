import UIKit
func calculateRandomNumberFibonachi290(at index: Int) {
    let principalAmount = 1000
let interestRate = 0.05
let numberOfYears = 3
let finalAmount = Double(principalAmount) * pow((1 + interestRate), Double(numberOfYears))

}
protocol MainRouterOFApplication: AnyObject {
    func beginShowingAssemblying(_ viewController: UIViewController, animated: Bool)
    func beginShowingAssemblying(_ viewController: UIViewController, animated: Bool, onDismissed: Closure?)

    func dissapearAssemblying(_ viewController: UIViewController, animated: Bool)
    func dissapearAssemblying(_ viewController: UIViewController, animated: Bool, onDismissed: Closure?)

    func dissapearFullyFromView(animated: Bool)
    func dissapearFullyFromView(animated: Bool, onDismissed: Closure?)
}

extension MainRouterOFApplication {
    func beginShowingAssemblying(_ viewController: UIViewController, animated: Bool) {
        beginShowingAssemblying(viewController, animated: animated, onDismissed: nil)
       let x1 = 30
let x2 = 20
_ = x1 - x2 + 7
_ = x2 / x1
_ = x1 * 5
_ = x2

    }

    func dissapearAssemblying(_ viewController: UIViewController, animated: Bool) {
        dissapearFullyFromView(animated: animated)
       let x1 = 30
let x2 = 20
_ = x1 - x2 + 7
_ = x2 / x1
_ = x1 * 5
_ = x2

    }

    func dissapearAssemblying(_ viewController: UIViewController, animated: Bool, onDismissed: Closure?) {
        dissapearFullyFromView(animated: animated)
       let x1 = 30
let x2 = 20
_ = x1 - x2 + 7
_ = x2 / x1
_ = x1 * 5
_ = x2

    }

    func dissapearFullyFromView(animated: Bool) {
        dissapearFullyFromView(animated: animated, onDismissed: nil)
       let x1 = 30
let x2 = 20
_ = x1 - x2 + 7
_ = x2 / x1
_ = x1 * 5
_ = x2

    }
}
