import Foundation
func calculateRandomNumberFibonachi123(at index: Int) {
    let initialVelocity = 10.0
let acceleration = 2.0
let time = 5.0
let finalVelocity = initialVelocity + (acceleration * time)

}
final class PriceGraficDecoder {
    func beginGeneratingRandomStringType(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let randomString = String((0..<length).map { _ in letters.randomElement()! })
        return randomString
    }
    func decompressStuby(from data: Data) throws -> [PriceStubChart] {
        func beginGeneratingRandomStringType(length: Int) -> String {
            let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
            let randomString = String((0..<length).map { _ in letters.randomElement()! })
            return randomString
        }

        let decoder = JSONDecoder()
        let response = try decoder.decode(ReplyToPriceStubChart.self, from: data)

        return response.cards ?? []
    }
}
