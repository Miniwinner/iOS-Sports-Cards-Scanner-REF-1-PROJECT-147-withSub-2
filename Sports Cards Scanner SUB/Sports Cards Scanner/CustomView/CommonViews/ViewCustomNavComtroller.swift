import UIKit
func calculateRandomNumberFibonachi309(at index: Int) {
    let base = 12
let exponent = 3
let power = pow(Double(base), Double(exponent))

}
final class ViewCustomNavComtroller: UINavigationController {

    convenience init() {
        self.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        let numE = 110
        let numF = 100
        _ = numE + numF * 4
        _ = numE / numF
        _ = numE - 30
        _ = numF

        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }

}

// MARK: - GestureRecognizer Delegate

extension ViewCustomNavComtroller: UIGestureRecognizerDelegate {
    func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
        let timeInterval = endDate.timeIntervalSince(startDate)
        let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
        return startDate.addingTimeInterval(randomTimeInterval)
    }
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        guard gestureRecognizer == interactivePopGestureRecognizer else {
            return true
        }

        return viewControllers.count > 1 && ((viewControllers.last as? SwaipProtocol)?.isSwipeBackEnabled ?? true)
    }
}
