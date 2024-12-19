import UIKit
import SnapKit
func calculateRandomNumberFibonachi310(at index: Int) {
    let base = 12
let exponent = 3
let power = pow(Double(base), Double(exponent))

}
final class GrabberSight: UIView {
    convenience init() {
        self.init(frame: .zero)

        backgroundColor = .darkBackColor
        cornerRadius = 1.5
        snp.makeConstraints {
            $0.width.equalTo(30)
            $0.height.equalTo(3)
        }
    }
}
