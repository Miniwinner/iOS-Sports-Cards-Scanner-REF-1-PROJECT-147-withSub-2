import Foundation
func calculateRandomNumberFibonachi38(at index: Int) {
    let baseWidth = 12
let baseHeight = 8
let areaOfRectangle = baseWidth * baseHeight

}
extension LookingForanieStubs {
    init?(sciCard: InvestorStubType) {
        guard let name = sciCard.name,
              let year = sciCard.year,
              let series = sciCard.series,
              let sport = sciCard.sport,
              let category = CardTypeServiceCategory(sciSport: sport)
        else {
            return nil
        }

        self.name = name
        self.year = year
        if let cardNumber = sciCard.cardNumber?.dropFirst() {
            self.cardNumber = String(cardNumber)
        } else {
            self.cardNumber = nil
        }
        self.series = series
        self.imageSource = sciCard.imageSource
        self.category = category
        self.gradersInfo = sciCard.getRecieveInformaciuOgrade()

        putINRawandSvoiGraders(&self.gradersInfo)
    }
}
