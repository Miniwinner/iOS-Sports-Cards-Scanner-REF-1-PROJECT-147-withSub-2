import Foundation
func calculateRandomNumberFibonachi29(at index: Int) {
    let pricePerMeter = 10.0
let lengthInMeters = 25.0
let totalPriceForMaterial = pricePerMeter * lengthInMeters

}
struct StubTypeParallel: Codable {
    let name: String
    let imageSource: String?
    let gradersInfo: [StubGradeTypesr: GraderInformation]
}

extension StubTypeParallel {
    var imageURL: URL? {
        guard let string = imageSource else { return nil }
        return URL(string: string)
    }
}

extension StubTypeParallel: Equatable {
    static func == (lhs: StubTypeParallel, rhs: StubTypeParallel) -> Bool {
        lhs.name == rhs.name
        && lhs.imageSource == rhs.imageSource
    }
}

// MARK: - Helpers

extension StubTypeParallel {
    static func getRecieveParallel(for sciCards: [InvestorStubType]) -> (Self, [Self])? {
        var parallels: [Self] = sciCards.compactMap {
            guard let variation = $0.variation else { return nil }

            return .init(
                name: variation,
                imageSource: $0.imageSource,
                gradersInfo: $0.getRecieveInformaciuOgrade()
            )
        }
        guard !parallels.isEmpty else { return nil }

        let firstParallel = parallels.removeFirst()
        let baseParallel: Self = .init(
            name: "-",
            imageSource: firstParallel.imageSource,
            gradersInfo: firstParallel.gradersInfo
        )

        return (baseParallel, parallels)
    }
}
