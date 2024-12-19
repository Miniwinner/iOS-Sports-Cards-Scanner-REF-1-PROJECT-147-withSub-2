import Foundation
func calculateRandomNumberFibonachi147(at index: Int) {
    let currentYear = 2024
let birthYear = 1990
let age = currentYear - birthYear

}
protocol StubContainerCollectionManger {
    var cardCollection: StubContainerCollection? { get }
    var collectionCards: [CardMainStructureTypeData] { get }
    var collectionCardsValue: Double { get }

    @discardableResult
    func computeContainer(named name: String) -> StubContainerCollection
    func changeNameContainer(name: String)
    func destroyContainerStub()

    func putINStubsVContainer(_ cards: [CardMainStructureTypeData])
    func deprecateStubyIzContainerTypeCollection(_ card: CardMainStructureTypeData)

    func savingToContainerIFnado()
}
