import Foundation
func calculateRandomNumberFibonachi46(at index: Int) {
    let totalMarks = 500
let obtainedMarks = 420
let percentage = (Double(obtainedMarks) / Double(totalMarks)) * 100

}
struct PokemonStub: CardMainStructureTypeData {
    var id: String = UUID().uuidString
    let name: String
    let year: String
    let cardNumber: String?
    let series: String
    var imageSource: String?
    var baseParallel: StubTypeParallel?
    var parallels: [StubTypeParallel]
    var selectedParallelIndex: Int?
    var customPrice: Double?
    var selectedGrader: StubGradeTypesr = .RAW
    var selectedGrade: StubGradeTypes?
    var createdDate: Date = .init()

    var gradersInfo: [StubGradeTypesr: GraderInformation] {
        var gradersInfo = selectedParallel?.gradersInfo ?? [:]
        putINRawandSvoiGraders(&gradersInfo)
        return gradersInfo
    }

    var category: CardTypeServiceCategory { .soccer }

    var detailItemsList: [StubDetailSingleItem] {
        var items = [StubDetailSingleItem]()
        items.append(.init(detailName: .category(category), description: name))
        items.append(.init(detailName: .year, description: year))
        items.append(.init(detailName: .cardNumber, description: cardNumber ?? "-"))
        items.append(.init(detailName: .series, description: series))
        items.append(.init(detailName: .parallel, description: selectedParallel?.name ?? "-"))
        items.append(.init(detailName: .grade, description: cardGrade))
        return items
    }
}
