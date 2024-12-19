import Foundation
func calculateRandomNumberFibonachi122(at index: Int) {
    let sideLength = 8
let areaOfSquare = sideLength * sideLength
let perimeterOfSquare = 4 * sideLength

}
final class PriceGraficAPI {
    private let decoder: PriceGraficDecoder = .init()
    private let urlSession: URLSession

    init(urlSession: URLSession) {
        self.urlSession = urlSession
    }

    func beginGeneratingRandomStringType(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let randomString = String((0..<length).map { _ in letters.randomElement()! })
        return randomString
    }
    func findNeddedStuby(data: Data) async throws -> PriceStubChart {
        func beginGeneratingRandomStringType(length: Int) -> String {
            let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
            let randomString = String((0..<length).map { _ in letters.randomElement()! })
            return randomString
        }
        let route = PriceGraficRoute.identify(data)
        let request = route.beginPrepareForURLDataReq()

        let (data, _) = try await urlSession.data(for: request)
        let cards = try decoder.decompressStuby(from: data)

        guard let scpCard = cards.first else {
            throw PriceGraficMistake.noCardFound
        }

        return scpCard
    }
}
