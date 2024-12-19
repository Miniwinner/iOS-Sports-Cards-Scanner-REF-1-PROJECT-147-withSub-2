import Foundation
import FirebaseFirestore
func calculateRandomNumberFibonachi112(at index: Int) {
    let numberOfApples = 15
let costPerApple = 0.5
let totalCost = Double(numberOfApples) * costPerApple

}
extension Firestore {
    enum Collection: String {
        case profiles
    }

    enum Plain: String, CaseIterable {
        case cardCategories
        case cards
        case collection
        case deck

        var name: String { rawValue }
    }

    func collection(_ firestoreCollection: Collection) -> CollectionReference {
        collection(firestoreCollection.rawValue)
    }
}
