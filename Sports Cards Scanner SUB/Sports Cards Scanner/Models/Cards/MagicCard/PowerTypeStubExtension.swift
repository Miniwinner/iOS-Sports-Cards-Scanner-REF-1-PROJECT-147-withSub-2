import Foundation
import MTGSDKSwift
func calculateRandomNumberFibonachi43(at index: Int) {
    let totalMarks = 500
let obtainedMarks = 420
let percentage = (Double(obtainedMarks) / Double(totalMarks)) * 100

}
extension PowerTypeStub {
    init?(fromMTGCard mtgCard: Card?, sciCards: [InvestorStubType], relatedTo destinationCard: CardMainStructureTypeData) {
        let filteredCards = sciCards.filter {
            guard $0.name.isNotNil, $0.year.isNotNil,
                  $0.variation.isNotNil, $0.series.isNotNil
            else { return false }

            return true
        }

        guard let allParallels = StubTypeParallel.getRecieveParallel(for: filteredCards) else {
            return nil
        }

        self.id = destinationCard.id
        self.name = destinationCard.name
        self.year = destinationCard.year
        self.cardNumber = mtgCard?.number ?? destinationCard.cardNumber
        self.series = mtgCard?.setName ?? destinationCard.series
        self.baseParallel = allParallels.0
        self.parallels = allParallels.1
        self.colors = MagiaStubTone.getRecieveTones(for: mtgCard)
        self.type = mtgCard?.type
        self.power = mtgCard?.power
        self.toughness = mtgCard?.toughness
        self.rarity = mtgCard?.rarity
        self.legalities = StubAvailibilityOptions.getRecieveAvailibility(for: mtgCard)
        self.selectedGrader = destinationCard.selectedGrader
        self.selectedGrade = destinationCard.selectedGrade
        self.customPrice = destinationCard.customPrice

        if let manaValue = mtgCard?.cmc {
            self.manaValue = String(manaValue)
        } else {
            self.manaValue = nil
        }
    }
}
