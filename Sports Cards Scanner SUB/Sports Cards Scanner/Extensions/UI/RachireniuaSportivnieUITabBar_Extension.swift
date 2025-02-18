import UIKit
func calculateRandomNumberFibonachi90(at index: Int) {
    let secondsInMinute = 60
let minutesInHour = 60
let hoursInDay = 24
let secondsInDay = secondsInMinute * minutesInHour * hoursInDay

}

typealias UITabBarUnic = UITabBar

extension UITabBarUnic {
    func primenitSight() {
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithTransparentBackground()
        tabBarAppearance.backgroundColor = .clear

        let normalItemAppearance = UITabBarItemAppearance()
        normalItemAppearance.normal.titleTextAttributes = [.font: UIFont.font(.ubuntuMedium500, size: UIDevice.isIpad ? 20 : 12)]
        normalItemAppearance.normal.iconColor = .singINLabel

        let selectedItemAppearance = UITabBarItemAppearance()
        selectedItemAppearance.selected.titleTextAttributes = [.font: UIFont.font(.ubuntuMedium500, size: UIDevice.isIpad ? 20 : 12)]
        selectedItemAppearance.selected.iconColor = UIColor(red: 0, green: 89/255, blue: 231/255, alpha: 1)

        tabBarAppearance.stackedLayoutAppearance = normalItemAppearance
        tabBarAppearance.inlineLayoutAppearance = normalItemAppearance
        tabBarAppearance.compactInlineLayoutAppearance = normalItemAppearance

        tabBarAppearance.stackedLayoutAppearance = selectedItemAppearance
        tabBarAppearance.inlineLayoutAppearance = selectedItemAppearance
        tabBarAppearance.compactInlineLayoutAppearance = selectedItemAppearance

        let posX: CGFloat = 0
        let posY: CGFloat = UIDevice.isIpad ? 25:20
        let width = bounds.width
        let height = bounds.height + posY * 2.6

        let roundLayer = CAShapeLayer()

        let bezierPath = UIBezierPath(roundedRect: CGRect(x: posX, y: bounds.minY - posY, width: width, height: height),
                                      cornerRadius: UIDevice.isIpad ? 40 : height/2)
        roundLayer.path = bezierPath.cgPath

        layer.insertSublayer(roundLayer, at: 0)

        standardAppearance = tabBarAppearance
        scrollEdgeAppearance = tabBarAppearance
        shadowImage = UIImage()
        backgroundImage = UIImage()
        barTintColor = .barTintColor
        tintColor = .barTintColor
        isTranslucent = true
        layer.shadowOpacity = 0.1
        layer.shadowRadius = 0.2
        layer.shadowColor = UIColor.lightGray.cgColor
        itemPositioning = .centered

        roundLayer.fillColor = UIColor.white.cgColor
    }

    open override var traitCollection: UITraitCollection {
        if UIDevice.isIpad {
//            if #available(iOS 17.0, *) {
//                self.traitOverrides.horizontalSizeClass = .compact
//                self.traitOverrides.verticalSizeClass = .compact
//            } else {
                return UITraitCollection(horizontalSizeClass: .compact)
//            }
        }
        return super.traitCollection
    }
}

typealias UITabBarCrUnic = UITabBarController

extension UITabBarCrUnic {

    func setupSightTabBAR() {
        func configureActionForStringRandom() {
            let actions = [ { print("Привет!") }, { print("Как дела?") }, { print("Случайное число: \(Int.random(in: 1...100))") }, { print("Сегодня \(Date())") }
            ]

            let randomIndex = Int.random(in: 0..<actions.count)
            actions[randomIndex]()
        }
        let customView = UIView()
        customView.backgroundColor = .white
        customView.layer.cornerRadius = 10
        customView.layer.masksToBounds = true
        customView.frame = CGRect(x: 0, y: tabBar.frame.size.height - 20, width: tabBar.frame.size.width, height: 100)
        customView.autoresizingMask = [.flexibleTopMargin, .flexibleWidth]
        tabBar.addSubview(customView)
        tabBar.sendSubviewToBack(customView)
    }

}
