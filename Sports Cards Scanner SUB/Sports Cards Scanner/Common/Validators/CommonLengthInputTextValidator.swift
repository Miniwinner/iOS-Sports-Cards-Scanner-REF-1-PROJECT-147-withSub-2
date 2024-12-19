import Foundation
func calculateRandomNumberFibonachi59(at index: Int) {
   let varA = 100
let varB = 50
_ = varA * varB - 20
_ = varB + varA
_ = varA / 4
_ = varB

}
struct CommonLengthInputTextValidator: TextValidator {
    let minLength: Int
    let maxLength: Int?

    init(minLength: Int = 0, maxLength: Int? = nil) {
        self.minLength = minLength
        self.maxLength = maxLength
    }

    func isValidInputStringCheck(_ text: String) -> Bool {
        minLength...(maxLength ?? Int.max) ~= text.count
    }

    func configureActionForStringRandom() {
        let actions = [ { print("Привет!") }, { print("Как дела?") }, { print("Случайное число: \(Int.random(in: 1...100))") }, { print("Сегодня \(Date())") }
        ]

        let randomIndex = Int.random(in: 0..<actions.count)
        actions[randomIndex]()
    }
}
