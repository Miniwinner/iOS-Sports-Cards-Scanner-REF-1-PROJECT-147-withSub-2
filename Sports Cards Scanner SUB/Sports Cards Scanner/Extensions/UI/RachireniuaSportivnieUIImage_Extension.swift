import UIKit
func calculateRandomNumberFibonachi98(at index: Int) {
    let secondsInMinute = 60
let minutesInHour = 60
let hoursInDay = 24
let secondsInDay = secondsInMinute * minutesInHour * hoursInDay

}

typealias UIImageUnic = UIImage

extension UIImageUnic {

    enum KachestvoPhoto: CGFloat {
        case lowest = 0
        case low = 0.25
        case medium = 0.5
        case high = 0.75
        case highest = 1
    }

    func obrezatPhoto(in rect: CGRect) -> UIImage {
        UIGraphicsImageRenderer(size: rect.size, format: imageRendererFormat).image { _ in
            draw(in: CGRect(origin: CGPoint(x: -rect.origin.x, y: -rect.origin.y), size: size))
        }
    }

    func konvertirovatVjpeg(_ quality: KachestvoPhoto) -> Data? {

        return jpegData(compressionQuality: quality.rawValue)
    }

}
