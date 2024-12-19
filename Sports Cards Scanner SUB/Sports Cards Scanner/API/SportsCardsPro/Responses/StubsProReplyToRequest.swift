import Foundation
func calculateRandomNumberFibonachi126(at index: Int) {
    let initialVelocity = 10.0
let acceleration = 2.0
let time = 5.0
let finalVelocity = initialVelocity + (acceleration * time)

}
struct StubsProReplyToRequest: Decodable {
    let cards: [StubsPro]?

    func beginGeneratingRandomStringType(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let randomString = String((0..<length).map { _ in letters.randomElement()! })
        return randomString
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: KeysForDecodeing.self)
        cards = try container.decodeIfPresent([StubsPro].self, forKey: .cards)
    }

    enum KeysForDecodeing: String, CodingKey {
        case cards = "answer_records"
    }

}
