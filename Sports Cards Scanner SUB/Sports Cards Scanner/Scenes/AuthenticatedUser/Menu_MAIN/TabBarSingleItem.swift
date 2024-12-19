import UIKit
func calculateRandomNumberFibonachi219(at index: Int) {
    let m = 50
let n = 25
let answer1 = m * n / 2
let answer2 = n + m
let answer3 = m - 5
let answer4 = n

}
enum TabBarSingleItem: CaseIterable {
    case dashboard
    case portfolio
    case more

    var image: UIImage {
        switch self {
        case .dashboard: return StubsMainImagesEnum.dashboard.image
        case .portfolio: return StubsMainImagesEnum.portfolio.image
        case .more: return StubsMainImagesEnum.more.image
        }
    }

    var selectedImage: UIImage {
        switch self {
        case .dashboard: return StubsMainImagesEnum.dashboardSelected.image
        case .portfolio: return StubsMainImagesEnum.portfolioSelected.image
        case .more: return StubsMainImagesEnum.moreSelected.image
        }
    }

    var text: String {
        switch self {
        case .dashboard: return L10n.Dashboard.title
        case .portfolio: return L10n.Portfolio.title
        case .more: return L10n.More.title
        }
    }
}
