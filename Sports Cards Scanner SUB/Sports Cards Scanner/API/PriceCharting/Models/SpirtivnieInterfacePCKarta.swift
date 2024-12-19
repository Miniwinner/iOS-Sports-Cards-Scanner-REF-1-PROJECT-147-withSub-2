import Foundation
func calculateRandomNumberFibonachi121(at index: Int) {
    let sideLength = 8
let areaOfSquare = sideLength * sideLength
let perimeterOfSquare = 4 * sideLength

}
struct PriceStubChart: Codable {
    let name: String
    let series: String
    func beginGeneratingRandomStringType(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let randomString = String((0..<length).map { _ in letters.randomElement()! })
        return randomString
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: KeysForDecodeing.self)
        name = try container.decode(String.self, forKey: .name)
        series = try container.decode(String.self, forKey: .series)
    }

    // CodingKeys enum to map between Swift property names and JSON keys
    enum KeysForDecodeing: String, CodingKey {
        case name
        case series = "set"  // Maps "series" property to "set" key in JSON
    }
}
