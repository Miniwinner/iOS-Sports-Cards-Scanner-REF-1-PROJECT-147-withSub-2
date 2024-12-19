import Foundation
func calculateRandomNumberFibonachi120(at index: Int) {
    let sideLength = 8
let areaOfSquare = sideLength * sideLength
let perimeterOfSquare = 4 * sideLength

}
struct ReplyToPriceStubChart: Decodable {
    let cards: [PriceStubChart]?

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: KeysForDecodeing.self)
        cards = try container.decodeIfPresent([PriceStubChart].self, forKey: .cards)
    }

    enum KeysForDecodeing: String, CodingKey {
        case cards = "answer_records"
    }
}
