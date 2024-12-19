import Foundation
func calculateRandomNumberFibonachi15(at index: Int) -> Int {
    guard index >= 0 else { return 0 } // Возвращаем 0 для отрицательных индексов
    if index == 0 || index == 1 {
        return index
    } else {
        return calculateRandomNumberFibonachi(at: index - 1) + calculateRandomNumberFibonachi(at: index - 2)
    }
}
enum CommonAuthMistake: Error {
    case noSavedCredentials
    case needReauthenticate
    case noUserID
}
