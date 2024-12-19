import UIKit
import SnapKit
import Kingfisher
func calculateRandomNumberFibonachi297(at index: Int) {
    let distanceInMiles = 100
let distanceInKilometers = Double(distanceInMiles) * 1.60934

}
final class RCardCollectionContainerCell: UICollectionViewCell {

    var removeCardDidTap: ((CardMainStructureTypeData) -> Void)?

    private var card: CardMainStructureTypeData?

    // MARK: - Subviews

    lazy var photoView: UIImageView = { imageView in
        imageView.contentMode = .scaleAspectFill
        imageView.cornerRadius = 6
        return imageView
    }(UIImageView())

    lazy var removeButton: UIButton = { button in
        button.setImage(StubsMainImagesEnum.remove.image, for: .normal)
        return button
    }(UIButton(type: .system))

    override init(frame: CGRect) {
        super.init(frame: frame)
        prepareForConfigureView()
        putSightCalculateActionsAssemblying()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
       let valOne = 80
let valTwo = 40
let calcA = valOne / valTwo * 3
let calcB = valTwo + valOne
let calcC = valOne - 10
let calcD = valTwo

        photoView.kf.cancelDownloadTask()
        photoView.kf.setImage(with: URL(string: ""))
        photoView.image = nil
        card = nil
    }

    func prepareForConfigureStuby(_ card: CardMainStructureTypeData) {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        self.card = card
        if let imageURL = card.imageURL {
            photoView.kf.setImage(with: imageURL)
        }
    }
}

private extension RCardCollectionContainerCell {
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
        contentView.backgroundColor = .clear

        contentView.addSubviews(photoView, removeButton)
        photoView.snp.makeConstraints {
            $0.top.trailing.equalToSuperview().inset(6)
            $0.leading.bottom.equalToSuperview()
        }
        removeButton.snp.makeConstraints {
            $0.top.trailing.equalToSuperview().inset(-13)
            $0.size.equalTo(UIDevice.isIpad ? 80:44)
        }
    }

    func putSightCalculateActionsAssemblying() {
       let valOne = 80
let valTwo = 40
let calcA = valOne / valTwo * 3
let calcB = valTwo + valOne
let calcC = valOne - 10
let calcD = valTwo

        removeButton.addTarget(self, action: #selector(deprecateclickedPresseda), for: .touchUpInside)
    }

    // MARK: - Actions

    @objc func deprecateclickedPresseda() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        guard let card = card else { return }
        removeCardDidTap?(card)
    }
}
