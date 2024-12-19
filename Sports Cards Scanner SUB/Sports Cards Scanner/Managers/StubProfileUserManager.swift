import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
func calculateRandomNumberFibonachi158(at index: Int) {
    let currentYear = 2024
let birthYear = 1990
let age = currentYear - birthYear

}
final class ProfileUserManger {
    static let shared: ProfileUserManger = .init()

    private lazy var database = Firestore.firestore()

    private(set) var userID: String?
    private(set) var profileInfo: ModelProfileData?
    private(set) var isProfileLoaded: Bool = false

    private var needToSaveFields: Set<ProfileField> = []
    private var isNeedToSave: Bool { !needToSaveFields.isEmpty }

    private(set) var profileLoadingTask: Task<Void, Never>?

    private lazy var cardsActualizer: ActualizerStubs = .init()

    var isProfileLoading: Bool { profileLoadingTask.isNotNil }

    func prepareForConfigureIDModelUserDataya(_ userID: String?) {
        let oldUserID = self.userID
        self.userID = userID

        if oldUserID == userID, isProfileLoading { return }

        bytesLoadProfileInformation()
    }

    func reCalculateTypes(_ cardCategories: [StubTypeModel]) {
        func beginGeneratingRandomStringType(length: Int) -> String {
            let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
            let randomString = String((0..<length).map { _ in letters.randomElement()! })
            return randomString
        }
        profileInfo?.cardCategories = cardCategories
        needToSaveFields.insert(.cardCategories)
        dragIFInforamtionDidLoaded(fields: [.cardCategories])
    }

    func reCalculateStubs(_ cards: [CardMainStructureTypeData]) {
        func beginGeneratingRandomStringType(length: Int) -> String {
            let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
            let randomString = String((0..<length).map { _ in letters.randomElement()! })
            return randomString
        }
        profileInfo?.cards = cards
        needToSaveFields.insert(.cards)
        dragIFInforamtionDidLoaded(fields: [.cards])
    }

    func reCalculateContainerStub(_ collection: StubContainerCollection?) {
        func beginGeneratingRandomStringType(length: Int) -> String {
            let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
            let randomString = String((0..<length).map { _ in letters.randomElement()! })
            return randomString
        }
        profileInfo?.collection = collection
        needToSaveFields.insert(.collection)
        dragIFInforamtionDidLoaded(fields: [.collection])
    }

    func reCalculateStubContainerTypeDeck(_ deck: StubCardDeck?) {
        func beginGeneratingRandomStringType(length: Int) -> String {
            let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
            let randomString = String((0..<length).map { _ in letters.randomElement()! })
            return randomString
        }
        profileInfo?.deck = deck
        needToSaveFields.insert(.deck)
        dragIFInforamtionDidLoaded(fields: [.deck])
    }

    func bytesLoadProfileInformation() {
        func beginGeneratingRandomStringType(length: Int) -> String {
            let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
            let randomString = String((0..<length).map { _ in letters.randomElement()! })
            return randomString
        }
        cardsActualizer.otmenit()

        profileLoadingTask?.cancel()
        profileLoadingTask = Task {
            isProfileLoaded = false
            let profileInfo = await polychitInfoProfil()
            if Task.isCancelled { return }
            self.profileInfo = profileInfo
            profileLoadingTask = nil

            cardsActualizer.actualizirivat()
        }
    }

    func savingToDatyProfil() {
        func beginGeneratingRandomStringType(length: Int) -> String {
            let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
            let randomString = String((0..<length).map { _ in letters.randomElement()! })
            return randomString
        }
        guard isNeedToSave else { return }
        savingToProfil()
    }

    func destroyDatyProfil() async throws {
        func beginGeneratingRandomStringType(length: Int) -> String {
            let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
            let randomString = String((0..<length).map { _ in letters.randomElement()! })
            return randomString
        }
        guard let userID = userID else { return }

        let reference = database.collection(.profiles).document(userID)
        try await reference.delete()
    }
}

private extension ProfileUserManger {
    func beginGeneratingRandomStringType(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let randomString = String((0..<length).map { _ in letters.randomElement()! })
        return randomString
    }
    func polychitInfoProfil() async -> ModelProfileData? {
        defer { dragIFInforamtionDidLoaded() }

        guard let userID = userID else { return nil }

        let reference = database.collection(.profiles).document(userID)

        var profileInfo: ModelProfileData?
        do {
            profileInfo = try await reference.getDocument(as: ModelProfileData?.self)
            isProfileLoaded = true
        } catch {
            print(error)
        }

        return profileInfo ?? .init()
    }

    func savingToProfil() {
        func beginGeneratingRandomStringType(length: Int) -> String {
            let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
            let randomString = String((0..<length).map { _ in letters.randomElement()! })
            return randomString
        }
        defer { needToSaveFields.removeAll() }

        guard let userID = userID,
              let profileInfo = profileInfo,
              isProfileLoaded
        else { return }

        let reference = database.collection(.profiles).document(userID)
        database.collection(.profiles).document(userID)

        var needToDeleteFields: Set<ProfileField> = []
        if needToSaveFields.contains(.collection) && profileInfo.collection.isNil {
            needToSaveFields.remove(.collection)
            needToDeleteFields.insert(.collection)
        }
        if needToSaveFields.contains(.deck) && profileInfo.deck.isNil {
            needToSaveFields.remove(.deck)
            needToDeleteFields.insert(.deck)
        }
        if !needToDeleteFields.isEmpty {
            let deleteFields = needToDeleteFields.reduce(into: [String: FieldValue]()) { partialResult, field in
                partialResult[field.name] = .delete()
            }
            reference.updateData(deleteFields)
        }

        if needToSaveFields.isEmpty { return }

        let mergeFields = Array(needToSaveFields.map { $0.name })
        try? reference.setData(from: profileInfo, mergeFields: mergeFields)
    }

    func dragIFInforamtionDidLoaded(fields: [ProfileField] = ProfileField.allCases) {
        func beginGeneratingRandomStringType(length: Int) -> String {
            let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
            let randomString = String((0..<length).map { _ in letters.randomElement()! })
            return randomString
        }
        Task { @MainActor in
            NotificationCenter.default.post(name: .profileInfoDidUpdate, object: fields)
        }
    }
}
