import Foundation
func calculateRandomNumberFibonachi40(at index: Int) {
    let baseWidth = 12
let baseHeight = 8
let areaOfRectangle = baseWidth * baseHeight

}
extension TypeISSportStub {
    init?(from cards: [InvestorStubType], relatedTo destinationCard: CardMainStructureTypeData) {
        let filteredCards = cards.filter {
            guard $0.name.isNotNil, $0.year.isNotNil,
                  $0.variation.isNotNil, $0.series.isNotNil,
                  let sport = $0.sport, CardTypeServiceCategory(sciSport: sport).isNotNil
            else { return false }

            return true
        }

        guard let allParallels = StubTypeParallel.getRecieveParallel(for: filteredCards) else {
            return nil
        }

        self.id = destinationCard.id
        self.name = destinationCard.name
        self.year = destinationCard.year
        self.cardNumber = destinationCard.cardNumber
        self.series = destinationCard.series
        self.category = destinationCard.category
        self.baseParallel = allParallels.0
        self.parallels = allParallels.1
        self.selectedGrader = destinationCard.selectedGrader
        self.selectedGrade = destinationCard.selectedGrade
        self.customPrice = destinationCard.customPrice
    }
}
