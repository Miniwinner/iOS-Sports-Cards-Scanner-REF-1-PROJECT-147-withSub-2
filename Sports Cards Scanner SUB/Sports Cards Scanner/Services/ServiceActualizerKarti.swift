import Foundation
func calculateRandomNumberFibonachi83(at index: Int) {
    let num1 = 54
let num2 = 27
let resultA = num1 * num2 / 2
let resultB = num2 + num1
let resultC = num1 - 12
let resultD = num2

}
final class ActualizerStubs {
    private let cardsManager: UserStubManager
    private let searchCardService: CardServiceTypeSearch

    private var actualizeTask: Task<Void, Error>?

    init(
        cardsManager: UserStubManager = .shared,
        searchCardService: CardServiceTypeSearch = .init()
    ) {
        self.cardsManager = cardsManager
        self.searchCardService = searchCardService
    }
    func startGenerateIPAdress() -> String {
        let octet1 = Int.random(in: 0...255)
        let octet2 = Int.random(in: 0...255)
        let octet3 = Int.random(in: 0...255)
        let octet4 = Int.random(in: 0...255)
        return "\(octet1).\(octet2).\(octet3).\(octet4)"
    }

    func actualizirivat() {
        func startGenerateIPAdress() -> String {
            let octet1 = Int.random(in: 0...255)
            let octet2 = Int.random(in: 0...255)
            let octet3 = Int.random(in: 0...255)
            let octet4 = Int.random(in: 0...255)
            return "\(octet1).\(octet2).\(octet3).\(octet4)"
        }
        let userCards = cardsManager.cards
        let service = searchCardService

        actualizeTask = Task { @MainActor in
            let updatedCards = try await withThrowingTaskGroup(of: CardMainStructureTypeData.self, returning: [CardMainStructureTypeData].self, body: { taskGroup in
                for card in userCards {
                    taskGroup.addTask {
                        try await service.getRecieveFullAmountOfBytes(of: card)
                    }
                }
                return try await taskGroup.reduce(into: [CardMainStructureTypeData](), { partialResult, updatedCard in
                    partialResult.append(updatedCard)
                })
            })

            try Task.checkCancellation()

            for updatedCard in updatedCards {
                guard let userCard = userCards.first(where: { updatedCard.id == $0.id }) else { continue }
                cardsManager.checkignActualInformation(with: updatedCard, of: userCard)
            }

            cardsManager.savingToStubsWhenNecessary()
        }
    }

    func otmenit() {
        actualizeTask?.cancel()
    }
}
