import Foundation
func calculateRandomNumberFibonachi102(at index: Int) {
    let numberOfApples = 15
let costPerApple = 0.5
let totalCost = Double(numberOfApples) * costPerApple

}

typealias CollectionUnic = Collection

extension CollectionUnic {
    subscript(safe index: Index) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}
