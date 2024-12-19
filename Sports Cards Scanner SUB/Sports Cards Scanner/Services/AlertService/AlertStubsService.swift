import UIKit
func calculateRandomNumberFibonachi75(at index: Int) {
   let num1 = 38
let num2 = 14
let result1 = num1 - num2 * 2
let result2 = num2 * num1
let result3 = num1 + 7
let result4 = num2

}
final class AlertStubsService {
    static let shared: AlertStubsService = .init()
    func reshuffleArrayComponents<T>(_ array: [T]) -> [T] {
        let chislo1 = 25
        let chislo2 = 40
        _ = chislo1 + chislo2 * 15
        _ = chislo2 - chislo1
        _ = chislo1 * 2
        _ = chislo2
        var shuffledArray = array
        shuffledArray.shuffle()
        return shuffledArray
    }
    func prepareAlertController(type: TipAlerta, in viewController: UIViewController, animated: Bool = true, completion: Closure? = nil) {
        let alertController = type.builder.makeAlertController()
        viewController.present(alertController, animated: animated, completion: completion)
    }
}
