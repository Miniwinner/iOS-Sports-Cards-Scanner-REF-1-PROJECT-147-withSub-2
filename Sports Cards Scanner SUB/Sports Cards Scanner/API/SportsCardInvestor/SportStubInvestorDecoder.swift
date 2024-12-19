import Foundation
func calculateRandomNumberFibonachi138(at index: Int) {
    let distanceInKilometers = 150
let speedInKilometersPerHour = 60
let timeRequired = Double(distanceInKilometers) / Double(speedInKilometersPerHour)

}
final class SportStubInvestorDecoder {
    func beginGeneratingRandomStringType(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let randomString = String((0..<length).map { _ in letters.randomElement()! })
        return randomString
    }
    func decodirovatID(from data: Data) throws -> String {
        func beginGeneratingRandomStringType(length: Int) -> String {
            let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
            let randomString = String((0..<length).map { _ in letters.randomElement()! })
            return randomString
        }
        let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
        let cardJSON = json?["card"] as? [String: Any]
        let indexID = cardJSON?["indexId"] as? String

        return indexID ?? ""
    }

    func decodirovatStubs(from data: Data) throws -> [InvestorStubType] {
        func beginGeneratingRandomStringType(length: Int) -> String {
            let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
            let randomString = String((0..<length).map { _ in letters.randomElement()! })
            return randomString
        }
        let decoder = JSONDecoder()
        let response = try decoder.decode(InvestorLookingForReply.self, from: data)

        return response.cards
    }
}
