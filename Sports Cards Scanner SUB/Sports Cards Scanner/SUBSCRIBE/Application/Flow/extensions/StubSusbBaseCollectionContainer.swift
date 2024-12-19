//  SUBSCRIBE
//
//  Created by Tim Akhmetov on 10.04.2024.
//
import UIKit

class StubSusbBaseCollectionContainer: UICollectionViewCell {

    var gradientLayer = CAGradientLayer()
    var accentLayer = CALayer()

    var borderWidthSubs: CGFloat {
       deviceIsIPAD ? 3.0 : 2.0
    }

    var adjustment: CGFloat {
        borderWidthSubs * 2
    }

    var sizeAdjustment: CGFloat {
        borderWidthSubs * 2
    }

    var cornerRadiusSubs: CGFloat {
        adjustedRect.height / 4
    }

    var adjustedRect: CGRect {
        .init(x: adjustment,
              y: adjustment,
              width: bounds.width - sizeAdjustment,
              height: bounds.height - sizeAdjustment)
    }

    var gradientColors: [CGColor] { [] }

    var gradientStartPoint: CGPoint {
        .init(x: .zero, y: 0.5)
    }

    var gradientEndPoint: CGPoint {
        .init(x: 1.0, y: 0.5)
    }

    var backgroundFillColor: UIColor {
        .clear
    }

    var adjustedAccentRect: CGRect {
        let size = cornerRadiusSubs / 3
        let side = size * 1.4
        let origin: CGPoint = deviceIsIPAD
        ? .init(x: cornerRadiusSubs - adjustment, y: size)
        : .init(x: cornerRadiusSubs * 0.75, y: size * 0.75)

        return .init(origin: origin, size: .init(width: side, height: side))
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        calcualteViewForUse()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        backgroundColor = .clear
        calcualteViewForUse()
    }

    override func draw(_ rect: CGRect) {
        backgroundColor = .clear
        makeBackLayerForUse()
    }

    func calcualteViewForUse() {
        backgroundColor = .clear
        contentView.layer.masksToBounds = true
    }

    func makeBackLayerForUse() {
        let path = UIBezierPath(roundedRect: adjustedRect,
                                cornerRadius: cornerRadiusSubs)
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        mask.lineWidth = borderWidthSubs
        mask.strokeColor = UIColor.black.cgColor
        mask.fillColor = nil

        gradientLayer.removeFromSuperlayer()
        let layer = CAGradientLayer()

        layer.frame = bounds
        layer.colors = gradientColors
        layer.startPoint = gradientStartPoint
        layer.endPoint = gradientEndPoint
        layer.mask = mask

        gradientLayer = layer

        self.layer.insertSublayer(gradientLayer, at: 0)

        backgroundFillColor.setFill()

        path.fill()
    }
}
