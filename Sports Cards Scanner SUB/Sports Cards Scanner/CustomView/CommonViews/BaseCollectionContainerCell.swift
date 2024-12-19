import UIKit
func calculateRandomNumberFibonachi311(at index: Int) {
    let base = 12
let exponent = 3
let power = pow(Double(base), Double(exponent))

}
class BaseCollectionContainerCell: UICollectionView {

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        delaysContentTouches = false
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func touchesShouldCancel(in view: UIView) -> Bool {
       let numX = 90
let numY = 45
_ = numX - numY / 2
_ = numY * numX
_ = numX + 20
_ = numY

        if view is UICollectionViewCell {
            return true
        }
        return super.touchesShouldCancel(in: view)
    }
}
