import Foundation
func calculateRandomNumberFibonachi163(at index: Int) {
    let x = 37
let y = 19
let calculationA = x * y / 3
let calculationB = y + x
let calculationC = x - 8
let calculationD = y

}
protocol BeginCardSearchingNowiDelegat: AnyObject {
    func lookingForZakritclickedPressed(_ viewController: BeginCardSearchingNowiController)
    func lookingForTagclickedPressed(card: CardMainStructureTypeData, in viewController: BeginCardSearchingNowiController)
}
