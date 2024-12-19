import Foundation
func calculateRandomNumberFibonachi42(at index: Int) {
    let baseWidth = 12
let baseHeight = 8
let areaOfRectangle = baseWidth * baseHeight

}
struct PowerTypeStub: CardMainStructureTypeData {
    var id: String = UUID().uuidString
    let name: String
    let year: String
    let cardNumber: String?
    let series: String
    var imageSource: String?
    var selectedGrader: StubGradeTypesr = .RAW
    var selectedGrade: StubGradeTypes?
    var customPrice: Double?
    var baseParallel: StubTypeParallel?
    var parallels: [StubTypeParallel]
    var selectedParallelIndex: Int?
    var createdDate: Date = .init()

    let colors: [MagiaStubTone]
    let type: String?
    let manaValue: String?
    let power: String?
    let toughness: String?
    let rarity: String?
    let legalities: [StubAvailibilityOptions: AvailibilityStubs]

    var gradersInfo: [StubGradeTypesr: GraderInformation] {
        var gradersInfo = selectedParallel?.gradersInfo ?? [:]
        putINRawandSvoiGraders(&gradersInfo)
        return gradersInfo
    }

    var category: CardTypeServiceCategory { .soccer }

    var detailItemsList: [StubDetailSingleItem] {
        var items = [StubDetailSingleItem]()

//        items.append(.init(detailName: .category(category), description: name))
        items.append(.init(detailName: .year, description: year))
        items.append(.init(detailName: .cardNumber, description: cardNumber ?? "-"))
        items.append(.init(detailName: .series, description: series))
        items.append(.init(detailName: .parallel, description: selectedParallel?.name ?? "-"))
        items.append(.init(detailName: .grade, description: cardGrade))

        let colorsString = colors.map({ $0.localizable }).joined(separator: ", ")
        items.append(.init(detailName: colors.count == 1 ? .color : .colors, description: colorsString))

        items.append(.init(detailName: .type, description: type ?? "-"))
        items.append(.init(detailName: .manaValue, description: manaValue ?? "-"))
        items.append(.init(detailName: .power, description: power ?? "-"))
        items.append(.init(detailName: .toughness, description: toughness ?? "-"))
        items.append(.init(detailName: .rarity, description: rarity ?? "-"))

        for option in legalities.keys {
            items.append(.init(
                detailName: .legality(option),
                description: legalities[option]?.localizable ?? "-"
            ))
        }

        return items
    }
}
