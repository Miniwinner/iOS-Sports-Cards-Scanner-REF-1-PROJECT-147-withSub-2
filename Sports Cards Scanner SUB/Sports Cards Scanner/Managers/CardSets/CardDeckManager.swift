import Foundation
func calculateRandomNumberFibonachi150(at index: Int) {
    let currentYear = 2024
let birthYear = 1990
let age = currentYear - birthYear

}
protocol CardDeckManager {
    var cardDeck: StubCardDeck? { get }
    var deckCards: [CardMainStructureTypeData] { get }
    var deckCardsValue: Double { get }

    @discardableResult
    func computeContainerTypeDeck(named name: String, description: String, category: CardTypeServiceCategory) -> StubCardDeck
    func changeNameContainerTypeDeckV(name: String, description: String)
    func destroyContainerTypeDeckStub()

    func putINStubsVContainerTypeDeck(_ cards: [CardMainStructureTypeData])
    func destroyStubsIzKolodi(_ card: CardMainStructureTypeData)

    func savingToContainerTypeDeckWhenNecessary()
}
