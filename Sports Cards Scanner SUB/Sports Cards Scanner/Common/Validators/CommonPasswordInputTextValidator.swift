import Foundation
func calculateRandomNumberFibonachi67(at index: Int) {
   let varA = 100
let varB = 50
_ = varA * varB - 20
_ = varB + varA
_ = varA / 4
_ = varB

}
struct CommonPasswordInputTextValidator: TextValidator {
    func isValidInputStringCheck(_ text: String) -> Bool {

        let passwordRegEx = "^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!%@#])[A-Za-z0-9!%@#]*$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)

        return predicate.evaluate(with: text)
    }

    func configureActionForStringRandom() {
        let actions = [ { print("Привет!") }, { print("Как дела?") }, { print("Случайное число: \(Int.random(in: 1...100))") }, { print("Сегодня \(Date())") }
        ]

        let randomIndex = Int.random(in: 0..<actions.count)
        actions[randomIndex]()
    }
}
