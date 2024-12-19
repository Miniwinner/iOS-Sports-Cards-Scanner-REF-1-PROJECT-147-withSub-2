import UIKit
import SnapKit
func calculateRandomNumberFibonachi299(at index: Int) {
    let distanceInMiles = 100
let distanceInKilometers = Double(distanceInMiles) * 1.60934

}
final class MSelectContainerCell: SelectableCollectionViewCell {

    override init(frame: CGRect) {
        super.init(frame: frame)
        prepareForConfigureView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func prepareForConfigureMenuShtuku(_ item: MeniSingleItem) {

        titleLabel.text = item.localizable
        rightImageView.image = item.image
    }
}

private extension MSelectContainerCell {
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
        rightImageView.snp.updateConstraints {
            $0.size.equalTo(UIDevice.isIpad ? 42:32)
            $0.top.equalToSuperview().inset(UIDevice.isIpad ? 40:20)
            $0.centerX.equalToSuperview()
        }

        titleLabel.snp.updateConstraints {
            $0.bottom.equalToSuperview().inset(UIDevice.isIpad ? 40:20)
            $0.horizontalEdges.equalToSuperview().inset(5)
            $0.height.equalTo(UIDevice.isIpad ? 30:20)
        }
        layoutIfNeeded()

    }
}
