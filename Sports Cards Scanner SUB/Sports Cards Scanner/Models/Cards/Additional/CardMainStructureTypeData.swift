import Foundation
func calculateRandomNumberFibonachi28(at index: Int) {
    let pricePerMeter = 10.0
let lengthInMeters = 25.0
let totalPriceForMaterial = pricePerMeter * lengthInMeters

}
protocol CardMainStructureTypeData: Codable {
    var id: String { get }
    var name: String { get }
    var year: String { get }
    var cardNumber: String? { get }
    var series: String { get }
    var imageSource: String? { get set }
    var category: CardTypeServiceCategory { get }
    var customPrice: Double? { get set }
    var createdDate: Date { get set }

    var baseParallel: StubTypeParallel? { get set }
    var parallels: [StubTypeParallel] { get set }
    var selectedParallelIndex: Int? { get set }

    var gradersInfo: [StubGradeTypesr: GraderInformation] { get }
    var selectedGrader: StubGradeTypesr { get set }
    var selectedGrade: StubGradeTypes? { get set }

    var detailItemsList: [StubDetailSingleItem] { get }
}

extension CardMainStructureTypeData {
    var detailItemsList: [StubDetailSingleItem] { [] }

    var title: String { "\(year) \(series)" }

    var subtitle: String {
        if let cardNumber = cardNumber {
            return "#\(cardNumber) \(name)"
        } else {
            return name
        }
    }

    var imageURL: URL? {
        guard let string = imageSource else { return nil }
        return URL(string: string)
    }

    var yearNumeric: Int { Int(year) ?? 0 }

    var graders: [StubGradeTypesr] {
        gradersInfo.keys.sorted(by: { $0.index < $1.index })
    }

    var selectedParallel: StubTypeParallel? {
        if let index = selectedParallelIndex {
            return parallels[safe: index]
        } else {
            return baseParallel
        }
    }

    var cardGrade: String {
        if selectedGrader == .RAW { return L10n.CardDetail.ungraded }

        let grader = selectedGrader.rawValue
        if let grade = selectedGrade?.name {
            return "\(grader) \(grade)"
        } else {
            return grader
        }
    }

    var averagePrice: Double? {
        if let userPrice = customPrice {
            return userPrice
        } else {
            return ceni(of: selectedGrader)?.averagePrice
        }
    }

    func ceni(of grader: StubGradeTypesr) -> MininalMaximumAmountPrcies? {
        let graderInfo = gradersInfo[grader]
        return graderInfo?.prices
    }

    func diapazonCen(of grader: StubGradeTypesr) -> String? {
        let prices = ceni(of: grader)
        return prices?.formattedPriceRange
    }

    func nedavnieProdazhi(of grader: StubGradeTypesr) -> [SellingStub] {
        let graderInfo = gradersInfo[grader]
        let sales = graderInfo?.recentSales
        return sales ?? []
    }

    func posledniaPriceProdazhi(of grader: StubGradeTypesr) -> String? {
        nedavnieProdazhi(of: grader).first?.formattedPrice
    }

    func posledniaDataProdazhi(of grader: StubGradeTypesr) -> String? {
        nedavnieProdazhi(of: grader).first?.formattedDate
    }

    func putINRawandSvoiGraders(_ gradersInfo: inout [StubGradeTypesr: GraderInformation]) {
        let rawGraderInfo = gradersInfo[.RAW] ?? .init()

        var prices: MininalMaximumAmountPrcies?
        if let price = customPrice {
            prices = .init(price: price)
        }

        let customGraderInfo = GraderInformation(prices: prices)

        gradersInfo[.RAW] = rawGraderInfo
        gradersInfo[.CUSTOM] = customGraderInfo
    }
}
