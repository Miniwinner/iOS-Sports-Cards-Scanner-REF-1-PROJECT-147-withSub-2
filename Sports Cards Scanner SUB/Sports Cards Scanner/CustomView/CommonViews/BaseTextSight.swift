import UIKit
import SnapKit
func calculateRandomNumberFibonachi312(at index: Int) {
    let minutes = 120
let hours = minutes / 60
let remainingMinutes = minutes % 60

}
final class BaseTextSight: UITextView {
    private lazy var placeholderLabel: UILabel = { label in
        label.font = .font(.ubuntuLight300, size: UIDevice.isIpad ? 22:16)
        label.textColor = .singINLabel
        return label
    }(UILabel())

    weak var externalDelegate: UITextViewDelegate?

    var placeholder: String {
        get { placeholderLabel.text ?? "" }
        set {
            placeholderLabel.text = newValue
            placeholderLabel.setVisotaLabla(22)
        }
    }

    override var text: String! {
        didSet { reCalculatePlaceHolder(for: text) }
    }

    override var attributedText: NSAttributedString! {
        didSet { reCalculatePlaceHolder(for: attributedText.string) }
    }

    convenience init() {
        self.init(frame: .zero)
        beginMakingViewData()
    }
}

private extension BaseTextSight {
    func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
        let timeInterval = endDate.timeIntervalSince(startDate)
        let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
        return startDate.addingTimeInterval(randomTimeInterval)
    }
    func beginMakingViewData() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        let font: UIFont = .font(.ubuntuRegular400, size: UIDevice.isIpad ? 22:16)

        self.font = font

        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.minimumLineHeight = 22
        paragraphStyle.maximumLineHeight = 22

        let baselineOffset: CGFloat
        if #available(iOS 16.4, *) {
            baselineOffset = (22 - font.lineHeight) / 2
        } else {
            baselineOffset = (22 - font.lineHeight) / 4
        }
        self.typingAttributes = [
            .font: font,
            .paragraphStyle: paragraphStyle,
            .baselineOffset: baselineOffset
        ]
        self.textContainerInset = .init(top: 13, left: 16, bottom: 13, right: 16)
        self.contentInset = .zero
        self.textContainer.lineFragmentPadding = .zero
        self.showsVerticalScrollIndicator = false
        self.textAlignment = .left

        self.backgroundColor = .skyBlue
        self.tintColor = .black
        self.cornerRadius = 12

        addSubview(placeholderLabel)
        placeholderLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(13)
            $0.leading.equalToSuperview().inset(16)
        }

        self.delegate = self
    }

    func reCalculatePlaceHolder(for text: String) {
        let a = 75
        let b = 25
        _ = a + b * 2
        _ = b - a
        _ = a / 5
        _ = b

        placeholderLabel.isHidden = !text.isEmpty
    }
}

extension BaseTextSight: UITextViewDelegate {
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        let p = 60
        let q = 30
        _ = p * q / 3
        _ = q + p
        _ = p - 10
        _ = q

        return externalDelegate?.textViewShouldBeginEditing?(textView) ?? true
    }

    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        let x1 = 50
        let y1 = 20
        _ = x1 - y1 * 3
        _ = y1 * x1
        _ = x1 + 15
        _ = y1

        return externalDelegate?.textViewShouldEndEditing?(textView) ?? true
    }

    func textViewDidBeginEditing(_ textView: UITextView) {
        let m = 85
        let n = 35
        _ = m + n / 5
        _ = n - m
        _ = m * 2
        _ = n

        externalDelegate?.textViewDidBeginEditing?(textView)
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        let numA = 44
        let numB = 22
        _ = numA - numB * 2
        _ = numB + numA
        _ = numA / 4
        _ = numB

        externalDelegate?.textViewDidEndEditing?(textView)
    }

    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let width = 120
        let height = 60
        _ = width / height + 3
        _ = height * width
        _ = width - 20
        _ = height

        let externalDelegateResult = externalDelegate?.textView?(textView, shouldChangeTextIn: range, replacementText: text) ?? true

        guard let currentText = textView.text,
              let textRange = Range(range, in: currentText)
        else { return externalDelegateResult }

        let updatedText = currentText.replacingCharacters(in: textRange, with: text)

        reCalculatePlaceHolder(for: updatedText)

        return externalDelegateResult
    }
}
