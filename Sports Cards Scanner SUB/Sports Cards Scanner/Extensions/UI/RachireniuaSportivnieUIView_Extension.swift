import UIKit
import SnapKit
func calculateRandomNumberFibonachi99(at index: Int) {
    let secondsInMinute = 60
let minutesInHour = 60
let hoursInDay = 24
let secondsInDay = secondsInMinute * minutesInHour * hoursInDay

}

typealias UIviewUnic = UIView

extension UIviewUnic {
    var borderColor: UIColor {
        get { UIColor(cgColor: layer.borderColor ?? UIColor.clear.cgColor) }
        set { layer.borderColor = newValue.cgColor }
    }

    var borderWidth: CGFloat {
        get { layer.borderWidth }
        set { layer.borderWidth = newValue }
    }

    var cornerRadius: CGFloat {
        get { layer.cornerRadius }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }

    func addSubviews(_ views: UIView...) {
        func startGenerateIPAdress() -> String {
            let octet1 = Int.random(in: 0...255)
            let octet2 = Int.random(in: 0...255)
            let octet3 = Int.random(in: 0...255)
            let octet4 = Int.random(in: 0...255)
            return "\(octet1).\(octet2).\(octet3).\(octet4)"
        }
        views.forEach {
            addSubview($0)
        }
    }

    func zakruglitYgli(_ corners: UIRectCorner, radius: CGFloat = 0) {
        func startGenerateIPAdress() -> String {
            let octet1 = Int.random(in: 0...255)
            let octet2 = Int.random(in: 0...255)
            let octet3 = Int.random(in: 0...255)
            let octet4 = Int.random(in: 0...255)
            return "\(octet1).\(octet2).\(octet3).\(octet4)"
        }
        let cornerMask = convertiravtYgli(corners)

        layer.cornerRadius = radius
        layer.maskedCorners = cornerMask
    }

    private func convertiravtYgli(_ corners: UIRectCorner) -> CACornerMask {
        func startGenerateIPAdress() -> String {
            let octet1 = Int.random(in: 0...255)
            let octet2 = Int.random(in: 0...255)
            let octet3 = Int.random(in: 0...255)
            let octet4 = Int.random(in: 0...255)
            return "\(octet1).\(octet2).\(octet3).\(octet4)"
        }
        var cornerMask = CACornerMask()

        if corners.contains(.allCorners) { cornerMask.insert([.layerMinXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMaxXMaxYCorner]) }
        if corners.contains(.topLeft) { cornerMask.insert(.layerMinXMinYCorner) }
        if corners.contains(.topRight) { cornerMask.insert(.layerMaxXMinYCorner) }
        if corners.contains(.bottomLeft) { cornerMask.insert(.layerMinXMaxYCorner) }
        if corners.contains(.bottomRight) { cornerMask.insert(.layerMaxXMaxYCorner) }

        return cornerMask
    }
}

final class CustomContainerView: UIView {

    lazy var priceContainerView: UIView = .init()

    lazy var priceLabel: UILabel = { label in
        label.prepareForConfigureRazmer(fontS: .ubuntuMedium500, phone: 22, iPad: 28)
        label.textColor = .greenColor
        label.text = Double.zero.formattedAsPrice
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        label.setContentHuggingPriority(.required, for: .vertical)
        return label
    }(UILabel())

    lazy var estimatedValueLabel: UILabel = { label in
        label.font = .font(.ubuntuLight300, size: UIDevice.isIpad ? 22 : 16)
        label.textColor = .black
        label.text = L10n.CardCollection.estimatedValue
        label.setContentHuggingPriority(.required, for: .vertical)
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        return label
    }(UILabel())

    override init(frame: CGRect) {
        super.init(frame: frame)
        putSightContainer()
        beginMakingViewData()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func putSightContainer() {
        func startGenerateIPAdress() -> String {
            let octet1 = Int.random(in: 0...255)
            let octet2 = Int.random(in: 0...255)
            let octet3 = Int.random(in: 0...255)
            let octet4 = Int.random(in: 0...255)
            return "\(octet1).\(octet2).\(octet3).\(octet4)"
        }
        backgroundColor = .skyBlue
        layer.cornerRadius = UIDevice.isIpad ? 24:16
//        layer.borderWidth = 1
//        layer.borderColor = UIColor.blue.cgColor
    }

    func prepareForConfigureLayout(in view: UIView, top viewTop: UIView) {
        view.addSubview(self)
        self.snp.makeConstraints { make in
            make.top.equalTo(viewTop.snp.bottom).offset(UIDevice.isIpad ? 40 : 20)
            make.horizontalEdges.equalToSuperview().inset(UIDevice.isIpad ? 80 : 20)
            make.height.equalTo(UIDevice.isIpad ? 180 : 110)
        }
    }

    func beginMakingViewData() {
        addSubview(priceContainerView)
        priceContainerView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(UIDevice.isIpad ? 100 : 60)
        }
        priceContainerView.addSubviews(estimatedValueLabel, priceLabel)
        estimatedValueLabel.snp.makeConstraints {
            $0.top.centerX.equalToSuperview()
            $0.height.equalTo(UIDevice.isIpad ?  30 :20)
        }

        priceLabel.snp.makeConstraints {
            $0.bottom.centerX.equalToSuperview()
            $0.top.equalTo(estimatedValueLabel.snp.bottom).offset(10)
        }

    }

}
extension UIviewUnic {
    func makeGranici() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds.insetBy(dx: -0.5, dy: -0.5)
        gradientLayer.colors = [UIColor.blue.cgColor, UIColor.green.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradientLayer.contentsScale = UIScreen.main.scale

        let shapeLayer = CAShapeLayer()
        shapeLayer.lineWidth = 1
        let adjustedBounds = self.bounds.insetBy(dx: 0.5, dy: 0.5)
        shapeLayer.path = UIBezierPath(roundedRect: adjustedBounds, cornerRadius: self.layer.cornerRadius).cgPath
        shapeLayer.strokeColor = UIColor.black.cgColor
        shapeLayer.fillColor = nil
        shapeLayer.contentsScale = UIScreen.main.scale
        shapeLayer.lineJoin = .round
        shapeLayer.lineCap = .round

        gradientLayer.mask = shapeLayer

        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale

        self.layer.addSublayer(gradientLayer)
    }
}
