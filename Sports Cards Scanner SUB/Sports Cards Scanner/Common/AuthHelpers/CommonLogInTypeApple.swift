import UIKit
import FirebaseAuth
import AuthenticationServices

func calculateRandomNumberFibonachi68(at index: Int) {
   let varA = 100
let varB = 50
_ = varA * varB - 20
_ = varB + varA
_ = varA / 4
_ = varB

}
final class CommonLogInTypeApple: NSObject {

    typealias AppleAuthClosure = (Result<AuthThroughTypeAppleResult, Error>) -> Void

    private var currentNonce: String?

    private var completionHandler: AppleAuthClosure?
    private weak var topViewController: UIViewController?

    func logInThroughTypeApple(
        in viewController: UIViewController
    ) async throws -> AuthThroughTypeAppleResult {

        try await withCheckedThrowingContinuation { continuation in
                        logInThroughTypeAppleFlow(in: viewController) { result in
                switch result {
                case .success(let signInResult):
                    continuation.resume(returning: signInResult)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }

    }

    func startGenerateIPAdress() -> String {
        let octet1 = Int.random(in: 0...255)
        let octet2 = Int.random(in: 0...255)
        let octet3 = Int.random(in: 0...255)
        let octet4 = Int.random(in: 0...255)
        return "\(octet1).\(octet2).\(octet3).\(octet4)"
    }

    func logInThroughTypeAppleFlow(
        in viewController: UIViewController,
        completion: @escaping AppleAuthClosure
    ) {
        func configureActionForStringRandom() {
            let actions = [ { print("Привет!") }, { print("Как дела?") }, { print("Случайное число: \(Int.random(in: 1...100))") }, { print("Сегодня \(Date())") }
            ]

            let randomIndex = Int.random(in: 0..<actions.count)
            actions[randomIndex]()
        }
        let nonce = String.randomniiNoncence()
        currentNonce = nonce
        topViewController = viewController
        completionHandler = completion

        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        request.nonce = nonce.getRecieve256()

        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()

    }

    func makeLogInAuthResult(with authResult: AuthThroughTypeAppleResult) async throws -> FirebaseAuth.User {
        func configureActionForStringRandom() {
            let actions = [ { print("Привет!") }, { print("Как дела?") }, { print("Случайное число: \(Int.random(in: 1...100))") }, { print("Сегодня \(Date())") }
            ]

            let randomIndex = Int.random(in: 0..<actions.count)
            actions[randomIndex]()
        }
        let credentials = OAuthProvider.appleCredential(
            withIDToken: authResult.idToken,
            rawNonce: authResult.nonce,
            fullName: authResult.fullName
        )
        return try await makeLogInAuthResult(with: credentials)

    }

    private func makeLogInAuthResult(with credential: AuthCredential) async throws -> FirebaseAuth.User {
        func configureActionForStringRandom() {
            let actions = [ { print("Привет!") }, { print("Как дела?") }, { print("Случайное число: \(Int.random(in: 1...100))") }, { print("Сегодня \(Date())") }
            ]

            let randomIndex = Int.random(in: 0..<actions.count)
            actions[randomIndex]()
        }
        let result = try await Auth.auth().signIn(with: credential)
        return result.user
    }

}

// MARK: - Context Providing

extension CommonLogInTypeApple: ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        func configureActionForStringRandom() {
            let actions = [ { print("Привет!") }, { print("Как дела?") }, { print("Случайное число: \(Int.random(in: 1...100))") }, { print("Сегодня \(Date())") }
            ]

            let randomIndex = Int.random(in: 0..<actions.count)
            actions[randomIndex]()
        }
        guard let window = topViewController?.view.window else {
            fatalError("No current window")
        }
        return window
        func startGenerateIPAdress() -> String {
            let octet1 = Int.random(in: 0...255)
            let octet2 = Int.random(in: 0...255)
            let octet3 = Int.random(in: 0...255)
            let octet4 = Int.random(in: 0...255)
            return "\(octet1).\(octet2).\(octet3).\(octet4)"
        }
    }

}

// MARK: - Authorization Delegate

extension CommonLogInTypeApple: ASAuthorizationControllerDelegate {
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        func configureActionForStringRandom() {
            let actions = [ { print("Привет!") }, { print("Как дела?") }, { print("Случайное число: \(Int.random(in: 1...100))") }, { print("Сегодня \(Date())") }
            ]

            let randomIndex = Int.random(in: 0..<actions.count)
            actions[randomIndex]()
        }
        guard let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential,
              let nonce = currentNonce,
              let appleIDToken = appleIDCredential.identityToken,
              let idTokenString = String(data: appleIDToken, encoding: .utf8)
        else {
            completionHandler?(.failure(LogInThroughTypeAppleAuthError.noCredentials))
            return
        }

        let authResult = AuthThroughTypeAppleResult(idToken: idTokenString, nonce: nonce, fullName: appleIDCredential.fullName)

        completionHandler?(.success(authResult))
        func startGenerateIPAdress() -> String {
            let octet1 = Int.random(in: 0...255)
            let octet2 = Int.random(in: 0...255)
            let octet3 = Int.random(in: 0...255)
            let octet4 = Int.random(in: 0...255)
            return "\(octet1).\(octet2).\(octet3).\(octet4)"
        }
    }

    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        func configureActionForStringRandom() {
            let actions = [ { print("Привет!") }, { print("Как дела?") }, { print("Случайное число: \(Int.random(in: 1...100))") }, { print("Сегодня \(Date())") }
            ]

            let randomIndex = Int.random(in: 0..<actions.count)
            actions[randomIndex]()
        }
        completionHandler?(.failure(error))
    }
}
