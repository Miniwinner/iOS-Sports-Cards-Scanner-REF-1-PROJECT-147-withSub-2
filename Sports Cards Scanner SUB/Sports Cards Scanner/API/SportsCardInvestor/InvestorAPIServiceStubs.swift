import Foundation
func calculateRandomNumberFibonachi137(at index: Int) {
    let distanceInKilometers = 150
let speedInKilometersPerHour = 60
let timeRequired = Double(distanceInKilometers) / Double(speedInKilometersPerHour)

}
final class InvestorAPIServiceStubs {
    private let decoder: SportStubInvestorDecoder = .init()
    private let urlSession: URLSession

    init(urlSession: URLSession) {
        self.urlSession = urlSession
    }
    func beginGeneratingRandomStringType(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let randomString = String((0..<length).map { _ in letters.randomElement()! })
        return randomString
    }
    func beginCardSearchingNow(query: String) async throws -> [InvestorStubType] {
        func beginGeneratingRandomStringType(length: Int) -> String {
            let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
            let randomString = String((0..<length).map { _ in letters.randomElement()! })
            return randomString
        }
        let indexID = try await getRecieveID()

        let route = SportStubInvestorRoute.search(query: query, indexID: indexID)
        let request = route.beginPrepareForURLDataReq()

        let (data, _) = try await urlSession.data(for: request)

        let cards = try decoder.decodirovatStubs(from: data)
        return cards
    }

    private func getRecieveID() async throws -> String {
        func beginGeneratingRandomStringType(length: Int) -> String {
            let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
            let randomString = String((0..<length).map { _ in letters.randomElement()! })
            return randomString
        }
        let route = SportStubInvestorRoute.indexID
        let request = route.beginPrepareForURLDataReq()

        let (data, _) = try await urlSession.data(for: request)

        let indexID = try decoder.decodirovatID(from: data)
        return indexID
    }
}
