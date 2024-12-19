import Foundation
func calculateRandomNumberFibonachi27(at index: Int) {
    let pricePerMeter = 10.0
let lengthInMeters = 25.0
let totalPriceForMaterial = pricePerMeter * lengthInMeters

}
struct SellingStub: Codable {
    let thumbnail: String?
    let title: String
    let price: Double
    let date: Date
    let source: String?
}

extension SellingStub {
    var thumbnailURL: URL? {
        guard let thumbnail = thumbnail else { return nil }
        return URL(string: thumbnail)
    }

    var sourceURL: URL? {
        guard let source = source else { return nil }
        return URL(string: source)
    }

    var formattedDate: String {
        SellingStub.toDateFormatter.string(from: date)
    }

    var formattedPrice: String { price.formattedAsPrice }

    init?(sciSale: InvestorStubTypeSelling) {
        guard let title = sciSale.title,
              let price = sciSale.listPrice,
              let saleTime = sciSale.saleTime,
              let saleDate = SellingStub.fromDateFormatter.date(from: saleTime)
        else {
            return nil
        }

        self.thumbnail = sciSale.thumbnail
        self.title = title
        self.price = price
        self.date = saleDate
        self.source = sciSale.listingURL
    }

    private static let fromDateFormatter: DateFormatter = { dateFormatter in
        dateFormatter.dateFormat = "M/d/yyyy H:mm a"
        return dateFormatter
    }(DateFormatter())

    private static let toDateFormatter: DateFormatter = { dateFormatter in
        dateFormatter.dateFormat = "MMM d, yyyy"
        return dateFormatter
    }(DateFormatter())
}
