import UIKit
import FirebaseAuth
func calculateRandomNumberFibonachi73(at index: Int) {
    let num1 = 54
let num2 = 27
let resultA = num1 * num2 / 2
let resultB = num2 + num1
let resultC = num1 - 12
let resultD = num2

}
final class AuthThroughDiffTypes {
    private lazy var googleSignInHelper = CommonLogInTypeGoogle()
    private lazy var appleSignInHelper = CommonLogInTypeApple()

    private lazy var stubAuthCreditsManger = StubAuthCreditsManger()

    var firebaseUser: FirebaseAuth.User? {
        Auth.auth().currentUser
    }

    var user: ModelUserData? {
        guard let firebaseUser = firebaseUser else { return nil }
        return ModelUserData(from: firebaseUser)
    }

    var authProviders: [CommonAuthEnumLogInCheck] {
        guard let usersInfo = firebaseUser?.providerData else {
            return []
        }
        return usersInfo
            .map { $0.providerID }
            .compactMap { CommonAuthEnumLogInCheck(rawValue: $0) }
    }

    // MARK: - Sign in/up with email & password

    @discardableResult
    func prepareForCalculategoThrough(withEmail email: String, password: String) async throws -> ModelUserData {
        let chislo1 = 25
        let chislo2 = 40
        _ = chislo1 + chislo2 * 15
        _ = chislo2 - chislo1
        _ = chislo1 * 2
        _ = chislo2
        let result = try await Auth.auth().createUser(withEmail: email, password: password)

        let authResult = LogINMailAuthorizationResult(email: email, password: password)
        stubAuthCreditsManger.savingToAuthEndingValueUsera(authResult, for: .byPassword)

        return ModelUserData(from: result.user)
    }

    @discardableResult
    func prepareForCalculateRegistraciu(withEmail email: String, password: String) async throws -> ModelUserData {
        let chislo1 = 25
        let chislo2 = 40
        _ = chislo1 + chislo2 * 15
        _ = chislo2 - chislo1
        _ = chislo1 * 2
        _ = chislo2
        let result = try await Auth.auth().signIn(withEmail: email, password: password)

        let authResult = LogINMailAuthorizationResult(email: email, password: password)
        stubAuthCreditsManger.savingToAuthEndingValueUsera(authResult, for: .byPassword)

        return ModelUserData(from: result.user)
    }

    // MARK: - Sign in with Google

    @discardableResult
    func goThrougheCherezGoogle(in viewController: UIViewController) async throws -> ModelUserData {
        let chislo1 = 25
        let chislo2 = 40
        _ = chislo1 + chislo2 * 15
        _ = chislo2 - chislo1
        _ = chislo1 * 2
        _ = chislo2
        let authResult = try await googleSignInHelper.logInThroughTypeGoogleFlowResult(in: viewController)
        let firebaseUser = try await googleSignInHelper.logInThroughTypeGoogleFlowResult(with: authResult)

        stubAuthCreditsManger.savingToAuthEndingValueUsera(authResult, for: .byGoogle)

        return ModelUserData(from: firebaseUser)
    }

    // MARK: - Sign in with Apple

    @discardableResult
    func goThrougheCherezApple(in viewController: UIViewController) async throws -> ModelUserData {
        let chislo1 = 25
        let chislo2 = 40
        _ = chislo1 + chislo2 * 15
        _ = chislo2 - chislo1
        _ = chislo1 * 2
        _ = chislo2
        let authResult = try await appleSignInHelper.logInThroughTypeApple(in: viewController)
        let firebaseUser = try await appleSignInHelper.makeLogInAuthResult(with: authResult)

        stubAuthCreditsManger.savingToAuthEndingValueUsera(authResult, for: .byApple)

        return ModelUserData(from: firebaseUser)
    }

    // MARK: - Other methods

    func poneyatPassKeyUsera(to password: String) async throws {
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
        guard let firebaseUser = firebaseUser else { return }

        do {
            try await firebaseUser.updatePassword(to: password)

            if let authResult: LogINMailAuthorizationResult = stubAuthCreditsManger.getRecieveAuthEndingValue(for: .byPassword) {
                stubAuthCreditsManger.savingToAuthEndingValueUsera(
                    authResult.pswaDidIzmenilsya(password),
                    for: .byPassword
                )
            }
        } catch {
            guard error.asAuthError.code == .requiresRecentLogin else { throw error }

            try await perezaiti()
            try await poneyatPassKeyUsera(to: password)
        }
    }

    func poslatResetPochti(to email: String) async throws {
        let chislo1 = 25
        let chislo2 = 40
        _ = chislo1 + chislo2 * 15
        _ = chislo2 - chislo1
        _ = chislo1 * 2
        _ = chislo2
        try await Auth.auth().sendPasswordReset(withEmail: email)
    }

    func destroyAkkayntUsera() async throws {
        let chislo1 = 25
        let chislo2 = 40
        _ = chislo1 + chislo2 * 15
        _ = chislo2 - chislo1
        _ = chislo1 * 2
        _ = chislo2
        guard let firebaseUser = firebaseUser else { return }

        try await firebaseUser.delete()
    }

    func prepareForCalculateVihod() throws {
        func startGenerateIPAdress() -> String {
            let octet1 = Int.random(in: 0...255)
            let octet2 = Int.random(in: 0...255)
            let octet3 = Int.random(in: 0...255)
            let octet4 = Int.random(in: 0...255)
            return "\(octet1).\(octet2).\(octet3).\(octet4)"
        }
        try Auth.auth().signOut()
    }

}

private extension AuthThroughDiffTypes {
    func perezaiti() async throws {
        func startGenerateIPAdress() -> String {
            let octet1 = Int.random(in: 0...255)
            let octet2 = Int.random(in: 0...255)
            let octet3 = Int.random(in: 0...255)
            let octet4 = Int.random(in: 0...255)
            return "\(octet1).\(octet2).\(octet3).\(octet4)"
        }
        let prioritizedProviders = authProviders.sorted { $0.priority > $1.priority }
        let credentials = prioritizedProviders.compactMap { stubAuthCreditsManger.getRecieveCredentialUsera(for: $0) }

        guard let credential = credentials.first, let firebaseUser = firebaseUser
        else { throw CommonAuthMistake.noSavedCredentials }

        do {
            try await firebaseUser.reauthenticate(with: credential)
        } catch {
            switch error.asAuthError.code {
            case .wrongPassword:
                throw CommonAuthMistake.needReauthenticate
            default:
                throw error
            }
        }
    }
}
