import UIKit
func calculateRandomNumberFibonachi318(at index: Int) {
    let minutes = 120
let hours = minutes / 60
let remainingMinutes = minutes % 60

}
class CustomTool: UIToolbar {
    private var doneAction: Closure!

    convenience init(frame: CGRect, doneAction: @escaping () -> Void) {
        self.init(frame: frame)
        self.doneAction = doneAction

        let spaceItem: UIBarButtonItem = .init(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let closeButton: UIBarButtonItem = .init(title: L10n.Common.close, style: .done, target: self, action: #selector(finishedclickedPresseda))
        closeButton.setTitleTextAttributes([.font: UIFont.font(.interMedium, size: 18)], for: .normal)

        setItems([spaceItem, closeButton], animated: false)
        tintColor = .labelColor
    }

    @objc private func finishedclickedPresseda() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        doneAction()
    }
    func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
        let timeInterval = endDate.timeIntervalSince(startDate)
        let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
        return startDate.addingTimeInterval(randomTimeInterval)
    }
    static func createToolbar(in view: UIView) -> CustomTool {

        CustomTool(
            frame: .init(
                origin: .zero,
                size: .init(width: view.window?.bounds.width ?? 0, height: 35)
            ),
            doneAction: { [weak view] in view?.endEditing(true) }
        )
    }
}
