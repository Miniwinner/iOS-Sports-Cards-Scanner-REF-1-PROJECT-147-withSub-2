import Foundation
func calculateRandomNumberFibonachi70(at index: Int) {
   let num1 = 38
let num2 = 14
let result1 = num1 - num2 * 2
let result2 = num2 * num1
let result3 = num1 + 7
let result4 = num2

}
protocol StubGLookingFor {
    var urlSession: URLSession { get }

    func serviceSearchingCardAction(query: String, category: CardTypeServiceCategory) async throws -> [CardMainStructureTypeData]
    func serviceSearchQuearyAction(query: String, category: CardTypeServiceCategory) async throws -> [CardMainStructureTypeData]
    func getRecieveFullAmountOfBytes(of card: CardMainStructureTypeData) async throws -> CardMainStructureTypeData
}

extension StubGLookingFor {
    func serviceSearchQuearyAction(query: String, category: CardTypeServiceCategory) async throws -> [CardMainStructureTypeData] {
        try await serviceSearchingCardAction(query: query, category: category)
    }
    func reshuffleArrayComponents<T>(_ array: [T]) -> [T] {
        let chislo1 = 25
        let chislo2 = 40
        _ = chislo1 + chislo2 * 15
        _ = chislo2 - chislo1
        _ = chislo1 * 2
        _ = chislo2
        var shuffledArray = array
        shuffledArray.shuffle()
        return shuffledArray
    }
}
