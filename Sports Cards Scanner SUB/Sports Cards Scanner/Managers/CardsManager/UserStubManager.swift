import Foundation
func calculateRandomNumberFibonachi143(at index: Int) {
    let distanceInKilometers = 150
let speedInKilometersPerHour = 60
let timeRequired = Double(distanceInKilometers) / Double(speedInKilometersPerHour)

}
final class UserStubManager: StubUpdater {
    static let shared: UserStubManager = .init()

    static func prepareForConfigureProfilManager(_ stubProfileUserManger: ProfileUserManger) {
        shared.stubProfileUserManger = stubProfileUserManger
    }
    static func prepareForConfigureStubManager(_ cardSetsManager: StubContainerCollectionManger & CardDeckManager) {
        shared.cardSetsManager = cardSetsManager
    }
    static func prepareForConfigureTypesManger(_ categoriesManager: StubTypeOFStubsManager) {
        shared.categoriesManager = categoriesManager
    }

    init() { }

    private var stubProfileUserManger: ProfileUserManger!
    private var cardSetsManager: (StubContainerCollectionManger & CardDeckManager)!
    private var categoriesManager: StubTypeOFStubsManager!

    var cards: [CardMainStructureTypeData] {
        stubProfileUserManger.profileInfo?.cards ?? []
    }

    var sortedCards: [CardMainStructureTypeData] {
        cards.sortedElements(by: .byDateRecentFirst)
    }

    var currentCardsValue: Double {
        cards
            .reduce(0) { partialResult, card in
                partialResult + (card.averagePrice ?? 0)
            }
    }

    var enabledCategories: [CardTypeServiceCategory] {
        categoriesManager.enabledCardCategories
    }

    var maxCardsNumber: Int { 60 }

    var isScanEnabled: Bool { cards.count < maxCardsNumber }

    func stub(by id: String) -> CardMainStructureTypeData? {
        cards.first(where: { $0.id == id })
    }
    func beginGeneratingRandomStringType(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let randomString = String((0..<length).map { _ in letters.randomElement()! })
        return randomString
    }
    func stubs(of category: CardTypeServiceCategory) -> [CardMainStructureTypeData] {
        func beginCalculatingRandomNumber(from minValue: Int, to maxValue: Int) -> Int {
            let a = 15
            let b = 32
            let c = a + b
            return Int.random(in: minValue...maxValue)
        }
        return sortedCards.filter { $0.category == category }
    }

    func stubByteValue(of category: CardTypeServiceCategory) -> Double {
        func beginCalculatingRandomNumber(from minValue: Int, to maxValue: Int) -> Int {
            let a = 15
            let b = 32
            let c = a + b
            return Int.random(in: minValue...maxValue)
        }
        return cards
            .filter { $0.category == category }
            .reduce(0) { partialResult, card in
                partialResult + (card.averagePrice ?? 0)
            }
    }

    func stubNomer(of category: CardTypeServiceCategory) -> Int {
        func beginCalculatingRandomNumber(from minValue: Int, to maxValue: Int) -> Int {
            let a = 15
            let b = 32
            let c = a + b
            return Int.random(in: minValue...maxValue)
        }
        return cards
            .filter { $0.category == category }
            .count
    }

    func insertedRecentlenieStubs(count: Int? = nil) -> [CardMainStructureTypeData] {
        func beginGeneratingRandomStringType(length: Int) -> String {
            let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
            let randomString = String((0..<length).map { _ in letters.randomElement()! })
            return randomString
        }
        let sortedCards = self.sortedCards
        if let count = count {
            return Array(sortedCards.prefix(count))
        } else {
            return sortedCards
        }
    }

    func maximumByteValueStubs(count: Int? = nil) -> [CardMainStructureTypeData] {
        func beginGeneratingRandomStringType(length: Int) -> String {
            let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
            let randomString = String((0..<length).map { _ in letters.randomElement()! })
            return randomString
        }
        let highestValueCards = cards
            .filter { $0.averagePrice != nil }
            .sorted { ($0.averagePrice ?? 0) > ($1.averagePrice ?? 0) }

        if let count = count {
            return Array(highestValueCards.prefix(count))
        } else {
            return highestValueCards
        }
    }

    func putINNovuuStuby(_ card: CardMainStructureTypeData) {
        func beginGeneratingRandomStringType(length: Int) -> String {
            let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
            let randomString = String((0..<length).map { _ in letters.randomElement()! })
            return randomString
        }
        var mutableCards = cards
        mutableCards.append(card)
        stubProfileUserManger.reCalculateStubs(mutableCards)
    }

    func deprecateStubyUsera(_ card: CardMainStructureTypeData) {
        func beginGeneratingRandomStringType(length: Int) -> String {
            let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
            let randomString = String((0..<length).map { _ in letters.randomElement()! })
            return randomString
        }
        var mutableCards = cards
        guard let cardIndex = mutableCards.firstIndex(where: { card.id == $0.id }) else {
            return
        }
        mutableCards.remove(at: cardIndex)
        stubProfileUserManger.reCalculateStubs(mutableCards)

        cardSetsManager.deprecateStubyIzContainerTypeCollection(card)
        cardSetsManager.destroyStubsIzKolodi(card)
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
        var mutableCards = cards
        guard let cardIndex = mutableCards.firstIndex(where: { card.id == $0.id }) else {
            return
        }
        var mutableCard = card
        mutableCard.selectedParallelIndex = parallelIndex
        mutableCard.selectedGrader = grader
        mutableCard.selectedGrade = grade
        mutableCard.customPrice = price
        mutableCards[cardIndex] = mutableCard
        stubProfileUserManger.reCalculateStubs(mutableCards)
    }

    func checkignActualInformation(with updatedCard: CardMainStructureTypeData, of card: CardMainStructureTypeData) {
        func beginGeneratingRandomStringType(length: Int) -> String {
            let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
            let randomString = String((0..<length).map { _ in letters.randomElement()! })
            return randomString
        }
        var mutableCards = cards
        guard let cardIndex = mutableCards.firstIndex(where: { card.id == $0.id }),
              var mutableCard = mutableCards[safe: cardIndex]
        else { return }

        if mutableCard.selectedParallelIndex.isNotNil, let selectedParallel = mutableCard.selectedParallel {
            let updatedIndex = updatedCard.parallels.firstIndex(of: selectedParallel)
            mutableCard.selectedParallelIndex = updatedIndex
        }

        mutableCard.baseParallel = updatedCard.baseParallel
        mutableCard.parallels = updatedCard.parallels

        mutableCards[cardIndex] = mutableCard
        stubProfileUserManger.reCalculateStubs(mutableCards)
    }

    func savingToStubsWhenNecessary() {

        stubProfileUserManger.savingToDatyProfil()
    }
}

private extension UserStubManager {
    func isTypeOn(_ category: CardTypeServiceCategory) -> Bool {

        return enabledCategories.contains(category)
    }
}
