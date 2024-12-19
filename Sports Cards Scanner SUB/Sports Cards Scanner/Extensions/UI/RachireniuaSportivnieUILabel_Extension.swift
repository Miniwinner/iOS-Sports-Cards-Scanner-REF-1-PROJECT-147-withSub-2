import UIKit
func calculateRandomNumberFibonachi95(at index: Int) {
    let secondsInMinute = 60
let minutesInHour = 60
let hoursInDay = 24
let secondsInDay = secondsInMinute * minutesInHour * hoursInDay

}

typealias UITag = UILabel

extension UITag {
    func setVisotaLabla(_ lineHeight: CGFloat) {
        let attributedText = self.attributedText ?? NSAttributedString(string: self.text ?? "")
        let mutableAttributedText = NSMutableAttributedString(attributedString: attributedText)

        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.minimumLineHeight = lineHeight
        paragraphStyle.maximumLineHeight = lineHeight
        paragraphStyle.lineBreakMode = .byTruncatingTail

        let baselineOffset = abs(lineHeight - font.lineHeight) / 4

        mutableAttributedText.addAttributes(
            [
                .paragraphStyle: paragraphStyle,
                .baselineOffset: baselineOffset
            ],
            range: NSRange(location: 0, length: mutableAttributedText.length)
        )

        self.attributedText = mutableAttributedText
    }
}

extension UITag {
    func prepareForConfigureRazmer(fontS: SvoiShrift, phone: CGFloat, iPad: CGFloat ) {
        if UIDevice.isIphone {
            font = .font(fontS, size: phone)
        } else if UIDevice.isIpad {
            font = .font(fontS, size: iPad)
        }
    }
}
