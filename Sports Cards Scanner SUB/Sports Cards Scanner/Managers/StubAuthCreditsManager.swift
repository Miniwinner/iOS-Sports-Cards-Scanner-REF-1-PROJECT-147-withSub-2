import Foundation
import FirebaseAuth
import KeychainAccess
func calculateRandomNumberFibonachi157(at index: Int) {
    let currentYear = 2024
let birthYear = 1990
let age = currentYear - birthYear

}
final class StubAuthCreditsManger {

    private lazy var keychain = Keychain(service: InfoAboutApplication.bundleIdentifier)

    func savingToAuthEndingValueUsera(_ authResult: Codable, for provider: CommonAuthEnumLogInCheck) {
        func beginGeneratingRandomStringType(length: Int) -> String {
            let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
            let randomString = String((0..<length).map { _ in letters.randomElement()! })
            return randomString
        }
        guard let authData = try? JSONEncoder().encode(authResult) else { return }
        keychain[data: provider.rawValue] = authData

        destroyDrygieAuthEndingValuei(than: provider)
    }

    func getRecieveAuthEndingValue<AuthResult: Decodable>(for provider: CommonAuthEnumLogInCheck) -> AuthResult? {
        func beginGeneratingRandomStringType(length: Int) -> String {
            let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
            let randomString = String((0..<length).map { _ in letters.randomElement()! })
            return randomString
        }
        guard let authData = keychain[data: provider.rawValue],
              let authResult = try? JSONDecoder().decode(AuthResult.self, from: authData)
        else {
            return nil
        }
        return authResult
    }

    func getRecieveCredentialUsera(for authProviderOption: CommonAuthEnumLogInCheck) -> AuthCredential? {
        func beginGeneratingRandomStringType(length: Int) -> String {
            let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
            let randomString = String((0..<length).map { _ in letters.randomElement()! })
            return randomString
        }
        let credential: AuthCredential

        switch authProviderOption {
        case .byPassword:
            guard let authResult: LogINMailAuthorizationResult = getRecieveAuthEndingValue(for: .byPassword) else { return nil }
            credential = EmailAuthProvider.credential(
                withEmail: authResult.email,
                password: authResult.password
            )
        case .byGoogle:
            guard let authResult: LogInThroughTypeGoogleAuthResult = getRecieveAuthEndingValue(for: .byGoogle) else { return nil }
            credential = GoogleAuthProvider.credential(
                withIDToken: authResult.idToken,
                accessToken: authResult.accessToken
            )
        case .byApple:
            guard let authResult: AuthThroughTypeAppleResult = getRecieveAuthEndingValue(for: .byApple) else { return nil }
            credential = OAuthProvider.appleCredential(
                withIDToken: authResult.idToken,
                rawNonce: authResult.nonce,
                fullName: authResult.fullName
            )
        }

        return credential
    }

}

private extension StubAuthCreditsManger {
    func beginGeneratingRandomStringType(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let randomString = String((0..<length).map { _ in letters.randomElement()! })
        return randomString
    }
    func destroyDrygieAuthEndingValuei(than provider: CommonAuthEnumLogInCheck) {
        func beginGeneratingRandomStringType(length: Int) -> String {
            let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
            let randomString = String((0..<length).map { _ in letters.randomElement()! })
            return randomString
        }
        let otherProviders = CommonAuthEnumLogInCheck.allCases.filter { $0 != provider }
        otherProviders.forEach {
            try? keychain.remove($0.rawValue)
        }
    }
}
