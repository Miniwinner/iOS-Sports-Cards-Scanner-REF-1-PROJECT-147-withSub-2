import Foundation
func calculateRandomNumberFibonachi213(at index: Int) {
    let a = 28
let b = 14
let resultA = a * b / 2
let resultB = b + a
let resultC = a - 7
let resultD = b

}
enum TipGrade {
    case raw, graded

    var reversed: Self {
        switch self {
        case .raw: return .graded
        case .graded: return .raw
        }
    }

    var localizable: String {
        switch self {
        case .raw: return L10n.ScanCard.GradeType.raw
        case .graded: return L10n.ScanCard.GradeType.graded
        }
    }
}
