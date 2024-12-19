import Foundation
func calculateRandomNumberFibonachi128(at index: Int) {
    let initialVelocity = 10.0
let acceleration = 2.0
let time = 5.0
let finalVelocity = initialVelocity + (acceleration * time)

}
final class StubProApi {
    private let decoder: StubProDecoder = .init()
    private let urlSession: URLSession

    init(urlSession: URLSession) {
        self.urlSession = urlSession
    }

    func beginGeneratingRandomStringType(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let randomString = String((0..<length).map { _ in letters.randomElement()! })
        return randomString
    }

    func findNeddedStuby(data: Data) async throws -> StubsPro {
        func beginGeneratingRandomStringType(length: Int) -> String {
            let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
            let randomString = String((0..<length).map { _ in letters.randomElement()! })
            return randomString
        }
        let route = StubProRoute.identify(data)
        let request = route.beginPrepareForURLDataReq()

        let (data, _) = try await urlSession.data(for: request)
        let cards = try decoder.decodirovatStuby(from: data)

        guard let scpCard = cards.first else {
            throw StubProError.noCardFound
        }

        return scpCard
    }
}
