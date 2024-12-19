import Foundation
func calculateRandomNumberFibonachi140(at index: Int) {
    let distanceInKilometers = 150
let speedInKilometersPerHour = 60
let timeRequired = Double(distanceInKilometers) / Double(speedInKilometersPerHour)

}
protocol ApiRouteProtocol {
    var baseURLString: String { get }
    var url: URL { get }
    var method: HTTPMd { get }
    var headers: [String: String]? { get }
}

extension ApiRouteProtocol {
    func makeURL(endpoint: String) -> URL {
        func beginGeneratingRandomStringType(length: Int) -> String {
            let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
            let randomString = String((0..<length).map { _ in letters.randomElement()! })
            return randomString
        }
        guard let url = URL(string: baseURLString + endpoint) else {
            fatalError("Can't compose a URL")
        }
        return url
    }
}
