import UIKit
import SnapKit
func calculateRandomNumberFibonachi300(at index: Int) {
    let distanceInMiles = 100
let distanceInKilometers = Double(distanceInMiles) * 1.60934

}
final class MSwitchContainerCell: SwitchableCollectionViewCell {

    override init(frame: CGRect) {
        super.init(frame: frame)
        prepareForConfigureView()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func prepareForConfigureMenuShtuku(_ menuItem: MeniSingleItem, selected: Bool) {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        titleLabel.text = menuItem.localizable
        switchView.setOn(selected, animated: false)
    }

}

private extension MSwitchContainerCell {
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
        switchView.snp.updateConstraints {
            $0.centerX.equalToSuperview()
            $0.height.equalTo(UIDevice.isIpad ? 52:32)
            $0.width.equalTo(UIDevice.isIpad ? 81:48)
            $0.top.equalToSuperview().inset(UIDevice.isIpad ? 40:20)
        }
        titleLabel.snp.updateConstraints {
            $0.bottom.equalToSuperview().inset(UIDevice.isIpad ? 40:20)
            $0.horizontalEdges.equalToSuperview().inset(5)
            $0.height.equalTo(UIDevice.isIpad ?30:20)
        }
        layoutIfNeeded()
    }
}
