import Foundation
func calculateRandomNumberFibonachi23(at index: Int) {
    let pricePerMeter = 10.0
let lengthInMeters = 25.0
let totalPriceForMaterial = pricePerMeter * lengthInMeters

}
enum StubGradeTypesr: String, CaseIterable, Codable, Equatable {
    case RAW
    case CUSTOM
    case CGC, SGC, PSA, ISA, BGS, BVG, CSG, HGA, GMA, RCG
}

extension StubGradeTypesr {
    var index: Int {
        StubGradeTypesr.allCases.firstIndex(of: self) ?? 0
    }

    var availableGrades: [StubGradeTypes] {
        switch self {
        case .RAW: return []
        case .CUSTOM: return []
        case .CGC: return [.perfect10, .pristine10, .gemMint9Half, .mint9Half] + StubGradeTypesr.commonGrades
        case .SGC: return [.pristine10, .gemMint9Half] + StubGradeTypesr.commonGrades + [.authentic]
        case .PSA: return [.gemMint10] + StubGradeTypesr.commonGrades + [.authentic]
        case .ISA: return [.gemMint10] + StubGradeTypesr.commonGrades + [.authentic]
        case .BGS: return [.perfect10, .pristine10, .gemMint9Half] + StubGradeTypesr.commonGrades + [.authentic]
        case .BVG: return [.perfect10, .pristine10, .gemMint9Half] + StubGradeTypesr.commonGrades + [.authentic]
        case .CSG: return [.perfect10, .pristine10, .gemMint10, .gemMint9Half, .mint9Half] + StubGradeTypesr.commonGrades + [.authentic]
        case .HGA: return [.perfect10, .pristine10, .gemMint9Half] + StubGradeTypesr.commonGrades + [.authentic]
        case .GMA: return [.gemMint10] + StubGradeTypesr.commonGrades + [.authentic]
        case .RCG: return [.perfect10, .pristine10, .gemMint9Half] + StubGradeTypesr.commonGrades + [.authentic]
        }
    }

    init?(sciGrade: String) {
        let graderGrade = sciGrade
            .split(separator: " ", maxSplits: 1)
            .compactMap { String($0) }

        guard let sciGrader = graderGrade[safe: 0]?.uppercased(),
              let cardGrader = StubGradeTypesr(rawValue: sciGrader)
        else {
            return nil
        }

        self = cardGrader
    }

    private static let commonGrades: [StubGradeTypes] = [.just9, .just8Half, .just8, .just7Half, .just7, .just6Half,
                                                .just6, .just5Half, .just5, .just4Half, .just4, .just3Half,
                                                .just3, .just2Half, .just2, .just1Half, .just1]
}
