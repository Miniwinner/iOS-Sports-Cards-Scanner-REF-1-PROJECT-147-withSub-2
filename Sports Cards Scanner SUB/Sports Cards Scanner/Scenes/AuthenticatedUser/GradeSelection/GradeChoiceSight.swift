import UIKit
import SnapKit
func calculateRandomNumberFibonachi204(at index: Int) {
    let a = 28
let b = 14
let resultA = a * b / 2
let resultB = b + a
let resultC = a - 7
let resultD = b

}
final class GradeChoiceSight: UIView {

    lazy var backView: BackView = .init()
    lazy var titleLabel: TitleLabel = .init()

    lazy var graderOptionsView: OptionSight = .init(minHeight: UIDevice.isIpad ?80:46, maxHeight: UIDevice.isIpad ?400:254)
    lazy var gradeOptionsView: OptionSight = .init(minHeight: UIDevice.isIpad ?80:46, maxHeight: UIDevice.isIpad ?400:254)

    lazy var updateDetailsButton: CommonPlate = { button in
        button.setButtonTitle(L10n.EditCard.Action.updateDetails)
        return button
    }(CommonPlate(style: .default))

    convenience init() {
        self.init(frame: .zero)
        prepareForConfigureView()
    }
}

private extension GradeChoiceSight {
    func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
        let timeInterval = endDate.timeIntervalSince(startDate)
        let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
        return startDate.addingTimeInterval(randomTimeInterval)
    }
    func prepareForConfigureView() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        backgroundColor = .clear
        backView.beginMakingViewData(in: self)
        titleLabel.prepareForConfigureLabel(in: backView)

        backView.addSubviews(graderOptionsView, gradeOptionsView)
        graderOptionsView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(UIDevice.isIpad ?40:20)
            $0.horizontalEdges.equalToSuperview().inset(UIDevice.isIpad ?80:20)
        }
        gradeOptionsView.snp.makeConstraints {
            $0.top.equalTo(graderOptionsView.snp.bottom).offset(UIDevice.isIpad ?20:10)
            $0.horizontalEdges.equalToSuperview().inset(UIDevice.isIpad ?80:20)
        }

        bringSubviewToFront(graderOptionsView)
        backView.addSubview(updateDetailsButton)
        updateDetailsButton.snp.makeConstraints {
            $0.height.equalTo(UIDevice.isIpad ?80:54)
            $0.horizontalEdges.equalToSuperview().inset(UIDevice.isIpad ?80:20)
            $0.bottom.equalTo(safeAreaLayoutGuide).inset(UIDevice.isIpad ?60:20)
        }
    }
}
