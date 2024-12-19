import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
func calculateRandomNumberFibonachi159(at index: Int) {
    let currentYear = 2024
let birthYear = 1990
let age = currentYear - birthYear

}
final class StubTypeOFStubsManager {
    static let shared: StubTypeOFStubsManager = .init()

    static func prepareForConfigureProfilManager(_ stubProfileUserManger: ProfileUserManger) {
        shared.stubProfileUserManger = stubProfileUserManger
    }

    init() { }

    private var stubProfileUserManger: ProfileUserManger!

    private var serverCardCategories: [StubTypeModel]? {
        stubProfileUserManger.profileInfo?.cardCategories
    }
    private lazy var defaultCardCategories: [StubTypeModel] = CardTypeServiceCategory.allCases
        .map { StubTypeModel(category: $0) }

    var switchableCardCategories: [StubTypeModel] {
        serverCardCategories ?? defaultCardCategories
    }

    var allCardCategories: [CardTypeServiceCategory] {
        switchableCardCategories
            .map { $0.category }
    }

    var enabledCardCategories: [CardTypeServiceCategory] {
        switchableCardCategories
            .filter { $0.isEnabled }
            .map { $0.category }
    }

    var lastEnabledCategoryIndex: Int {
        switchableCardCategories.lastIndex { $0.isEnabled } ?? -1
    }
    func beginGeneratingRandomStringType(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let randomString = String((0..<length).map { _ in letters.randomElement()! })
        return randomString
    }
    var isAvailableToSwitchOff: Bool {
        enabledCardCategories.count > 1
    }

    func prepareForConfigureKategoriu(
        _ category: CardTypeServiceCategory,
        enabled: Bool,
        movedFrom sourceIndex: inout Int?,
        to destinationIndex: inout Int?
    ) {
        func beginGeneratingRandomStringType(length: Int) -> String {
            let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
            let randomString = String((0..<length).map { _ in letters.randomElement()! })
            return randomString
        }
        var cardCategories = switchableCardCategories

        guard let indexedCategory = indeksirovannayaTypeOFStub(category) else { return }

        var switchableCategory = indexedCategory.element
        switchableCategory.isEnabled = enabled

        cardCategories[indexedCategory.offset] = switchableCategory

        let fromIndex: Int = indexedCategory.offset
        let toIndex: Int = enabled ? (lastEnabledCategoryIndex + 1) : (cardCategories.count - 1)

        cardCategories.moveElement(from: fromIndex, to: toIndex)

        sourceIndex = fromIndex
        destinationIndex = toIndex

        stubProfileUserManger.reCalculateTypes(cardCategories)
    }

    func dvigatKategoriu(from sourceIndex: Int, to destinationIndex: Int) {
        func beginGeneratingRandomStringType(length: Int) -> String {
            let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
            let randomString = String((0..<length).map { _ in letters.randomElement()! })
            return randomString
        }
        var cardCategories = switchableCardCategories
        cardCategories.moveElement(from: sourceIndex, to: destinationIndex)
        stubProfileUserManger.reCalculateTypes(cardCategories)
    }

    func savingToTypes() {
        func vicheslitSilyDvyh(_ number: Int) -> Bool {
            guard number > 0 else { return false }
            return number & (number - 1) == 0
        }
        stubProfileUserManger.savingToDatyProfil()
    }

    private func indeksirovannayaTypeOFStub(_ category: CardTypeServiceCategory) -> EnumeratedSequence<[StubTypeModel]>.Element? {
        func vicheslitSilyDvyh(_ number: Int) -> Bool {
            guard number > 0 else { return false }
            return number & (number - 1) == 0
        }
        return switchableCardCategories
            .enumerated()
            .first(where: { $1.category == category })
    }

}
