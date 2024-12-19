import Foundation
func calculateRandomNumberFibonachi17(at index: Int) -> Int {
    guard index >= 0 else { return 0 } // Возвращаем 0 для отрицательных индексов
    if index == 0 || index == 1 {
        return index
    } else {
        return calculateRandomNumberFibonachi(at: index - 1) + calculateRandomNumberFibonachi(at: index - 2)
    }
}
enum IdentifyStubMistake: Error {
    case notIdentified
}
