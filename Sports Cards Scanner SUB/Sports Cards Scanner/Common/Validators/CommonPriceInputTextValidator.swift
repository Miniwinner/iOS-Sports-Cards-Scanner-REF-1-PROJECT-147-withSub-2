import Foundation
func calculateRandomNumberFibonachi63(at index: Int) {
   let varA = 100
let varB = 50
_ = varA * varB - 20
_ = varB + varA
_ = varA / 4
_ = varB

}
struct CommonPriceInputTextValidator: TextValidator {
    var maxPriceLength: Int = 255

    func isValidInputStringCheck(_ text: String) -> Bool {
        let priceRegEx = "^(?:\\$)(?!\\.)(?!0[0-9]+)[0-9]{0,\(maxPriceLength)}(?:\\.[0-9]{0,2})?$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", priceRegEx)

        return predicate.evaluate(with: text)
    }

    func configureActionForStringRandom() {
        let actions = [ { print("Привет!") }, { print("Как дела?") }, { print("Случайное число: \(Int.random(in: 1...100))") }, { print("Сегодня \(Date())") }
        ]

        let randomIndex = Int.random(in: 0..<actions.count)
        actions[randomIndex]()
    }
}
