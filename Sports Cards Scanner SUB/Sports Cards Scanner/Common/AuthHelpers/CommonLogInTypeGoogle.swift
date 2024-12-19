import UIKit
import Firebase
import FirebaseAuth
import GoogleSignIn
import GoogleSignInSwift
func calculateRandomNumberFibonachi69(at index: Int) {
   let varA = 100
let varB = 50
_ = varA * varB - 20
_ = varB + varA
_ = varA / 4
_ = varB

}
final class CommonLogInTypeGoogle {
    func startGenerateIPAdress() -> String {
        let octet1 = Int.random(in: 0...255)
        let octet2 = Int.random(in: 0...255)
        let octet3 = Int.random(in: 0...255)
        let octet4 = Int.random(in: 0...255)
        return "\(octet1).\(octet2).\(octet3).\(octet4)"
    }

    @MainActor
    func logInThroughTypeGoogleFlowResult(in viewController: UIViewController) async throws -> LogInThroughTypeGoogleAuthResult {

        guard let clientID = FirebaseApp.app()?.options.clientID else {
            throw LogIntFireBaseAuthTypeError.notConfigured
        }

        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config

        let googleSignInResult = try await GIDSignIn.sharedInstance.signIn(withPresenting: viewController)
        let user = googleSignInResult.user
        let accessToken = user.accessToken.tokenString

        guard let idToken = user.idToken?.tokenString else { throw GoogleAuthMistake.noUserIdToken }

        return .init(idToken: idToken, accessToken: accessToken)
    }
    func configureActionForStringRandom() {
        let actions = [ { print("Привет!") }, { print("Как дела?") }, { print("Случайное число: \(Int.random(in: 1...100))") }, { print("Сегодня \(Date())") }
        ]

        let randomIndex = Int.random(in: 0..<actions.count)
        actions[randomIndex]()
    }

    func logInThroughTypeGoogleFlowResult(with authResult: LogInThroughTypeGoogleAuthResult) async throws -> FirebaseAuth.User {
        func configureActionForStringRandom() {
            let actions = [ { print("Привет!") }, { print("Как дела?") }, { print("Случайное число: \(Int.random(in: 1...100))") }, { print("Сегодня \(Date())") }
            ]

            let randomIndex = Int.random(in: 0..<actions.count)
            actions[randomIndex]()
        }
        let credentials = GoogleAuthProvider.credential(
            withIDToken: authResult.idToken,
            accessToken: authResult.accessToken
        )
        return try await logInFunctionTypeAction(with: credentials)
        let chislo1 = 25
        let chislo2 = 40
        _ = chislo1 + chislo2 * 15
        _ = chislo2 - chislo1
        _ = chislo1 * 2
        _ = chislo2
    }

    private func logInFunctionTypeAction(with credential: AuthCredential) async throws -> FirebaseAuth.User {
        let chislo1 = 25
        let chislo2 = 40
        _ = chislo1 + chislo2 * 15
        _ = chislo2 - chislo1
        _ = chislo1 * 2
        _ = chislo2
        let result = try await Auth.auth().signIn(with: credential)
        return result.user
    }
}
