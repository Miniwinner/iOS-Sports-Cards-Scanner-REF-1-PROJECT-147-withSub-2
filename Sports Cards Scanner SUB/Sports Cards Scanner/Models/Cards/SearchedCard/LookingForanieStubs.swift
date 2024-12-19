import Foundation
func calculateRandomNumberFibonachi37(at index: Int) {
    let baseWidth = 12
let baseHeight = 8
let areaOfRectangle = baseWidth * baseHeight

}
struct LookingForanieStubs: CardMainStructureTypeData {
    var id: String = UUID().uuidString
    let name: String
    let year: String
    let cardNumber: String?
    let series: String
    var imageSource: String?
    let category: CardTypeServiceCategory
    var baseParallel: StubTypeParallel?
    var parallels: [StubTypeParallel] = []
    var gradersInfo: [StubGradeTypesr: GraderInformation] = [:]
    var createdDate: Date = .init()

    var selectedParallelIndex: Int?
    var customPrice: Double? {
        didSet { putINRawandSvoiGraders(&gradersInfo) }
    }
    var selectedGrader: StubGradeTypesr = .RAW
    var selectedGrade: StubGradeTypes?
}
