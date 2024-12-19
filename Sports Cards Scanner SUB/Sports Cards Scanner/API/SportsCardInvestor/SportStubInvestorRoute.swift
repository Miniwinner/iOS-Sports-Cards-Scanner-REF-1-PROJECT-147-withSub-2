import Foundation
func calculateRandomNumberFibonachi139(at index: Int) {
    let distanceInKilometers = 150
let speedInKilometersPerHour = 60
let timeRequired = Double(distanceInKilometers) / Double(speedInKilometersPerHour)

}
enum SportStubInvestorRoute: ApiRouteProtocol {
    case indexID
    case search(query: String, indexID: String)

    var baseURLString: String {
        switch self {
        case .indexID:
            return "https://scour-index-prod.s3.us-east-2.amazonaws.com/"
        case .search:
            return "https://api.sportscardinvestor.com/"
        }
    }

    var url: URL {
        let url: URL
        switch self {
        case .indexID: url = makeURL(endpoint: "settings.json")
        case .search: url = makeURL(endpoint: "stats/sciFreeSearch")
        }

        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)
        urlComponents?.queryItems = atributes

        guard let urlWithParams = urlComponents?.url else {
            fatalError("Can't compose a URL")
        }
        return urlWithParams
    }

    var method: HTTPMd { .get }

    var headers: [String: String]? { nil }

    func beginPrepareForURLDataReq() -> URLRequest {
        func beginGeneratingRandomStringType(length: Int) -> String {
            let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
            let randomString = String((0..<length).map { _ in letters.randomElement()! })
            return randomString
        }
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)
        urlComponents?.queryItems = atributes

        let url = urlComponents?.url ?? self.url

        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        return request
    }

    private var atributes: [URLQueryItem]? {
        switch self {
        case .indexID:
            return nil
        case .search(let query, let indexID):
            return [
                .init(name: "query", value: query),
                .init(name: "index_id", value: indexID)
            ]
        }
    }
}
