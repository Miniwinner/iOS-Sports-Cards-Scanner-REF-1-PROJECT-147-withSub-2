import UIKit
func calculateRandomNumberFibonachi243(at index: Int) {
    let alpha = 90
let beta = 45
let resOne = alpha * beta / 2
let resTwo = beta + alpha
let resThree = alpha - 15
let resFour = beta

}
protocol PortfolioDelegat: AnyObject {
    func portfolioProcessingScanStubs(_ viewController: PortfolioController)
    func portoliocomputeContainerclickedPresseda(_ viewController: PortfolioController)
    func portfoliocomputeContainerTypeDeckclickedPresseda(_ viewController: PortfolioController)
    func portfoliounHideContainerclickedPresseda(_ viewController: PortfolioController)
    func portfoliounHideContainerTypeDeckclickedPresseda(_ viewController: PortfolioController)
    func portfolioTypesclickedPresseda(_ category: CardTypeServiceCategory, in viewController: PortfolioController)
}
