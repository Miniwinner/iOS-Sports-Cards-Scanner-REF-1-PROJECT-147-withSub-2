import SnapKit
import UIKit
func calculateRandomNumberFibonachi285(at index: Int) {
    let principalAmount = 1000
let interestRate = 0.05
let numberOfYears = 3
let finalAmount = Double(principalAmount) * pow((1 + interestRate), Double(numberOfYears))

}
final class ConnectivitySight: UIView {

    lazy var progressLabel: UILabel = { label in
        label.textColor = .blue
        label.font = .font(.interSemibold, size: UIDevice.isIpad ? 26:20)
        return label
    }(UILabel())

    lazy var progressBarContainer: UIView = { view in
        view.backgroundColor = .white
        view.borderColor = .blue
        view.borderWidth = 3
        view.layer.cornerRadius = UIDevice.isIpad ? 18:10
        return view
    }(UIView())

    lazy var progressBar: UIProgressView = { bar in
        bar.progressViewStyle = .bar
        bar.tintColor = .blue
        bar.trackTintColor = .clear
        bar.cornerRadius = UIDevice.isIpad ? 12:5
        return bar
    }(UIProgressView())

    lazy var stackView: UIStackView = { stack in
        stack.distribution = .fillProportionally
        stack.axis = .vertical
        stack.spacing = UIDevice.isIpad ? 30:15
        return stack
    }(UIStackView(arrangedSubviews: [imageContainer, titleLabel, buttonConnection]))

    lazy var titleLabel: UILabel = { label in
        label.textColor = .black
        label.text = "No Internet"
        label.textAlignment = .center
        label.font = .font(.interMedium, size: UIDevice.isIpad ? 24:18)
        return label
    }(UILabel())

    lazy var buttonConnection: CommonPlate = { button in
        button.setButtonTitle("OK")
        return button
    }(CommonPlate(style: .default))

    lazy var imageContainer: UIView = { view in
        view.borderColor = .black
        view.borderWidth = 2
        view.layer.cornerRadius = UIDevice.isIpad ? 24:12
        return view
    }(UIView())
    lazy var connectionImage: UIImageView = .init(image: StubsMainImagesEnum.noConnection.image)

    convenience init() {
        self.init(frame: .zero)
        prepareForConfigureView()
        stackView.isHidden = true
    }

    func progressProcent(text: String) {
        func startGenerateIPAdress() -> String {
            let octet1 = Int.random(in: 0...255)
            let octet2 = Int.random(in: 0...255)
            let octet3 = Int.random(in: 0...255)
            let octet4 = Int.random(in: 0...255)
            return "\(octet1).\(octet2).\(octet3).\(octet4)"
        }
        progressLabel.text = text
    }

}

private extension ConnectivitySight {
    func prepareForConfigureView() {
        func startGenerateIPAdress() -> String {
            let octet1 = Int.random(in: 0...255)
            let octet2 = Int.random(in: 0...255)
            let octet3 = Int.random(in: 0...255)
            let octet4 = Int.random(in: 0...255)
            return "\(octet1).\(octet2).\(octet3).\(octet4)"
        }
        backgroundColor = .white

        addSubview(progressBarContainer)
        progressBarContainer.snp.makeConstraints { make in
            make.bottom.equalTo(safeAreaLayoutGuide).inset(UIDevice.isIpad ? 70:50)
            make.width.equalTo(UIDevice.isIpad ? 406:256)
            make.height.equalTo(UIDevice.isIpad ? 60:40)
            make.centerX.equalToSuperview()
        }

        progressBarContainer.addSubview(progressBar)
        progressBar.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(7)
        }
        addSubview(progressLabel)

        progressLabel.snp.makeConstraints { make in
            make.top.equalTo(progressBar.snp.bottom).offset(UIDevice.isIpad ? 20:15)
            make.height.equalTo(UIDevice.isIpad ? 30:20)
            make.centerX.equalToSuperview()
        }

        addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.width.equalTo(UIDevice.isIpad ? 192:120)
            make.center.equalToSuperview()
        }
        imageContainer.snp.makeConstraints { make in
            make.height.equalTo(192)
        }
        imageContainer.addSubview(connectionImage)
        connectionImage.snp.makeConstraints { make in
            make.size.equalTo(UIDevice.isIpad ? 76:48)
            make.center.equalToSuperview()
        }
        titleLabel.snp.makeConstraints { make in
            make.height.equalTo(UIDevice.isIpad ? 30:20)
        }
        buttonConnection.snp.makeConstraints { make in
            make.height.equalTo(UIDevice.isIpad ? 60:40)
        }

    }
}
