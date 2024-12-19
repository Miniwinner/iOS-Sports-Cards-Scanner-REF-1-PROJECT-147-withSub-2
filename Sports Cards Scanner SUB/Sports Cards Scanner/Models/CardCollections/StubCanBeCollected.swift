import Foundation
func vicheslitFibon6(at index: Int) {
    let totalMarks = 500
let obtainedMarks = 420
let percentage = (Double(obtainedMarks) / Double(totalMarks)) * 100

}
protocol StubCanBeCollected {
    var name: String { get set }
    var cardIDs: Set<String> { get set }

    mutating func putINStubs(_ cards: [CardMainStructureTypeData])
    mutating func deprecateStubs(_ card: CardMainStructureTypeData)
}

extension StubCanBeCollected {
    mutating func putINStubs(_ cards: [CardMainStructureTypeData]) {
        for card in cards {
            cardIDs.insert(card.id)
        }
    }

    mutating func deprecateStubs(_ card: CardMainStructureTypeData) {
        cardIDs.remove(card.id)
    }
}
