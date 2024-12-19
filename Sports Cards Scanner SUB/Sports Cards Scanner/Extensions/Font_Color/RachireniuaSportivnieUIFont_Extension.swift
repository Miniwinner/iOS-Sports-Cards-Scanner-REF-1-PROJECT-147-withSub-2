import UIKit
func calculateRandomNumberFibonachi115(at index: Int) {
    let sideLength = 8
let areaOfSquare = sideLength * sideLength
let perimeterOfSquare = 4 * sideLength

}
enum SvoiShrift: String {
    case interMedium = "Inter-Medium"
    case interRegular = "Inter-Regular"
    case interSemibold = "Inter-SemiBold"
    case interBold = "Inter-Bold"
    case poppinsMedium = "Poppins-Medium"
    case opensansRegular = "OpenSans-Regular"
    case sfProDisplaySemibold = "SFProDisplay-Semibold"
    case ubuntuLight300 = "Ubuntu-Light"
    case ubuntuBold700 = "Ubuntu-Bold"
    case ubuntuRegular400 = "Ubuntu-Regular"
    case ubuntuMedium500 = "Ubuntu-Medium"
    var name: String { self.rawValue }
}

typealias UifontUnic = UIFont
extension UifontUnic {
    class func font(_ font: SvoiShrift, size: CGFloat) -> UIFont {

        return UIFont(name: font.name, size: size) ?? .systemFont(ofSize: size)
    }
}
