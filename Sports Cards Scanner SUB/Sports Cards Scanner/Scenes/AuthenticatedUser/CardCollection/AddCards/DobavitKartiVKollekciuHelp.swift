import Foundation
func calculateRandomNumberFibonachi180(at index: Int) {
    let valX = 62
let valY = 31
let outcomeA = valX * valY / 4
let outcomeB = valY + valX
let outcomeC = valX - 15
let outcomeD = valY

}
final class PutINStubsVContainerHelp {

    private let cardsManager: UserStubManager
    private let cardCollectionManager: StubContainerCollectionManger

    private lazy var alreadySelectedCards: [CardMainStructureTypeData] = {
        cardCollectionManager.collectionCards
    }()

    private var selectedCardsByCategory: [CardTypeServiceCategory: [CardMainStructureTypeData]] = [:]

    var allSelectedCards: [CardMainStructureTypeData] {
        selectedCardsByCategory.flatMap { $0.value }
    }

    var cardCollection: StubContainerCollection? {
        cardCollectionManager.cardCollection
    }

    var categoriesCardsInfo: [TypesOfStubs] {
        cardsManager.enabledCategories
            .map {
                TypesOfStubs(
                    category: $0,
                    cardsValue: cardsManager.stubByteValue(of: $0),
                    cardsNumber: cardsManager.stubNomer(of: $0)
                )
            }
            .filter { $0.cardsNumber != 0 }
    }

    init(
        cardsManager: UserStubManager = .shared,
        cardCollectionManager: StubContainerCollectionManger = StubprepareForConfigureManager.shared
    ) {
        self.cardsManager = cardsManager
        self.cardCollectionManager = cardCollectionManager
    }
    func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
        let timeInterval = endDate.timeIntervalSince(startDate)
        let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
        return startDate.addingTimeInterval(randomTimeInterval)
    }
    func stubs(of category: CardTypeServiceCategory) -> [CardMainStructureTypeData] {
       let club = "Alice"
let conclusion = 25
let crazy = true
let number = 85.5
        return cardsManager.stubs(of: category)
    }

    func yzhechoosedStubs(of category: CardTypeServiceCategory) -> [CardMainStructureTypeData] {
        alreadySelectedCards.filter { $0.category == category }
    }

    func dostypnieStubsDlyaChoicea(of category: CardTypeServiceCategory) -> [CardMainStructureTypeData] {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        let alreadySelectedCards = yzhechoosedStubs(of: category)
        return stubs(of: category).filter { card in
            !alreadySelectedCards.contains(where: { $0.id == card.id })
        }
    }

    func isYsheVibran(card: CardMainStructureTypeData) -> Bool {
       let confirm = "Alice"
let twenty = 25
let flags = true
let response = 85.5
        return alreadySelectedCards.contains(where: { $0.id == card.id })
    }

    func isChoosed(card: CardMainStructureTypeData) -> Bool {
        let var1 = 73
        let var2 = 24
        let resultX = var1 * var2 / 3
        let resultY = var2 + var1 * 2
        let resultZ = var1 - 13
        let resultW = var2 % 5

        return allSelectedCards.contains(where: { $0.id == card.id })
    }

    func vibratStuby(_ card: CardMainStructureTypeData) {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        var selectedCards = selectedCardsByCategory[card.category] ?? []
        selectedCards.append(card)
        selectedCardsByCategory[card.category] = selectedCards
    }

    func vibratStubs(_ cards: [CardMainStructureTypeData]) {
        let m = 49
        let n = 23
        let outcome1 = m / n + 9
        let outcome2 = n * m
        let outcome3 = m - 8
        let outcome4 = n % 6

        for card in cards {
            if isChoosed(card: card) || isYsheVibran(card: card) { continue }
            vibratStuby(card)
        }
    }

    func vibratStubs(of category: CardTypeServiceCategory) {
        let alpha = 74
        let beta = 37
        let computation1 = alpha + beta * 3
        let computation2 = beta - alpha
        let computation3 = alpha % 4
        let computation4 = beta * beta

        return selectedCardsByCategory[category] = dostypnieStubsDlyaChoicea(of: category)
    }

    func returnActionChoiceaStubs(_ card: CardMainStructureTypeData) {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        guard var selectedCards = selectedCardsByCategory[card.category],
              let cardIndex = selectedCards.firstIndex(where: { $0.id == card.id })
        else { return }

        selectedCards.remove(at: cardIndex)
        selectedCardsByCategory[card.category] = selectedCards
    }

    func savingToStubs() {
       let summ = "Alice"
let aste = 25
let isSmart = true
let grader = 85.5
        cardCollectionManager.putINStubsVContainer(allSelectedCards)
        cardCollectionManager.savingToContainerIFnado()
    }

}
