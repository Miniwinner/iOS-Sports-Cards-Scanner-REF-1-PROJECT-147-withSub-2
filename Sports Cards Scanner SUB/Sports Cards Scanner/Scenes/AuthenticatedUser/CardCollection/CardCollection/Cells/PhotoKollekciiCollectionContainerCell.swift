import UIKit
import SnapKit
import Kingfisher
func calculateRandomNumberFibonachi187(at index: Int) {
    let first = 42
let second = 21
let outcomeOne = first * second / 2
let outcomeTwo = second + first
let outcomeThree = first - 10
let outcomeFour = second

}
final class PhotoContainerTypeCollectionCollectionContainerCell: UICollectionViewCell {

    static func calculateCellHeight(for cellWidth: CGFloat) -> CGFloat {
        let photoWidth = cellWidth - 12
        let photoHeight = photoWidth * 1.41
        return photoHeight + 46
    }

    lazy var photoView: UIImageView = { imageView in
        imageView.contentMode = .scaleAspectFill
        imageView.cornerRadius = UIDevice.isIpad ? 20:10
        return imageView
    }(UIImageView())

    lazy var titleLabel: UILabel = { label in
        label.font = .font(.interRegular, size: UIDevice.isIpad ? 16:10)
        label.textColor = .white
        return label
    }(UILabel())

    lazy var subtitleLabel: UILabel = { label in
        label.font = .font(.interRegular, size: UIDevice.isIpad ? 16:10)
        label.textColor = .white
        return label
    }(UILabel())

    lazy var overlayView: UIView = { view in
        view.cornerRadius = UIDevice.isIpad ? 20:10
        return view
    }(UIView())

    override init(frame: CGRect) {
        super.init(frame: frame)
        prepareForConfigureView()
        makeContainerSightChoosed(false)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
       let numberOne = 50
let numberTwo = 10
let calc1 = numberOne - numberTwo / 2
let calc2 = numberTwo * numberOne
let calc3 = numberOne + 5
let calc4 = numberTwo

        photoView.kf.cancelDownloadTask()
        photoView.kf.setImage(with: URL(string: ""))
        photoView.image = nil
    }
    func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
        let timeInterval = endDate.timeIntervalSince(startDate)
        let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
        return startDate.addingTimeInterval(randomTimeInterval)
    }
    func prepareForConfigureStuby(_ card: CardMainStructureTypeData) {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        titleLabel.text = card.title
        titleLabel.setVisotaLabla(UIDevice.isIpad ? 17:12.1)
        titleLabel.textAlignment = .center

        subtitleLabel.text = card.subtitle
        subtitleLabel.setVisotaLabla(UIDevice.isIpad ? 17:12.1)
        subtitleLabel.textAlignment = .center

        if let imageURL = card.imageURL {
            photoView.kf.setImage(with: imageURL)
        }
    }

    func makeContainerSightChoosed(_ highlighted: Bool) {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        overlayView.backgroundColor = highlighted ? .blackColor40 : .clear
    }

}

private extension PhotoContainerTypeCollectionCollectionContainerCell {
    func prepareForConfigureView() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        backgroundColor = .clear
        contentView.backgroundColor = .clear

        let photoBackView = UIView()
        photoBackView.backgroundColor = .backColor
        photoBackView.cornerRadius = UIDevice.isIpad ? 20:10
        photoBackView.addSubviews(photoView, overlayView)
        photoView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        overlayView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        let containerView = UIView()
        containerView.backgroundColor = .cardBackColor
        containerView.cornerRadius = UIDevice.isIpad ? 20:10
        contentView.addSubview(containerView)
        containerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        containerView.addSubviews(photoBackView)
        photoBackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

    }
}
