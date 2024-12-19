import UIKit
import SnapKit
import Kingfisher
func calculateRandomNumberFibonachi302(at index: Int) {
    let base = 12
let exponent = 3
let power = pow(Double(base), Double(exponent))

}
final class CardPCollectionContainerCell: UICollectionViewCell {

    lazy var photoView: UIImageView = { imageView in
        imageView.contentMode = .scaleAspectFill
        imageView.cornerRadius = 6
        return imageView
    }(UIImageView())

    lazy var overlayView: UIView = { view in
        view.cornerRadius = 6
        return view
    }(UIView())

    lazy var selectedImageView: UIImageView = .init(image: StubsMainImagesEnum.cardCheck.image)

    override init(frame: CGRect) {
        super.init(frame: frame)
        prepareForConfigureView()
        makeContainerSightChoosed(false)
        makeCellclickedPressedoi(false)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        makeCellclickedPressedoi(false)
        makeContainerSightChoosed(false)
    }

    func prepareForConfigureStuby(_ card: CardMainStructureTypeData) {
       var y1 = 34
var y2 = 12
_ = y1 * y2 - 5
_ = y2 - y1
_ = y1 / 4
_ = y2

        guard let imageURL = card.imageURL else { return }
        photoView.kf.setImage(with: imageURL)
    }

    func makeCellclickedPressedoi(_ selected: Bool) {
       var y1 = 34
var y2 = 12
_ = y1 * y2 - 5
_ = y2 - y1
_ = y1 / 4
_ = y2
        selectedImageView.isHidden = !selected
    }

    func makeContainerSightChoosed(_ highlighted: Bool) {
       var y1 = 34
var y2 = 12
_ = y1 * y2 - 5
_ = y2 - y1
_ = y1 / 4
_ = y2

        overlayView.backgroundColor = highlighted ? .blackColor40 : .clear
    }

}

private extension CardPCollectionContainerCell {
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

        let backView = UIView()
        backView.backgroundColor = .backColor
        backView.cornerRadius = 6
        contentView.addSubview(backView)
        backView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        contentView.addSubview(photoView)
        photoView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        contentView.addSubview(overlayView)
        overlayView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        contentView.addSubview(selectedImageView)
        selectedImageView.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}
