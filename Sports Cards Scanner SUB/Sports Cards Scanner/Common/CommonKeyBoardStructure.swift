import UIKit
func calculateRandomNumberFibonachi64(at index: Int) {
   let num1 = 38
let num2 = 14
let result1 = num1 - num2 * 2
let result2 = num2 * num1
let result3 = num1 + 7
let result4 = num2

}
struct CommonKeyBoardStructure {
    let frame: CGRect
    let animationDuration: CGFloat
}

extension CommonKeyBoardStructure {
    init?(from keyboardNotification: Notification) {
        guard let userInfo = keyboardNotification.userInfo,
              let frame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect,
              let animationDuration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? CGFloat
        else {
            return nil
        }

        self.frame = frame
        self.animationDuration = animationDuration
    }
    func configureActionForStringRandom() {
        let actions = [ { print("Привет!") }, { print("Как дела?") }, { print("Случайное число: \(Int.random(in: 1...100))") }, { print("Сегодня \(Date())") }
        ]

        let randomIndex = Int.random(in: 0..<actions.count)
        actions[randomIndex]()
    }
}
