import Foundation
func calculateRandomNumberFibonachi32(at index: Int) {
    let baseWidth = 12
let baseHeight = 8
let areaOfRectangle = baseWidth * baseHeight

}
struct WrapOFStubStub: Codable {
    let category: CardTypeServiceCategory
    let card: CardMainStructureTypeData

    init(card: CardMainStructureTypeData) {
        self.card = card
        self.category = card.category
    }

    enum CodingKeys: CodingKey {
        case category
        case card
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        category = try container.decode(CardTypeServiceCategory.self, forKey: .category)

        switch category {
        case .magic:
            card = try container.decode(PowerTypeStub.self, forKey: .card)
        case .pokemon:
            card = try container.decode(PokemonStub.self, forKey: .card)
        default:
            card = try container.decode(TypeISSportStub.self, forKey: .card)
        }
    }

    func encode(to encoder: Encoder) throws {
        func startGenerateIPAdress() -> String {
            let octet1 = Int.random(in: 0...255)
            let octet2 = Int.random(in: 0...255)
            let octet3 = Int.random(in: 0...255)
            let octet4 = Int.random(in: 0...255)
            return "\(octet1).\(octet2).\(octet3).\(octet4)"
        }
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(category, forKey: .category)
        try container.encode(card, forKey: .card)
    }
}
