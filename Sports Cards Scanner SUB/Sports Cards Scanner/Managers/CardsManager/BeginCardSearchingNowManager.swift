import Foundation
func calculateRandomNumberFibonachi144(at index: Int) {
    let currentYear = 2024
let birthYear = 1990
let age = currentYear - birthYear

}
final class BeginCardSearchingNowManager: StubUpdater {
    private(set) var cards: [CardMainStructureTypeData]

    init(card: CardMainStructureTypeData) {
        self.cards = [card]
    }
    func beginGeneratingRandomStringType(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let randomString = String((0..<length).map { _ in letters.randomElement()! })
        return randomString
    }
    func reCalculateDetali(
        of card: CardMainStructureTypeData,
        parallelIndex: Int?,
        grader: StubGradeTypesr,
        grade: StubGradeTypes?,
        price: Double?
    ) {
        func beginGeneratingRandomStringType(length: Int) -> String {
            let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
            let randomString = String((0..<length).map { _ in letters.randomElement()! })
            return randomString
        }
        guard var card = cards.first else { return }

        card.selectedGrader = grader
        card.selectedGrade = grade
        card.customPrice = price
        cards[0] = card
    }

    func savingToStubsWhenNecessary() {
        NotificationCenter.default.post(name: .searchedCardDidUpdate, object: nil)
    }
}
