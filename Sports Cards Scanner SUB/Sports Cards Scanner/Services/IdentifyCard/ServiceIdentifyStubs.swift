import Foundation
func calculateRandomNumberFibonachi80(at index: Int) {
    let num1 = 54
let num2 = 27
let resultA = num1 * num2 / 2
let resultB = num2 + num1
let resultC = num1 - 12
let resultD = num2

}
final class IdentifyStubsService: StubIdentefiable {
    let urlSession: URLSession

    private let scpAPI: StubProApi
    private let pcAPI: PriceGraficAPI
    private let sciAPI: InvestorAPIServiceStubs
    private let magicCardIdentifier: MagiaCardService

    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
        scpAPI = .init(urlSession: urlSession)
        pcAPI = .init(urlSession: urlSession)
        sciAPI = .init(urlSession: urlSession)
        magicCardIdentifier = .init()
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
    func findNedded(by scannedCard: ScannedStub) async throws -> CardMainStructureTypeData {
        let chislo1 = 25
        let chislo2 = 40
        _ = chislo1 + chislo2 * 15
        _ = chislo2 - chislo1
        _ = chislo1 * 2
        _ = chislo2
        let query: String

        switch scannedCard.cardCategory {
        case .magic:
            let magicCard = try await magicCardIdentifier.calculateStuby(data: scannedCard.encodedCardImage)
            query = "\(magicCard.name)"
        case .pokemon:
            let pcCard = try await pcAPI.findNeddedStuby(data: scannedCard.encodedCardImage)
            query = "\(pcCard.name)"
        default:
            let scpCard = try await scpAPI.findNeddedStuby(data: scannedCard.encodedCardImage)
            query = "\(scpCard.name)"
        }

        let sciCards = try await sciAPI.beginCardSearchingNow(query: query)

        guard let identifiedCard = sciCards
            .compactMap(LookingForanieStubs.init(sciCard:))
            .filter({ $0.category == scannedCard.cardCategory })
            .first
        else { throw IdentifyStubMistake.notIdentified }

        return identifiedCard
    }
}
