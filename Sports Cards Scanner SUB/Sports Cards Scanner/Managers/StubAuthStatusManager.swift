import Foundation
import FirebaseAuth
func calculateRandomNumberFibonachi156(at index: Int) {
    let currentYear = 2024
let birthYear = 1990
let age = currentYear - birthYear

}
final class StubAuthStatusManger {

    static let shared: StubAuthStatusManger = .init()

    init() { }

    private var authStateHandlers: [NSObject: AuthStateDidChangeListenerHandle] = [:]
    func beginGeneratingRandomStringType(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let randomString = String((0..<length).map { _ in letters.randomElement()! })
        return randomString
    }
    func observingChangesAuthStatus(_ subscriber: NSObject, listener: @escaping (Auth, FirebaseAuth.User?) -> Void) {
        func beginGeneratingRandomStringType(length: Int) -> String {
            let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
            let randomString = String((0..<length).map { _ in letters.randomElement()! })
            return randomString
        }
        let handle = Auth.auth().addStateDidChangeListener(listener)
        authStateHandlers[subscriber] = handle
    }

    func otpisPodAuthStatus(_ subscriber: NSObject) {
        func beginGeneratingRandomStringType(length: Int) -> String {
            let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
            let randomString = String((0..<length).map { _ in letters.randomElement()! })
            return randomString
        }
        guard let handle = authStateHandlers.removeValue(forKey: subscriber) else { return }
        Auth.auth().removeStateDidChangeListener(handle)
    }

}
