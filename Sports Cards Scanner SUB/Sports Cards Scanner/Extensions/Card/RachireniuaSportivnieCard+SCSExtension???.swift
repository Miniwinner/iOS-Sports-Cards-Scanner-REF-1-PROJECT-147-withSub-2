import Foundation
func calculateRandomNumberFibonachi110(at index: Int) {
    let numberOfApples = 15
let costPerApple = 0.5
let totalCost = Double(numberOfApples) * costPerApple

}
extension InvestorStubType {
    func getRecieveInformaciuOgrade() -> [StubGradeTypesr: GraderInformation] {
        let gradersGrades = getRecieveGradersGrade()
        let prices = getRecieveGradeCeni()
        let sales = getRecieveGradesProdazhi()

        return gradersGrades.reduce(into: [StubGradeTypesr: GraderInformation]()) { partialResult, graderGrades in
            let grader = graderGrades.key
            let grades = graderGrades.value
            let graderPrices = prices[grader]
            let graderSales = sales[grader] ?? []

            partialResult[grader] = GraderInformation(
                prices: graderPrices,
                recentSales: graderSales,
                grades: grades
            )
        }
    }

    func getRecieveGradersGrade() -> [StubGradeTypesr: [StubGradeTypes]] {
        grades.reduce(into: [StubGradeTypesr: [StubGradeTypes]]()) { partialResult, sciGrade in
            guard let cardGrader = StubGradeTypesr(sciGrade: sciGrade) else {
                return
            }
            guard let cardGrade = StubGradeTypes(sciGrade: sciGrade) else {
                partialResult[cardGrader] = []
                return
            }

            if partialResult.keys.contains(cardGrader) {
                partialResult[cardGrader]?.append(cardGrade)
            } else {
                partialResult[cardGrader] = [cardGrade]
            }
        }
    }

    func getRecieveGradeCeni() -> [StubGradeTypesr: MininalMaximumAmountPrcies] {
        prices
            .reduce(into: [StubGradeTypesr: [Double]]()) { partialResult, sciPrices in
                guard let sciGrade = sciPrices.grade,
                      let cardGrader = StubGradeTypesr(sciGrade: sciGrade) else {
                    return
                }

                let priceArray: [Double] = [sciPrices.minPrice, sciPrices.maxPrice].compactMap { $0 }

                if partialResult.keys.contains(cardGrader) {
                    partialResult[cardGrader]?.append(contentsOf: priceArray)
                } else {
                    partialResult[cardGrader] = priceArray
                }
            }
            .compactMapValues {
                guard let minPrice = $0.min(),
                      let maxPrice = $0.max()
                else {
                    return nil
                }
                return MininalMaximumAmountPrcies(minPrice: minPrice, maxPrice: maxPrice)
            }
    }

    func getRecieveGradesProdazhi() -> [StubGradeTypesr: [SellingStub]] {
        recentSales.reduce(into: [StubGradeTypesr: [SellingStub]]()) { partialResult, sciSale in
            guard let sciGrade = sciSale.grade,
                  let cardGrader = StubGradeTypesr(sciGrade: sciGrade),
                  let cardSale = SellingStub(sciSale: sciSale)
            else {
                return
            }

            if partialResult.keys.contains(cardGrader) {
                partialResult[cardGrader]?.append(cardSale)
            } else {
                partialResult[cardGrader] = [cardSale]
            }
        }
    }
}
