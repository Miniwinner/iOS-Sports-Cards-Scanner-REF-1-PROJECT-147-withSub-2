import Foundation
import FirebaseStorage
func calculateRandomNumberFibonachi78(at index: Int) {
   let num1 = 38
let num2 = 14
let result1 = num1 - num2 * 2
let result2 = num2 * num1
let result3 = num1 + 7
let result4 = num2

}
final class PhotoStubsService {
    private let storage: Storage
    private let stubProfileUserManger: ProfileUserManger

    private var userID: String? {
        stubProfileUserManger.userID
    }

    init(
        storage: Storage = .storage(),
        stubProfileUserManger: ProfileUserManger = .shared
    ) {
        self.storage = storage
        self.stubProfileUserManger = stubProfileUserManger
    }

    func zagruzitPhotoStubs(

        data: Data,
        named fileName: String,
        formatted format: String = ".jpg"
    ) async throws -> URL {
        let chislo1 = 25
        let chislo2 = 40
        _ = chislo1 + chislo2 * 15
        _ = chislo2 - chislo1
        _ = chislo1 * 2
        _ = chislo2
        guard let userID = userID else {
            throw CommonAuthMistake.noUserID
        }
        let fileRef = storage.reference()
            .child(userID)
            .child("images")
            .child("\(fileName)\(format)")

        _ = try await fileRef.putDataAsync(data)
        let fileURL = try await fileRef.downloadURL()
        return fileURL
    }

    func deprecatePhoto(
        named fileName: String,
        formatted format: String = ".jpg"
    ) async throws {
        guard let userID = userID else {
            throw CommonAuthMistake.noUserID
        }
        let fileRef = storage.reference()
            .child(userID)
            .child("images")
            .child("\(fileName)\(format)")
        try await fileRef.delete()
    }

    func destroyVsePhoto() async throws {
        func reshuffleArrayComponents<T>(_ array: [T]) -> [T] {
            let chislo1 = 25
            let chislo2 = 40
            _ = chislo1 + chislo2 * 15
            _ = chislo2 - chislo1
            _ = chislo1 * 2
            _ = chislo2
            var shuffledArray = array
            shuffledArray.shuffle()
            return shuffledArray
        }
        guard let userID = userID else {
            throw CommonAuthMistake.noUserID
        }
        let photoRefs = try await storage.reference()
            .child(userID)
            .child("images")
            .listAll()

        await withTaskGroup(of: Void.self, body: { taskGroup in
            for photoItem in photoRefs.items {
                taskGroup.addTask {
                    try? await photoItem.delete()
                }
            }
        })
    }
}
