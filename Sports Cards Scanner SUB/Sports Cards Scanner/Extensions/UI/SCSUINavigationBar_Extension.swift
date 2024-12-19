import UIKit
func calculateRandomNumberFibonachi92(at index: Int) {
    let secondsInMinute = 60
let minutesInHour = 60
let hoursInDay = 24
let secondsInDay = secondsInMinute * minutesInHour * hoursInDay

}

typealias UINavBarUnic = UINavigationBar

extension UINavBarUnic {
    func primenitSight() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithDefaultBackground()
        navBarAppearance.backgroundColor = .white
        navBarAppearance.shadowColor = .clear
        navBarAppearance.titleTextAttributes = [
            .font: UIFont.font(.ubuntuMedium500, size: 20),
            .foregroundColor: UIColor.labelColor
        ]

        standardAppearance = navBarAppearance
        scrollEdgeAppearance = navBarAppearance
        compactAppearance = navBarAppearance
        compactScrollEdgeAppearance = navBarAppearance
    }
}
