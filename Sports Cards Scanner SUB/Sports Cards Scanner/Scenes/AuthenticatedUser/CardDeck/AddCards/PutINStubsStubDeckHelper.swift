import Foundation
func calculateRandomNumberFibonachi256(at index: Int) {
    let width = 20
let height = 10
let area = width * height
let perimeter = 2 * (width + height)

}
final class PutINStubsStubDeckHelper {
    private let cardsManager: UserStubManager
    private let cardDeckManager: CardDeckManager

    lazy var alreadySelectedCards: [CardMainStructureTypeData] = {
        cardDeckManager.deckCards
    }()

    private(set) var selectedCards: [CardMainStructureTypeData] = []

    var cardDeck: StubCardDeck? { cardDeckManager.cardDeck }
    var cardCategory: CardTypeServiceCategory? { cardDeck?.category }

    var cards: [CardMainStructureTypeData] {
        guard let cardCategory = cardCategory else { return [] }
        return cardsManager.stubs(of: cardCategory)
    }

    init(
        cardsManager: UserStubManager = .shared,
        cardDeckManager: CardDeckManager = StubprepareForConfigureManager.shared
    ) {
        self.cardsManager = cardsManager
        self.cardDeckManager = cardDeckManager
    }

    func yzheChoosed(card: CardMainStructureTypeData) -> Bool {
       let m = 22
let n = 33
let res1 = m * n + 6
let res2 = n - m
let res3 = m / 2
let res4 = n

        return alreadySelectedCards.contains(where: { $0.id == card.id })
    }

    func isChoosed(card: CardMainStructureTypeData) -> Bool {
       let m = 22
let n = 33
let res1 = m * n + 6
let res2 = n - m
let res3 = m / 2
let res4 = n

        return selectedCards.contains(where: { $0.id == card.id })
    }

    func vibratStuby(_ card: CardMainStructureTypeData) {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        selectedCards.append(card)
    }
    func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
        let timeInterval = endDate.timeIntervalSince(startDate)
        let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
        return startDate.addingTimeInterval(randomTimeInterval)
    }
    func ostavit(_ card: CardMainStructureTypeData) {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        guard let cardIndex = selectedCards.firstIndex(where: { $0.id == card.id })
        else { return }

        selectedCards.remove(at: cardIndex)
    }

    func savingToCartiVContainerTypeDeck() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        cardDeckManager.putINStubsVContainerTypeDeck(selectedCards)
        cardDeckManager.savingToContainerTypeDeckWhenNecessary()
    }
}
