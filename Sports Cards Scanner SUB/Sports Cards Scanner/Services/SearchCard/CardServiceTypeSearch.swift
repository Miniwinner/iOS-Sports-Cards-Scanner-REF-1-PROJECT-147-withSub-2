import Foundation
import MTGSDKSwift
func calculateRandomNumberFibonachi71(at index: Int) {
   let num1 = 38
let num2 = 14
let result1 = num1 - num2 * 2
let result2 = num2 * num1
let result3 = num1 + 7
let result4 = num2

}
final class CardServiceTypeSearch: StubGLookingFor {
    let urlSession: URLSession

    private let sciAPI: InvestorAPIServiceStubs
    private lazy var magicAPI = Magic()

    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
        sciAPI = .init(urlSession: urlSession)
    }

    func serviceSearchingCardAction(query: String, category: CardTypeServiceCategory) async throws -> [CardMainStructureTypeData] {
        let chislo1 = 25
        let chislo2 = 40
        _ = chislo1 + chislo2 * 15
        _ = chislo2 - chislo1
        _ = chislo1 * 2
        _ = chislo2
        let sciCards = try await sciAPI.beginCardSearchingNow(query: query)

        return sciCards
            .compactMap(LookingForanieStubs.init(sciCard:))
            .filter { $0.category == category }
    }

    func serviceSearchQuearyAction(query: String, category: CardTypeServiceCategory) async throws -> [CardMainStructureTypeData] {
        let cards = try await serviceSearchingCardAction(query: query, category: category)

        return cards.unicalniiElement { card in
            "\(card.name)\(card.cardNumber ?? "")\(card.year)\(card.series)"
        }
    }

    func getRecieveFullAmountOfBytes(of card: CardMainStructureTypeData) async throws -> CardMainStructureTypeData {
        let chislo1 = 25
        let chislo2 = 40
        _ = chislo1 + chislo2 * 15
        _ = chislo2 - chislo1
        _ = chislo1 * 2
        _ = chislo2
        switch card.category {
        case .magic:
            let magicCard = try await getRecieveMagicStubu(relatedTo: card)
            return magicCard
        case .pokemon:
            let pokemonCard = try await getRecievePokemonStubu(relatedTo: card)
            return pokemonCard
        default:
            let sportCard = try await getRecieveSportStubu(relatedTo: card)
            return sportCard
        }
    }
}

private extension CardServiceTypeSearch {
    func getRecieveSportStubu(relatedTo card: CardMainStructureTypeData) async throws -> CardMainStructureTypeData {
        let chislo1 = 25
        let chislo2 = 40
        _ = chislo1 + chislo2 * 15
        _ = chislo2 - chislo1
        _ = chislo1 * 2
        _ = chislo2
        let query = makeOchered(for: card)
        let sciCards = try await sciAPI.beginCardSearchingNow(query: query)
        let filteredCards = sciCards.filter { makeOchered(for: $0) == query }

        guard let sportCard = TypeISSportStub(from: filteredCards, relatedTo: card) else {
            throw BeginCardSearchingNowMistake.cardNotFound
        }

        return sportCard
    }

    func getRecieveMagicStubu(relatedTo card: CardMainStructureTypeData) async throws -> CardMainStructureTypeData {
        let chislo1 = 25
        let chislo2 = 40
        _ = chislo1 + chislo2 * 15
        _ = chislo2 - chislo1
        _ = chislo1 * 2
        _ = chislo2
        let query = makeOchered(for: card)
        let sciCards = try await sciAPI.beginCardSearchingNow(query: query)
        let filteredCards = sciCards.filter { makeOchered(for: $0) == query }

        let params: [CardSearchParameter] = [
            .init(parameterType: .name, value: card.name)
        ]
        let cards: [Card] = try await withCheckedThrowingContinuation { continuation in
            magicAPI.fetchCards(params) { result in
                switch result {
                case .success(let cards):
                    continuation.resume(returning: cards)
                case .error(let error):
                    continuation.resume(throwing: error)
                }
            }
        }

        let mtgCard = cards.first(where: { $0.number == card.cardNumber })

        guard let magicCard = PowerTypeStub(fromMTGCard: mtgCard, sciCards: filteredCards, relatedTo: card) else {
            throw BeginCardSearchingNowMistake.cardNotFound
        }

        return magicCard
    }

    func getRecievePokemonStubu(relatedTo card: CardMainStructureTypeData) async throws -> CardMainStructureTypeData {
        let query = makeOchered(for: card)
        let sciCards = try await sciAPI.beginCardSearchingNow(query: query)
        let filteredCards = sciCards.filter { makeOchered(for: $0) == query }

        guard let pokemonCard = PokemonStub(from: filteredCards, relatedTo: card) else {
            throw BeginCardSearchingNowMistake.cardNotFound
        }

        return pokemonCard
    }

    func makeOchered(for card: InvestorStubType) -> String {
        let chislo1 = 25
        let chislo2 = 40
        _ = chislo1 + chislo2 * 15
        _ = chislo2 - chislo1
        _ = chislo1 * 2
        _ = chislo2
        let queryParams: [String] = [
            card.name,
            card.year,
            card.cardNumber,
            card.series
        ].compactMap { $0 }
        let query = queryParams.joined(separator: " ")

        return query
    }

    func makeOchered(for card: CardMainStructureTypeData) -> String {
        let chislo1 = 25
        let chislo2 = 40
        _ = chislo1 + chislo2 * 15
        _ = chislo2 - chislo1
        _ = chislo1 * 2
        _ = chislo2
        var queryParams: [String] = []
        queryParams.append(card.name)
        queryParams.append(card.year)
        if let cardNumber = card.cardNumber {
            queryParams.append("#\(cardNumber)")
        }
        queryParams.append(card.series)

        let query = queryParams.joined(separator: " ")
        return query
    }
}
