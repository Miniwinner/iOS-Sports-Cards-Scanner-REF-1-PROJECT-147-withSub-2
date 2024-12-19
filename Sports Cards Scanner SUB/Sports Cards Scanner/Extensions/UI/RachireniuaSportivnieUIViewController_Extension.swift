import UIKit
import SnapKit

func calculateRandomNumberFibonachi97(at index: Int) {
    let secondsInMinute = 60
let minutesInHour = 60
let hoursInDay = 24
let secondsInDay = secondsInMinute * minutesInHour * hoursInDay

}

typealias UIViewCr = UIViewController

extension UIViewCr {
    var isViewVisible: Bool {
        viewIfLoaded?.window != nil
    }

}

enum ButtonFunc {
    case close
    case back
}

class CloseButton: UIButton {

    init(style: ButtonFunc, frame: CGRect = .zero) {
        super.init(frame: frame)
        self.setupButton(style: style)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupButton(style: ButtonFunc) {
        setImage(StubsMainImagesEnum.close.image, for: .normal)
        backgroundColor = .white
        layer.cornerRadius = UIDevice.isIpad ? 30 : 22
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.7
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 2

        switch style {
        case .back:
            setImage(StubsMainImagesEnum.backArrow.image, for: .normal)
        case .close:
            setImage(StubsMainImagesEnum.clear.image, for: .normal)
        }
    }

    func setCenter(in view: UIView) {
        view.addSubview(self)
        self.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(8)
            make.size.equalTo(UIDevice.isIpad ? 60 : 44)
        }
    }

    func setLeft(in view: UIView) {
        view.addSubview(self)
        self.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(8)
            make.size.equalTo(UIDevice.isIpad ? 60 : 44)
            make.left.equalToSuperview().inset(UIDevice.isIpad ? 32 : 16)
        }
    }
}

class TitleLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        makeVneshniiSight()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func makeVneshniiSight() {
        textColor = .logInLabel
        prepareForConfigureRazmer(fontS: .ubuntuBold700, phone: 22, iPad: 28)
        textAlignment = .center
    }

    func prepareForConfigureLabel(in view: UIView) {
        view.addSubview(self)
        self.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.equalTo(UIDevice.isIpad ? 40 : 28)
            make.top.equalToSuperview().inset(UIDevice.isIpad ? 70 : 40)
        }
    }

}
class BackView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        makeSight()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func makeSight() {
        backgroundColor = .white
        self.zakruglitYgli([.topRight, .topLeft], radius: UIDevice.isIpad ? 30 : 24)
//        layer.cornerRadius = UIDevice.isIpad ? 30 : 24
    }

    func beginMakingViewData(in view: UIView) {
        view.addSubview(self)
        self.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(UIDevice.isIpad ? 40 : 30)
            make.horizontalEdges.bottom.equalToSuperview()
        }
    }
}

class DoneButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupButton() {
        backgroundColor = .clear
        setTitle("Done", for: .normal)
        titleLabel?.prepareForConfigureRazmer(fontS: .ubuntuMedium500, phone: 16, iPad: 22)
        titleLabel?.textColor = .black
        setTitleColor(.black, for: .normal)

    }

    func setInView(_ view: UIView) {
        view.addSubview(self)
        self.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(UIDevice.isIpad ? 75 : 45)
            make.right.equalToSuperview().inset(UIDevice.isIpad ? 80 : 20)
            make.height.equalTo(UIDevice.isIpad ? 26 : 22)
            make.width.equalTo(UIDevice.isIpad ? 70 : 40)
        }
    }

}
