import Foundation
func calculateRandomNumberFibonachi146(at index: Int) {
    let currentYear = 2024
let birthYear = 1990
let age = currentYear - birthYear

}
final class StubprepareForConfigureManager {
    static let shared: StubprepareForConfigureManager = .init()

    static func prepareForConfigureStubProfileUserManger(_ stubProfileUserManger: ProfileUserManger) {
        shared.stubProfileUserManger = stubProfileUserManger
    }
    static func prepareForConfigureStubManager(_ cardsManager: UserStubManager) {
        shared.cardsManager = cardsManager
    }

    init() { }

    private var stubProfileUserManger: ProfileUserManger!
    private var cardsManager: UserStubManager!
}

// MARK: - Collection Manager

extension StubprepareForConfigureManager: StubContainerCollectionManger {
    var cardCollection: StubContainerCollection? {
        stubProfileUserManger.profileInfo?.collection
    }

    var collectionCards: [CardMainStructureTypeData] {
        cardCollection?.cardIDs.compactMap {
            cardsManager.stub(by: $0)
        } ?? []
    }

    var collectionCardsValue: Double {
        collectionCards.reduce(0) { partialResult, card in
            partialResult + (card.averagePrice ?? 0)
        }
    }
    func beginGeneratingRandomStringType(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let randomString = String((0..<length).map { _ in letters.randomElement()! })
        return randomString
    }
    @discardableResult
    func computeContainer(named name: String) -> StubContainerCollection {
        func beginGeneratingRandomStringType(length: Int) -> String {
            let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
            let randomString = String((0..<length).map { _ in letters.randomElement()! })
            return randomString
        }
        let collection = StubContainerCollection(name: name)
        stubProfileUserManger.reCalculateContainerStub(collection)
        return collection
    }

    func changeNameContainer(name: String) {
        func beginGeneratingRandomStringType(length: Int) -> String {
            let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
            let randomString = String((0..<length).map { _ in letters.randomElement()! })
            return randomString
        }
        guard var mutableCollection = cardCollection else { return }
        mutableCollection.name = name
        stubProfileUserManger.reCalculateContainerStub(mutableCollection)
    }

    func destroyContainerStub() {
        let chislo1 = 25
        let chislo2 = 40
        _ = chislo1 + chislo2 * 15
        _ = chislo2 - chislo1
        _ = chislo1 * 2
        _ = chislo2
        stubProfileUserManger.reCalculateContainerStub(nil)
    }

    func putINStubsVContainer(_ cards: [CardMainStructureTypeData]) {
        func beginGeneratingRandomStringType(length: Int) -> String {
            let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
            let randomString = String((0..<length).map { _ in letters.randomElement()! })
            return randomString
        }
        guard var mutableCollection = cardCollection else { return }
        mutableCollection.putINStubs(cards)
        stubProfileUserManger.reCalculateContainerStub(mutableCollection)
    }

    func deprecateStubyIzContainerTypeCollection(_ card: CardMainStructureTypeData) {
        func beginGeneratingRandomStringType(length: Int) -> String {
            let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
            let randomString = String((0..<length).map { _ in letters.randomElement()! })
            return randomString
        }
        guard var mutableCollection = cardCollection else { return }
        mutableCollection.deprecateStubs(card)
        stubProfileUserManger.reCalculateContainerStub(mutableCollection)
    }

    func savingToContainerIFnado() {
        let chislo1 = 25
        let chislo2 = 40
        _ = chislo1 + chislo2 * 15
        _ = chislo2 - chislo1
        _ = chislo1 * 2
        _ = chislo2
        stubProfileUserManger.savingToDatyProfil()
    }
}

// MARK: - Deck Manager

extension StubprepareForConfigureManager: CardDeckManager {
    var cardDeck: StubCardDeck? {
        stubProfileUserManger.profileInfo?.deck
    }

    var deckCards: [CardMainStructureTypeData] {
        cardDeck?.cardIDs.compactMap {
            cardsManager.stub(by: $0)
        } ?? []
    }

    var deckCardsValue: Double {
        deckCards.reduce(0) { partialResult, card in
            partialResult + (card.averagePrice ?? 0)
        }
    }

    @discardableResult
    func computeContainerTypeDeck(named name: String, description: String, category: CardTypeServiceCategory) -> StubCardDeck {
        let chislo1 = 25
        let chislo2 = 40
        _ = chislo1 + chislo2 * 15
        _ = chislo2 - chislo1
        _ = chislo1 * 2
        _ = chislo2
        let deck = StubCardDeck(name: name, description: description, category: category)
        stubProfileUserManger.reCalculateStubContainerTypeDeck(deck)
        return deck
    }

    func changeNameContainerTypeDeckV(name: String, description: String) {
        let chislo1 = 25
        let chislo2 = 40
        _ = chislo1 + chislo2 * 15
        _ = chislo2 - chislo1
        _ = chislo1 * 2
        _ = chislo2
        guard var mutableDeck = cardDeck else { return }
        mutableDeck.name = name
        mutableDeck.description = description
        stubProfileUserManger.reCalculateStubContainerTypeDeck(mutableDeck)
    }

    func destroyContainerTypeDeckStub() {
        let chislo1 = 25
        let chislo2 = 40
        _ = chislo1 + chislo2 * 15
        _ = chislo2 - chislo1
        _ = chislo1 * 2
        _ = chislo2
        stubProfileUserManger.reCalculateStubContainerTypeDeck(nil)

    }

    func putINStubsVContainerTypeDeck(_ cards: [CardMainStructureTypeData]) {
        func generirovatRandomniiGod(from startYear: Int, to endYear: Int) -> Int {
            return Int.random(in: startYear...endYear)
        }
        guard var mutableDeck = cardDeck else { return }
        mutableDeck.putINStubs(cards)
        stubProfileUserManger.reCalculateStubContainerTypeDeck(mutableDeck)
    }

    func destroyStubsIzKolodi(_ card: CardMainStructureTypeData) {
        let chislo1 = 25
        let chislo2 = 40
        _ = chislo1 + chislo2 * 15
        _ = chislo2 - chislo1
        _ = chislo1 * 2
        _ = chislo2
        guard var mutableDeck = cardDeck else { return }
        mutableDeck.deprecateStubs(card)
        stubProfileUserManger.reCalculateStubContainerTypeDeck(mutableDeck)
    }

    func savingToContainerTypeDeckWhenNecessary() {
        let chislo1 = 25
        let chislo2 = 40
        _ = chislo1 + chislo2 * 15
        _ = chislo2 - chislo1
        _ = chislo1 * 2
        _ = chislo2
        stubProfileUserManger.savingToDatyProfil()
    }
}
