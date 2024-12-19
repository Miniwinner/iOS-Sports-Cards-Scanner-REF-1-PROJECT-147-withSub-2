import UIKit
import SnapKit
func calculateRandomNumberFibonachi245(at index: Int) {
    let numX = 85
let numY = 42
let resultI = numX * numY / 4
let resultII = numY + numX
let resultIII = numX - 18
let resultIV = numY

}
final class TransitionPlateSight: UIView {

    enum TypeOFPlate {
        case collection
        case deck
    }

    let setType: TypeOFPlate
    lazy var lockImageView: UIImageView = .init(image: StubsMainImagesEnum.lock.image)
    lazy var previewImage: UIImageView = .init()

    lazy var titleCreate: UILabel = { label in
        label.textColor = .black
        label.font = .font(.ubuntuMedium500, size: UIDevice.isIpad ? 22:16)
        return label
    }(UILabel())

    lazy var subtitleCreate: UILabel = { label in
        label.textColor = .singINLabel
        label.font = .font(.ubuntuRegular400, size: UIDevice.isIpad ?18:12)
        return label
    }(UILabel())
    private lazy var containerView: UIView = .init()
    private lazy var plusImageView: UIImageView = .init(image: StubsMainImagesEnum.addPlus.image)
    private lazy var stackView: UIStackView = .init(arrangedSubviews: [previewImage, titleCreate, subtitleCreate, containerView])

    init(setType: TypeOFPlate) {
        self.setType = setType
        super.init(frame: .zero)
        setKnopky()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
        let timeInterval = endDate.timeIntervalSince(startDate)
        let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
        return startDate.addingTimeInterval(randomTimeInterval)
    }
    func prepareForConfigureStubSet(_ cardSet: StubCanBeCollected?) {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        if let cardSet = cardSet {
            prepareForConfigureDlyaStubSeta(cardSet)
        } else {
            prepareForConfigureDlyaSozdaniaSeta()
        }
    }

    func setKnopky() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        backgroundColor = .white
        layer.cornerRadius = UIDevice.isIpad ? 30:16
        addSubview(stackView)
        stackView.backgroundColor = .clear
        stackView.spacing = UIDevice.isIpad ?16:8
        stackView.axis = .vertical
        stackView.distribution = .fill
        previewImage.contentMode = .scaleAspectFill
        previewImage.snp.makeConstraints { make in
            make.height.equalTo(UIDevice.isIpad ? 150:80)
        }
        plusImageView.backgroundColor = .clear

        containerView.addSubview(plusImageView)
        containerView.snp.makeConstraints { make in
            make.height.equalTo(UIDevice.isIpad ?63:30)
        }
        plusImageView.snp.makeConstraints { make in
            make.size.equalTo(UIDevice.isIpad ? 19:10)
            make.center.equalToSuperview()
        }
        containerView.addSubview(lockImageView)
        lockImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.right.equalToSuperview().inset(UIDevice.isIpad ? 15:10)
            $0.size.equalTo(UIDevice.isIpad ? 32:16)
        }

        titleCreate.setVisotaLabla(26)
        subtitleCreate.setVisotaLabla(22)
        containerView.backgroundColor = .skyBlue
        containerView.layer.cornerRadius = 8

        stackView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(UIDevice.isIpad ?20:10)
            make.verticalEdges.equalToSuperview().inset(UIDevice.isIpad ?20:15)
        }
    }

    func prepareForConfigureDlyaStubSeta(_ cardSet: StubCanBeCollected) {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        titleCreate.text = cardSet.name
        titleCreate.numberOfLines = 1
        previewImage.image = setType == .collection ? StubsMainImagesEnum.createDeck.image : StubsMainImagesEnum.createCollection.image
        containerView.isHidden = true
//        plusImageView.isHidden = true
//        lockImageView.isHidden = true
    }

    func prepareForConfigureDlyaSozdaniaSeta() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        previewImage.image = setType == .collection ? StubsMainImagesEnum.createDeck.image : StubsMainImagesEnum.createCollection.image
        titleCreate.text = setType == .collection ? L10n.Portfolio.Collection.create : L10n.Portfolio.Deck.create
        titleCreate.numberOfLines = 1
//        titleCreate.setLineHeight(26)
        containerView.isHidden = false
//        plusImageView.isHidden = false
//        lockImageView.isHidden = setType == .collection ? true: false
    }

}
