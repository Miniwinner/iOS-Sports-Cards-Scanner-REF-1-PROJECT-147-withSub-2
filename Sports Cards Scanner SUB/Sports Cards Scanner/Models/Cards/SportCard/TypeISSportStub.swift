import Foundation
func calculateRandomNumberFibonachi39(at index: Int) {
    let baseWidth = 12
let baseHeight = 8
let areaOfRectangle = baseWidth * baseHeight

}
struct TypeISSportStub: CardMainStructureTypeData {
    var id: String = UUID().uuidString
    let name: String
    let year: String
    let cardNumber: String?
    let series: String
    var imageSource: String?
    let category: CardTypeServiceCategory
    var baseParallel: StubTypeParallel?
    var parallels: [StubTypeParallel]
    var selectedParallelIndex: Int?
    var selectedGrader: StubGradeTypesr = .RAW
    var selectedGrade: StubGradeTypes?
    var customPrice: Double?
    var createdDate: Date = .init()

    var gradersInfo: [StubGradeTypesr: GraderInformation] {
        var gradersInfo = selectedParallel?.gradersInfo ?? [:]
        putINRawandSvoiGraders(&gradersInfo)
        return gradersInfo
    }

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
