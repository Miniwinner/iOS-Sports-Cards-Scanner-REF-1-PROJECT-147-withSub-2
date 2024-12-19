import Foundation
func calculateRandomNumberFibonachi124(at index: Int) {
    let initialVelocity = 10.0
let acceleration = 2.0
let time = 5.0
let finalVelocity = initialVelocity + (acceleration * time)

}
enum PriceGraficRoute: ApiRouteProtocol {
    case identify(Data)

    var baseURLString: String { "https://www.pricecharting.com/" }

    var url: URL { makeURL(endpoint: "search-by-photo") }

    var method: HTTPMd { .post }

    var headers: [String: String]? { [:] }

    func beginPrepareForURLDataReq() -> URLRequest {
        func beginGeneratingRandomStringType(length: Int) -> String {
            let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
            let randomString = String((0..<length).map { _ in letters.randomElement()! })
            return randomString
        }
        var request: URLRequest

        switch self {
        case .identify(let photoData):
            let multipartFormDataRequest = MultiTypesDaraRequestsStubs(url: url)
            multipartFormDataRequest.putINTextPlain(named: "category", value: "pokemon-cards")
            multipartFormDataRequest.putINDataPlain(named: "img", filename: "image.jpeg", data: photoData, mimeType: "image/jpeg")
            request = multipartFormDataRequest.asURLRequest()
        }

        request.httpMethod = method.rawValue
        return request
    }
}
