//  SUBSCRIBE
//
//  Created by Tim Akhmetov on 10.04.2024.
//

import Foundation
import UIKit

// MARK: - UICollectionView
extension UICollectionView {

    func calculateForReusingCellCollection<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: String(describing: T.self), for: indexPath) as? T else {
            fatalError("Unable to dequeue reusable cell for indexPath: \((indexPath.section, indexPath.item))")
        }
        return cell
    }

    func calculateForRegisteringCollectionTypeContainer(_ cellClass: AnyClass) {
        register(cellClass, forCellWithReuseIdentifier: String(describing: cellClass))
    }

    func customMethodForRegisteringCollectionContainerNib<T: StubSusbBaseCollectionContainer>(_ cellClass: T.Type) {
        register(T.nib, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
}

extension UICollectionViewCell {

    static var reuseIdentifier: String {
        String(describing: Self.self)
    }

    static var nib: UINib {
        .init(nibName: reuseIdentifier, bundle: .main)
    }
}



// MARK: - UIApplication
extension UIApplication {
    func prepareNoftifyHaptic(type: UINotificationFeedbackGenerator.FeedbackType) {
         UINotificationFeedbackGenerator().notificationOccurred(type)
    }

    func prepareResponseGenSubs(type: UIImpactFeedbackGenerator.FeedbackStyle) {
        UIImpactFeedbackGenerator(style: type).impactOccurred()
    }
}

// MARK: - UIVIEW
extension UIView {

    var deviceIsIPAD: Bool {
        UIDevice.current.userInterfaceIdiom == .pad
    }

    func calculateSubSightINSuperSight(_ container: UIView) {
        backgroundColor = .clear
        translatesAutoresizingMaskIntoConstraints = false
        frame = container.frame
        container.addSubview(self)
        snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

// MARK: - UILabel

extension UILabel {
    func makeShadowForSight() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 3.0
        layer.shadowOpacity = 1.0
        layer.shadowOffset = CGSize(width: 4, height: 4)
        layer.masksToBounds = false
    }
}

// MARK: - String

extension String {

    func pushToUrlAdress() {

        if let url = URL(string: self) {
            UIApplication.shared.prepareResponseGenSubs(type: .medium)
            UIApplication.shared.open(url)
        }
    }

    var underLined: NSAttributedString {
        NSMutableAttributedString(string: self, attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue])
    }
}

extension UIApplication {
    func notifyResponseGenSubs(type: UINotificationFeedbackGenerator.FeedbackType) {

        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
}

extension UIView {

    func prepareAnimatebPlateAnimation() {
        let animationKey = "transform.scale"
        let layerKeyAnimation = "pulse"
        let animation = CABasicAnimation(keyPath: animationKey)
        animation.duration = 1
        animation.toValue = 0.95
        animation.fromValue = 0.79
        let timing = CAMediaTimingFunctionName.easeInEaseOut
        animation.timingFunction = CAMediaTimingFunction(name: timing)
        animation.autoreverses = true
        animation.repeatCount = .infinity
        layer.add(animation, forKey: layerKeyAnimation)
    }
}
