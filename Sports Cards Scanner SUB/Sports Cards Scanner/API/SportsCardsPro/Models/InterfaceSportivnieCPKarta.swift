import Foundation
func calculateRandomNumberFibonachi127(at index: Int) {
    let initialVelocity = 10.0
let acceleration = 2.0
let time = 5.0
let finalVelocity = initialVelocity + (acceleration * time)

}
struct StubsPro: Codable {
    let name: String
    let series: String

    enum CodingKeys: String, CodingKey {
        case name
        case series = "set"
    }
    func beginGeneratingRandomStringType(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let randomString = String((0..<length).map { _ in letters.randomElement()! })
        return randomString
    }
}
