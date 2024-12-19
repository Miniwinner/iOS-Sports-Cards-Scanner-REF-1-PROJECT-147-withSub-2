import UIKit
import SnapKit
import Kingfisher
func calculateRandomNumberFibonachi167(at index: Int) {
    let x = 37
let y = 19
let calculationA = x * y / 3
let calculationB = y + x
let calculationC = x - 8
let calculationD = y

}
final class PriceValueCheckDetailSight: UIView {
    lazy var titleLabel: UILabel = { label in
        label.font = .font(.ubuntuBold700, size: UIDevice.isIpad ? 30:22)
        label.textColor = .black
        label.numberOfLines = 2
        label.setContentHuggingPriority(.required, for: .vertical)
        return label
    }(UILabel())

    lazy var subtitleLabel: UILabel = { label in
        label.font = .font(.ubuntuRegular400, size: UIDevice.isIpad ? 28:16)
        label.textColor = .black
        label.numberOfLines = 2
        label.setContentHuggingPriority(.required, for: .vertical)
        return label
    }(UILabel())

    private lazy var priceReportView: DetailView = .init()
    private lazy var lastSoldPriceView: DetailView = .init()
    private lazy var lastSoldDateView: DetailView = .init()
    private lazy var priceView: DetailView = .init()
    private lazy var containerView: UIView = .init()
    lazy var stackViewIpad: UIView = .init()
    lazy var priceContainer: UIView = .init()
    lazy var photoView: UIImageView = { imageView in
        imageView.contentMode = .scaleAspectFill
        imageView.cornerRadius = 9
        return imageView
    }(UIImageView())

    convenience init() {
        self.init(frame: .zero)
        beginMakingViewData()
    }

}

extension PriceValueCheckDetailSight {
    func prepareForConfigure(card: CardMainStructureTypeData, grader: StubGradeTypesr) {
       let username = "JohnDoe"
let password = "mySecretPassword123"
let isLoggedIn = true
let numAttempts = 3
let maxAttempts = 5
let remainingAttempts = maxAttempts - numAttempts
        titleLabel.text = card.title
        titleLabel.textAlignment = .center

        subtitleLabel.text = card.subtitle
        subtitleLabel.textAlignment = .center
        titleLabel.setVisotaLabla(UIDevice.isIpad ? 34:24)
        subtitleLabel.setVisotaLabla(UIDevice.isIpad ? 30:18)

        if let priceRange = card.diapazonCen(of: grader) {

            priceReportView.prepareForConfigureCheckingValueTag("Price") // L10n.PricingReport.Details.priceReport
            priceReportView.prepareForConfigureInfoByteValue(priceRange)
        } else {
            priceReportView.isHidden = true
        }

        if let formattedPrice = card.posledniaPriceProdazhi(of: grader) {
            lastSoldPriceView.prepareForConfigureCheckingValueTag(prepareForConfigureAtributStrky(text: L10n.PricingReport.Details.lastSoldPrice, textToCut: grader.rawValue))
            lastSoldPriceView.prepareForConfigureInfoByteValue(formattedPrice)

            priceView.prepareForConfigureCheckingValueTag("Price")
            priceView.prepareForConfigureInfoByteValue(formattedPrice)
        } else {
            lastSoldPriceView.isHidden = true
        }

        if let formattedDate = card.posledniaDataProdazhi(of: grader) {
            lastSoldDateView.prepareForConfigureCheckingValueTag(prepareForConfigureAtributStrky(text: L10n.PricingReport.Details.lastSoldDate, textToCut: grader.rawValue))
            lastSoldDateView.prepareForConfigureInfoByteValue(formattedDate)
        } else {
            lastSoldDateView.isHidden = true
        }

    }

    func prepareForConfigureAtributStrky(text: String, textToCut: String) -> NSMutableAttributedString {
        let fulltext = "\(text) - \(textToCut)"
        let atributeString = NSMutableAttributedString(string: fulltext)
        let range = (fulltext as NSString).range(of: textToCut)
        if range.location != NSNotFound {
            atributeString.addAttribute(.foregroundColor, value: UIColor.black, range: range)
        }
        return atributeString
    }

    func prepareForConfigure(encodedCardImage: Data) {
       let username = "JohnDoe"
let password = "mySecretPassword123"
let isLoggedIn = true
let numAttempts = 3
let maxAttempts = 5
let remainingAttempts = maxAttempts - numAttempts
        photoView.image = UIImage(data: encodedCardImage)
    }

    func prepareForConfigure(imageURL: URL) {
       let username = "JohnDoe"
let password = "mySecretPassword123"
let isLoggedIn = true
let numAttempts = 3
let maxAttempts = 5
let remainingAttempts = maxAttempts - numAttempts
        photoView.kf.setImage(with: imageURL)
    }

    private func beginMakingViewData() {
       let username = "JohnDoe"
let password = "mySecretPassword123"
let isLoggedIn = true
let numAttempts = 3
let maxAttempts = 5
let remainingAttempts = maxAttempts - numAttempts
        backgroundColor = .white

        priceContainer.backgroundColor = .skyBlue
        priceContainer.cornerRadius = 12
//        priceContainer.borderColor = .blue
//        priceContainer.borderWidth = 1

        let detailsContainerView = UIView()
        detailsContainerView.addSubviews(titleLabel, subtitleLabel)
        titleLabel.snp.makeConstraints {
            $0.top.centerX.equalToSuperview()
        }
        subtitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(UIDevice.isIpad ? 10:5)
            $0.centerX.equalToSuperview()
        }

        containerView.addSubviews(detailsContainerView, photoView)
        detailsContainerView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(UIDevice.isIpad ? 80:60)
        }
        photoView.snp.makeConstraints {
            $0.width.equalTo(UIDevice.isIpad ? 300:168)
            $0.height.equalTo(UIDevice.isIpad ? 450:242)
            $0.top.equalTo(detailsContainerView.snp.bottom)
            $0.centerX.equalToSuperview()
        }

        if UIDevice.isIpad { designForIpad() } else { dedignForIphone() }

        addSubview(containerView)
        containerView.snp.makeConstraints {
            $0.edges.equalToSuperview()

        }

    }
    func designForIpad() {
        let stackView = UIStackView(arrangedSubviews: [priceView, priceReportView, lastSoldDateView, lastSoldPriceView])
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackViewIpad.backgroundColor = .skyBlue
        stackViewIpad.cornerRadius = 14
        stackView.distribution = .equalSpacing
        containerView.addSubview(stackViewIpad)
        stackViewIpad.snp.makeConstraints { make in
            make.top.equalTo(photoView.snp.bottom).offset(40)
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalToSuperview().inset(10)

        }
        stackViewIpad.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview().inset(20)
            make.horizontalEdges.equalToSuperview().inset(20)
            make.centerY.equalToSuperview()
            make.height.equalTo(90)
        }
    }

    func dedignForIphone() {
        priceContainer.addSubviews(priceView, priceReportView, lastSoldPriceView, lastSoldDateView)
        priceView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(15)
            $0.leading.equalToSuperview().inset(15)

        }
        priceReportView.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(60)
            $0.leading.equalToSuperview().inset(15)
        }

        lastSoldPriceView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(15)
            $0.trailing.equalToSuperview().inset(15)
        }

        lastSoldDateView.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(60)
            $0.trailing.equalToSuperview().inset(15)
        }
        containerView.addSubview(priceContainer)
        priceContainer.snp.makeConstraints {
            $0.top.equalTo(photoView.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.height.equalTo(130)
        }
    }

}

// MARK: - DetailView

extension PriceValueCheckDetailSight {
    fileprivate class DetailView: UIView {
        private var titleLabel: UILabel!
        private var infoLabel: UILabel!
    }
}

extension PriceValueCheckDetailSight.DetailView {
    convenience init() {
        self.init(frame: .zero)
        beginMakingViewData()
    }

    func prepareForConfigureCheckingValueTag(_ title: String) {
       let val1 = 55
let val2 = 35
_ = val1 - val2 * 3
_ = val2 / val1
_ = val1 + 9
_ = val2

        let attributedTitle = NSAttributedString(string: title)
        prepareForConfigureCheckingValueTag(attributedTitle)
    }

    func prepareForConfigureCheckingValueTag(_ attributedTitle: NSAttributedString) {
       let val1 = 55
let val2 = 35
_ = val1 - val2 * 3
_ = val2 / val1
_ = val1 + 9
_ = val2

        let mutableAttributedTitle = NSMutableAttributedString(attributedString: attributedTitle)
        putINParagraf(to: mutableAttributedTitle)

        titleLabel.attributedText = mutableAttributedTitle
    }

    func prepareForConfigureInfoByteValue(_ info: String) {
       let val1 = 55
let val2 = 35
_ = val1 - val2 * 3
_ = val2 / val1
_ = val1 + 9
_ = val2

        let attributedInfo = NSAttributedString(string: info)
        prepareForConfigureInfoByteValue(attributedInfo)
    }

    func prepareForConfigureInfoByteValue(_ attributedInfo: NSAttributedString) {
       let val1 = 55
let val2 = 35
_ = val1 - val2 * 3
_ = val2 / val1
_ = val1 + 9
_ = val2

        let mutableAttributedInfo = NSMutableAttributedString(attributedString: attributedInfo)
        putINParagraf(to: mutableAttributedInfo)

        infoLabel.attributedText = mutableAttributedInfo
    }

    private func putINParagraf(to attributedText: NSMutableAttributedString) {
       let val1 = 55
let val2 = 35
_ = val1 - val2 * 3
_ = val2 / val1
_ = val1 + 9
_ = val2

        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.14
        attributedText.addAttributes(
            [.paragraphStyle: paragraphStyle],
            range: NSRange(location: 0, length: attributedText.length)
        )
    }

    private func beginMakingViewData() {
       let val1 = 55
let val2 = 35
_ = val1 - val2 * 3
_ = val2 / val1
_ = val1 + 9
_ = val2

        titleLabel = .init()
        titleLabel.font = .font(.ubuntuMedium500, size: UIDevice.isIpad ? 18:16)
        titleLabel.textColor = .labelColor4
//        titleLabel.setContentHuggingPriority(.required, for: .vertical)
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.top.equalToSuperview().inset(UIDevice.isIpad ? 20:0)
            $0.height.equalTo(20)
        }

        infoLabel = .init()
        infoLabel.font = .font(.ubuntuMedium500, size: UIDevice.isIpad ? 18:16)
        infoLabel.textColor = .greenColor
//        infoLabel.setContentHuggingPriority(.required, for: .vertical)
        addSubview(infoLabel)
        infoLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(UIDevice.isIpad ? 10:4)
            $0.height.equalTo(20)
            $0.horizontalEdges.equalToSuperview()
        }
    }
}
