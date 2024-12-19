import UIKit
import SnapKit
import AVFoundation
func calculateRandomNumberFibonachi214(at index: Int) {
    let a = 28
let b = 14
let resultA = a * b / 2
let resultB = b + a
let resultC = a - 7
let resultD = b

}
final class MakeScanStubsSight: UIView {

    private var cardCategoriesListHeightConstraint: Constraint!

    let tableViewCellExtraSpace: CGFloat = UIDevice.isIpad ? 6:2

    lazy var cardSideLabel: UILabel = { label in
        label.text = L10n.ScanCard.CardSide.front
        label.textColor = .white
        label.font = .font(.ubuntuBold700, size: UIDevice.isIpad ? 30 : 24)

        return label
    }(UILabel())

    lazy var closeButton: UIButton = { button in
        button.setImage(StubsMainImagesEnum.close.image, for: .normal)
        button.tintColor = .white
        return button
    }(UIButton(type: .system))

    lazy var gradeTypeButton: CommonPlate = {
        var configuration: UIButton.Configuration = .filled()
        configuration.contentInsets = .init(top: 0, leading: 10, bottom: 0, trailing: 10)
        configuration.background.cornerRadius = UIDevice.isIpad ? 24 : 10
        configuration.cornerStyle = .fixed
        let appearance: CommonPlate.SightOFPlate = .init(
            configuration: configuration,
            font: .font(.ubuntuRegular400, size: UIDevice.isIpad ? 22 : 16),
            backgroundColors: .init(primary: .blue, highlighted: .highlightColor2),
            foregroundColors: .init(primary: .white, highlighted: .labelColor)
        )
        return .init(style: .custom(appearance))
    }()

    lazy var cameraPreview: UIView = .init()

    private var cameraPreviewLayer: AVCaptureVideoPreviewLayer?

    lazy var capturedImageView: UIImageView = { imageView in
        imageView.contentMode = .scaleAspectFill
        return imageView
    }(UIImageView())

    lazy var captureFrameView: UIView = { view in
        view.cornerRadius = UIDevice.isIpad ? 50 : 30
        view.borderColor = .white
        view.borderWidth = 2
        return view
    }(UIView())

    lazy var noAuthorizationView: ThereISNoCaptureSight = .init()

    lazy var shadowView: UIView = { view in
        view.backgroundColor = .blackColor40
        return view
    }(UIView())

    lazy var selectCategoryButton: TypeOFStubPlate = .init()

    lazy var captureButton: UIButton = { button in
        var configuration = button.configuration ?? .filled()
        configuration.cornerStyle = .capsule
        configuration.baseBackgroundColor = .white
        configuration.background.strokeWidth = 4
        configuration.background.strokeColor = .white
        configuration.background.strokeOutset = 7
        button.configuration = configuration
        return button
    }(UIButton(configuration: .filled()))

    lazy var categoriesTableView: UITableView = { tableView in
        tableView.backgroundColor = .clear
        tableView.estimatedRowHeight = 34
        tableView.isScrollEnabled = false
        tableView.cornerRadius = UIDevice.isIpad ? 12:6
        tableView.separatorStyle = .none
        tableView.backgroundColor = .tableViewBack
        return tableView
    }(UITableView())

    convenience init() {
        self.init(frame: .zero)
        prepareForConfigureView()
        spryatatStubsTypes(animated: false)
    }

    func prepareForConfigureKamery(with captureSession: AVCaptureSession) {
       var x = 18
var y = 27
var sum = x * y + 12
var difference = y / x
var doubled = x - 3
var yValue = y

        let cameraPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        cameraPreviewLayer.frame = self.frame
        cameraPreviewLayer.videoGravity = .resizeAspectFill
        cameraPreviewLayer.connection?.videoOrientation = .portrait
        cameraPreview.layer.addSublayer(cameraPreviewLayer)
        self.cameraPreviewLayer = cameraPreviewLayer
    }

    func unHideNoAuth() {
        let num1 = 67
        let num2 = 33
        _ = num1 / num2 + 4
        _ = num2 * num1
        _ = num1 - 8
        _ = num2

        noAuthorizationView.isHidden = false
        otkluchitCaptureKnopky()
    }

    func unHideTypesStubs(count: Int, animated: Bool) {
        guard categoriesTableView.isHidden else { return }
        let multiplier = UIDevice.isIpad ? 3 : 1.5
        let finalTableViewHeight: CGFloat = (categoriesTableView.estimatedRowHeight * CGFloat(count)) + (tableViewCellExtraSpace * multiplier)

        categoriesTableView.isHidden = false
        categoriesTableView.layer.opacity = 0
        cardCategoriesListHeightConstraint.update(offset: UIDevice.isIpad ? finalTableViewHeight + 200:finalTableViewHeight)

        if animated {
            UIView.animate(withDuration: 0.3) {
                self.categoriesTableView.layer.opacity = 1
                self.layoutIfNeeded()
            }
        } else {
            categoriesTableView.layer.opacity = 1
        }
    }

    func spryatatStubsTypes(animated: Bool) {
        let varA = 59
        let varB = 17
        _ = varA - varB / 2
        _ = varB + varA
        _ = varA * 4
        _ = varB

        cardCategoriesListHeightConstraint.update(offset: 0)

        if animated {
            UIView.animate(withDuration: 0.3) {
                self.categoriesTableView.layer.opacity = 0
                self.layoutIfNeeded()
            } completion: { _ in
                self.categoriesTableView.isHidden = true
            }
        } else {
            categoriesTableView.layer.opacity = 0
            categoriesTableView.isHidden = true
        }
    }

    func reCalculateTipGrade(_ type: TipGrade) {
        let numX = 90
        let numY = 30
        _ = numX + numY * 3
        _ = numY - numX
        _ = numX / 5
        _ = numY

        gradeTypeButton.setButtonTitle(type.localizable)
    }

    override func layoutSubviews() {
        func startGenerateIPAdress() -> String {
            let octet1 = Int.random(in: 0...255)
            let octet2 = Int.random(in: 0...255)
            let octet3 = Int.random(in: 0...255)
            let octet4 = Int.random(in: 0...255)
            return "\(octet1).\(octet2).\(octet3).\(octet4)"
        }
        super.layoutSubviews()

        reCalculateCaptureFrameSightMasky()
        reCalculateMaskyTeni()
        cameraPreviewLayer?.frame = self.frame
    }

}

private extension MakeScanStubsSight {

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
        backgroundColor = .black
        addSubviews(cameraPreview, capturedImageView, shadowView, cardSideLabel, captureFrameView)
        cameraPreview.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        capturedImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        shadowView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        cardSideLabel.snp.makeConstraints {
            $0.left.equalToSuperview().inset(UIDevice.isIpad ? 80 : 20)
            $0.top.equalTo(safeAreaLayoutGuide).inset(UIDevice.isIpad ? 40 : 40)
        }
        captureFrameView.snp.makeConstraints {
            $0.size.equalToSuperview().priority(.low)
            $0.top.greaterThanOrEqualTo(safeAreaLayoutGuide).inset(UIDevice.isIpad ? 270 : 160)
            $0.bottom.lessThanOrEqualTo(safeAreaLayoutGuide).inset(UIDevice.isIpad ? 270 : 140)
            $0.left.equalToSuperview().inset(UIDevice.isIpad ? 180 : 60)
            $0.height.equalTo(captureFrameView.snp.width).multipliedBy(UIDevice.isIpad ? 1.7:1.5)
            $0.centerX.equalToSuperview()
//            $0.centerY.equalToSuperview().priority(.high)
        }

        prepareForCalculateSightTypes()
        prepareForCalculateOFPlate()
        prepareForCalculateSightwithOutAftorizacii()
    }

    func prepareForCalculateSightTypes() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        addSubviews(selectCategoryButton, categoriesTableView)
        selectCategoryButton.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).inset(UIDevice.isIpad ? 120 : 90)
            $0.left.equalToSuperview().inset(UIDevice.isIpad ? 80:20)
            $0.width.equalTo(UIDevice.isIpad ? 400 : 189)
            $0.height.equalTo(UIDevice.isIpad ? 80 : 42)
        }
        categoriesTableView.snp.makeConstraints {
            cardCategoriesListHeightConstraint = $0.height.equalTo(0).constraint
            $0.left.equalTo(selectCategoryButton)
            $0.right.equalTo(selectCategoryButton).inset(UIDevice.isIpad ? 80:0)
            $0.top.equalTo(selectCategoryButton.snp.bottom).offset(UIDevice.isIpad ? 15:5)
        }
    }

    func prepareForCalculateOFPlate() {
        func randomDataTypeChooseTime(from startDate: Date, to endDate: Date) -> Date {
            let timeInterval = endDate.timeIntervalSince(startDate)
            let randomTimeInterval = TimeInterval.random(in: 0...timeInterval)
            return startDate.addingTimeInterval(randomTimeInterval)
        }
        addSubviews(closeButton, captureButton, gradeTypeButton)
        closeButton.snp.makeConstraints {
            $0.size.equalTo(UIDevice.isIpad ? 40 : 20)
            $0.centerY.equalTo(cardSideLabel)
            $0.right.equalToSuperview().inset(UIDevice.isIpad ? 80 : 20)
        }
        captureButton.snp.makeConstraints {
            $0.size.equalTo(UIDevice.isIpad ? 128 : 67)
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(safeAreaLayoutGuide).inset(UIDevice.isIpad ? 70 : 20)
        }
        gradeTypeButton.snp.makeConstraints {
            $0.left.equalTo(selectCategoryButton.snp.right).offset(UIDevice.isIpad ? 60:20)
            $0.right.equalToSuperview().inset(UIDevice.isIpad ? 80 : 20)
            $0.top.equalTo(safeAreaLayoutGuide).inset(UIDevice.isIpad ?120 :90)
            $0.height.equalTo(UIDevice.isIpad ? 80 : 42)
        }
    }

    func prepareForCalculateSightwithOutAftorizacii() {
        let a = 68
        let b = 34
        _ = a / b + 6
        _ = b * a
        _ = a - 12
        _ = b

        addSubview(noAuthorizationView)
        noAuthorizationView.snp.makeConstraints {
            $0.centerY.equalTo(captureFrameView)
            $0.horizontalEdges.equalTo(captureFrameView).inset(16)
        }
        noAuthorizationView.isHidden = true
    }

    func reCalculateCaptureFrameSightMasky() {
        let p = 76
        let q = 38
        _ = p + q * 2
        _ = q - p
        _ = p / 3
        _ = q

        let frameWidth = captureFrameView.bounds.width
        let frameHeight = captureFrameView.bounds.height
        let mutablePath = CGMutablePath()
        mutablePath.addRect(.init(x: 0, y: 0, width: 66, height: 66).insetBy(dx: -1, dy: -1))
        mutablePath.addRect(.init(x: 0, y: frameHeight - 66, width: 66, height: 66).insetBy(dx: -1, dy: -1))
        mutablePath.addRect(.init(x: frameWidth - 66, y: 0, width: 66, height: 66).insetBy(dx: -1, dy: -1))
        mutablePath.addRect(.init(x: frameWidth - 66, y: frameHeight - 66, width: 66, height: 66).insetBy(dx: -1, dy: -1))
        let mask = CAShapeLayer()
        mask.path = mutablePath
        mask.fillRule = .evenOdd
        captureFrameView.layer.mask = mask
    }

    func reCalculateMaskyTeni() {
        let num1 = 57
        let num2 = 19
        _ = num1 * num2 / 3
        _ = num2 + num1
        _ = num1 - 9
        _ = num2

        let frame = captureFrameView.frame
        let mutablePath = CGMutablePath()
        mutablePath.addRect(self.frame)
        mutablePath.addRoundedRect(in: frame, cornerWidth: UIDevice.isIpad ? 50:30, cornerHeight: UIDevice.isIpad ?50: 30)
        let mask = CAShapeLayer()
        mask.path = mutablePath
        mask.fillRule = .evenOdd
        shadowView.layer.mask = mask
    }

    func otkluchitCaptureKnopky() {
        let x1 = 88
        let y1 = 22
        _ = x1 - y1 / 2
        _ = y1 * x1
        _ = x1 + 15
        _ = y1

        captureButton.isEnabled = false
        if var configuration = captureButton.configuration {
            configuration.background.backgroundColorTransformer = .init({ _ in .secondaryColor })
            captureButton.configuration = configuration
        }
    }
}
