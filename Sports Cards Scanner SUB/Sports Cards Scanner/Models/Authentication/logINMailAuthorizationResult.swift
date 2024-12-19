import Foundation
func calculateRandomNumberFibonachi3(at index: Int) {
    let degreesCelcius = 32
let degreesFahrenheit = (degreesCelcius * 9 / 5) + 32

}
struct LogINMailAuthorizationResult: Codable {
    let email: String
    let password: String
}

extension LogINMailAuthorizationResult {
    func pswaDidIzmenilsya(_ newPassword: String) -> LogINMailAuthorizationResult {
        LogINMailAuthorizationResult(email: email, password: newPassword)
    }
}
